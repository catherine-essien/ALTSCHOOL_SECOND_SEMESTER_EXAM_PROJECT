# TASK
## Deploy Laravel and Set up Postgresql

## Vagrant Setup
Install Vagrant on your local machine if you haven't already.
Create a directory for your project and navigate to it in the terminal.
Create a Vagrantfile for the "Master" and "Slave" servers. 

# DESCRIPTION
## Objective
This project is to automate the provisioning of two Ubuntu-based servers, "Master" and "Slave," using Vagrant. On the "Master" node, we will create a bash script to automate the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack. This script will clone a PHP application from GitHub, install all necessary packages, and configure Apache web server and PostgreSQL. We will ensure the bash script is reusable and readable. Using an Ansible playbook, we will execute the bash script on the "Slave" node and verify that the PHP application is accessible through the VM's IP address. Additionally, we will create a cron job to check the server's uptime every day at 12 AM.

## File Descriptions

1. **Vagrantfile**
   - **Description:** This file defines and configures the virtual machines for Vagrant.
   - **Purpose:** To automate the setup of "Master" and "Slave" Ubuntu-based servers.
   - **Content:** Contains VM configuration, such as base box, networking, and provisioning instructions.

2. **lamp.sh (Bash Deployment Script)**
   - **Description:** A bash script to automate the deployment of a LAMP stack with Laravel and PostgreSQL on the "Master" node.
   - **Purpose:** To install required packages, clone a PHP application from GitHub, and configure Apache and PostgreSQL.
   - **Content:** Includes commands to update packages, install Apache, PHP, PostgreSQL, clone the PHP app, and set up Apache and PostgreSQL.

3. **playbook.yaml (Ansible Playbook)**
   - * An Ansible playbook to automate the deployment and verification on the "Slave" node.
   - **Purpose:** Executes the bash script on the "Slave" node, verifies the application's accessibility, and creates a cron job.
   - **Content:** Defines tasks to copy and execute the bash script, verify application accessibility, and set up a daily cron job.

4. **Documentation.md (README)**
   - * A documentation file containing an overview of the project.
   - **Purpose:** To guide users through project objectives, prerequisites, and execution steps.
   - **Content:** Includes sections on the project's objective, prerequisites, step-by-step instructions, and additional details.

5. **screenshot.png (Screenshot Evidence)**
   - * A screenshot capturing the successful accessibility of the PHP application on the "Slave" node via its IP address.
   - **Purpose:** To visually demonstrate the successful deployment.
   - **Content:** A screenshot image in PNG or JPEG format showing the running application.

## Running the Project

1. Clone this repository to your local machine.
2. Edit the Vagrantfile, lamp.sh, and playbook.yml files as needed.
3. Open a terminal and navigate to the project directory.
4. Run `vagrant up` to provision the virtual machines.
5. Execute the Ansible playbook with `ansible-playbook playbook.yml`.
6. After the playbook execution, check the screenshot (screenshot.png) to verify successful deployment.

## Conclusion
By following the steps outlined in this documentation, you can automate the deployment of a LAMP stack with Laravel and PostgreSQL on two Ubuntu-based servers while ensuring server uptime checks.


# Table of Contents

1. [Objective](#objective)
2. [Prerequisites](#prerequisites)
3. [File Descriptions](#file-descriptions)
4. [Project Setup](#project-setup)
5. [Vagrant Configuration (Vagrantfile)](#vagrant-configuration-vagrantfile)
6. [Bash Deployment Script (lamp.sh)](#bash-deployment-script-deploysh)
7. [Playbook.yaml](#ansible-playbook-deployyml)
8. [Documentation.md (README.md)](#documentation-readmemd)
9. [Screenshot Evidence (screenshot.png)](#screenshot-evidence-screenshotpng)
10. [Running the Project](#running-the-project)
11. [Conclusion]

# HOW TO INSTALL AND RUN IT

Automate the provisioning of two Ubuntu-based servers, "Master" and "Slave," and deploy a LAMP stack with Laravel and PostgreSQL. This guide provides instructions on how to run and instal them.

## Prerequisites

Ensure that you have the following prerequisites installed on your system:

1. [Vagrant](https://www.vagrantup.com/downloads.html)
2. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) or another Vagrant-supported provider.
3. [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Getting Started
1. Clone this repository to your local machine:
#
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
#
    ```bash
    cd <project_directory>
    ```

3.  Edit the Vagrantfile to configure the VMs according to your requirements. You can specify resources, IP addresses, and other settings.
4. Place your PHP application's GitHub repository URL in the 'lamp.sh' scrip
## Running the Project
1. Provision VMs with Vagrant
Execute the following commands to provision the "Master" and "Slave" VMs using Vagrant:

    ```bash
    vagrant up
    ```
5. Deploy the LAMP Stack
SSH into the "Master" VM:
#
    ```bash
    vagrant ssh master
    ```
Run the deployment script to set up the LAMP stack with Laravel and PostgreSQL:

    ```bash
    bash /vagrant/deploy.sh
    ```
6. Execute Ansible Playbook
Exit the "Master" VM and return to your local machine:

    ```bash
     exit
    ```
Execute the Ansible playbook to run the deployment script on the "Slave" node and verify accessibility:

    ```bash
    Copy code
    playbook.ayml
    ```
7.  Verify Application Accessibility
After the Ansible playbook execution, you can check the screenshot (screenshot.png) to verify that the PHP application is accessible through the "Slave" VM's IP address.

8. Create a Cron Job
The Ansible playbook will have set up a daily cron job to check server uptime at 12 AM automatically.

Conclusion
By following these steps, you can automate the deployment of a LAMP stack with Laravel and PostgreSQL on Ubuntu-based servers. The script and Ansible playbook make the process efficient and repeatable.

Feel free to adapt and customize the project according to your specific requirements.

Make sure to replace `<repository_url>` and `<project_directory>` with your actual GitHub repository URL and project directory path. This simple guide should help you get started with the deployment and automation of your project.



