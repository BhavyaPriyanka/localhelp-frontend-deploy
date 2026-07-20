# LocalHelp Frontend Deploy

This repository contains the deployment pipeline for the **LocalHelp Frontend** application.

The deployment is automated using **Jenkins, Terraform, Ansible, Nginx, and AWS**.

## Tech Stack

* Jenkins
* Terraform
* Ansible
* Nginx
* AWS EC2
* Nexus Repository

## Deployment Flow

1. Frontend CI pipeline builds the React application.
2. The build artifact is uploaded to Nexus Repository.
3. This deployment pipeline is triggered with the artifact version.
4. Terraform provisions/updates the infrastructure.
5. Ansible downloads the frontend artifact from Nexus.
6. The application is deployed to the Nginx web server.
7. Nginx serves the latest frontend application.

## Pipeline Parameter

| Parameter | Description                         |
| --------- | ----------------------------------- |
| VERSION   | Frontend artifact version to deploy |

## Notes

* Follows the **Build Once, Deploy Many** approach.
* The deployment server does **not** build the React application.
* The same artifact is deployed across all environments for consistency.
* Nginx serves the React application from `/usr/share/nginx/html`.
