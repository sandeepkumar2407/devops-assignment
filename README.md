# DevOps Intern Assignment

This repository contains the code and documentation for deploying a simple Node.js web app on AWS EC2 using Docker.

## Steps

### 1. Setup and GitHub Repo

- Created a public GitHub repository: `https://github.com/sandeepkumar2407/devops-assignment`
- Cloned locally :
  ```
  git clone https://github.com/sandeepkumar2407/devops-assignment
  cd devops-assignment
  ```
  
### 2. Dockerize the Application

- Created a Node.js app (server.js and package.json)
- Created Dockerfile :
  ```
  FROM node:16
  WORKDIR /usr/src/app
  COPY package*.json ./
  RUN npm install
  COPY . .
  EXPOSE 3000
  CMD ["node", "server.js"]
  ```
- Built and ran Docker image locally :
  ```
  docker build -t devops-app .
  docker run -p 3000:3000 devops-app
  ```
  ![docker_image_build](https://github.com/user-attachments/assets/b6d72d78-dfa3-4a5f-a5ad-1491fda3dab7)
- Verified at http://localhost:3000 :
  ![local_docker](https://github.com/user-attachments/assets/60b44101-6b3f-453f-b117-5e3669749cdd)
  
### 3. Launch and Configure AWS EC2

- Launched an EC2 instance
  ![EC2_Instance_Initiated](https://github.com/user-attachments/assets/2e700a8c-ab49-4ac5-86aa-db458c907136)
- Moved key file :
  ```
  move devops-key.pem "C:\Users\M.SandeepKumar Reddy\.ssh\"
  ```
- Setting key permissions.SSH worked after fixing permissions.
- SSH to instance :
  ```
  ssh -i "/c/Users/M.SandeepKumar Reddy/.ssh/devops-key.pem" ec2-user@13.203.224.174
  ```
  ![ssh_session_login](https://github.com/user-attachments/assets/0ba31f2b-583a-497b-9040-77b6179ed342)
- Installed Docker on EC2 :
  ```
  sudo dnf install docker -y
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo usermod -a -G docker ec2-user
  ```
- Installed Git :
  ```
  sudo dnf install git -y
  ```
- Deployed App :
  ```
  git clone https://github.com/sandeepkumar2407/devops-assignment.git
  cd devops-assignment
  docker build -t devops-app .
  docker run -d -p 80:3000 devops-app
  ```
  ![EC2_docker_build](https://github.com/user-attachments/assets/2f171023-9034-4ecd-9821-8a83266cf678)
- Verified at http://13.203.224.174 :
  ![EC2_App](https://github.com/user-attachments/assets/81c862cd-c7db-4e58-a5a7-1e1125d0d2c9)
