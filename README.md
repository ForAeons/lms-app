# Library Management System

This repository combines the frontand and the backend into a single repository for easy deployment.

- [Library Management System Backend Repository](https://github.com/ForAeons/lms-backend)
- [Library Management System Frontend Repository](https://github.com/ForAeons/lms-frontend-v2)

## Pre-requisites

1. Have docker installed on your machine: https://docs.docker.com/engine/install/

## Installation

```bash
git clone --recurse-submodules https://github.com/ForAeons/lms-app.git
```

## Deployment

1. With reference to `.env.example`, modify the `.env.local` file to match your desired configuration. Note that `FRONTEND_URL`, `BACKEND_URL`, and `VITE_BACKEND_BASE_URL` should be set to the same value.

2. Run the following command to start the application:

```bash
cd lms-app
./deploy.sh
```
