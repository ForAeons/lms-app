FROM alpine:latest as base

RUN mkdir -p /app/temp
RUN mkdir -p /app/frontend
RUN addgroup app && adduser -S -G app app

USER root
RUN chown -R app:app /app
USER app

# Build frontend
FROM oven/bun:alpine AS frontend-builder

WORKDIR /app/temp

COPY lms-frontend/package.json lms-frontend/bun.lockb  ./
RUN bun install

COPY lms-frontend .
RUN bun run build

FROM base
 # Copy the built frontend to the backend
COPY --from=frontend-builder /app/temp/dist /app/frontend

# Build backend
FROM golang:1.22.1-alpine AS backend

WORKDIR /app

COPY lms-backend/go.mod lms-backend/go.sum ./
RUN go mod download

COPY lms-backend .
CMD ["go", "run", "main.go"]