# Detection-and-Monitoring-Homelab
# Cybersecurity Homelab Setup

This project demonstrates the setup of a comprehensive cybersecurity homelab environment using VMware Workstation as the hypervisor. The lab includes network segmentation, security monitoring, intrusion detection, and attack simulation. Below are the key components of the setup:

## Network Diagram
![Network Diagram](file:///C:/Users/austi/Downloads/Homelab/homelab.drawio.html)


## 1. Installing VMware Workstation as the Hypervisor
VMware Workstation serves as the foundation for hosting all virtual machines in this lab. It allows for the creation of isolated virtual environments for testing and learning purposes.

## 2. Configuring pfSense Firewall for Network Segmentation & Security
pfSense is configured as a virtual router and firewall to isolate and secure the network. It enables segmentation of the lab environment into different subnets for better control and monitoring.

## 3. Configuring Security Onion
Security Onion is deployed as an all-in-one solution for intrusion detection, security monitoring, and log management. It provides tools like Zeek, Suricata, and Kibana for analyzing network traffic and detecting threats.

## 4. Configuring Kali Linux as an Attack Machine
Kali Linux is set up as a penetration testing and attack simulation machine. It includes tools for vulnerability scanning, exploitation, and post-exploitation activities.

## 5. Configuring a Windows Server as a Domain Controller
A Windows Server is configured to act as a Domain Controller for managing user authentication and group policies. This setup mimics a real-world enterprise environment.

## 6. Configuring Windows Desktops
Windows desktop virtual machines are added to the domain for testing user access and security policies. These machines simulate end-user systems in a corporate network.

## 7. Configuring Splunk
Splunk is deployed for log aggregation, analysis, and visualization. It integrates with other components in the lab to provide insights into network and system activities.

## How to Use This Repository
Each section of the lab setup is documented with step-by-step instructions, screenshots, and configuration files. Follow the guides to replicate the setup in your own environment.

## Future Enhancements
- Adding more attack scenarios and detection use cases.
- Integrating additional tools like ELK Stack or Graylog for log management.
- Expanding the lab to include cloud-based components.
