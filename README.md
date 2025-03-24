# Detection-and-Monitoring-Homelab
# Cybersecurity Homelab Setup

This project demonstrates the setup of a comprehensive cybersecurity homelab environment using VMware Workstation as the hypervisor. The lab includes network segmentation, security monitoring, intrusion detection, and attack simulation. Below are the key components of the setup:

## Network Diagram
![image alt](https://github.com/Cyberakr21/Detection-and-Monitoring-Homelab/blob/426e2687c0832cffbfaa7653cbd967e73bc76813/homelab%20Detection.jpg)


## 1. Installing VMware Workstation as the Hypervisor
VMware Workstation serves as the foundation for hosting all virtual machines in this lab. It allows for the creation of isolated virtual environments for testing and learning purposes.

[Download Vmware Workstation](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)

After you click the link:

Click Download Fusion or Workstation Next ---> Create account ---> Login and Click My downloads ---> Chick Free Software Downloads available HERE ---> Find VMware Workstation Pro and click that ---> Choose the system preference Win or Linux ---> Download and Install

[How to Install Vmware Workstation](https://medium.com/analytics-vidhya/step-by-step-install-vmware-workstation-on-windows-1027abc3fadc)

## 2. Configuring pfSense Firewall for Network Segmentation & Security
pfSense is configured as a virtual router and firewall to isolate and secure the network. It enables segmentation of the lab environment into different subnets for better control and monitoring.

### Steps to configure pfSense

In VMware Workstation:

Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of the pfSense installation ISO file.

Disk space config: 

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/5.jpg)

Proceed with the default settings for the virtual machine configuration and add 6 new network adapters by clicking "Add" --> After adding interfaces, customize them by clicking "Custom: specific virtual Network":

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/6%20hardware%20specification.jpg)

### Configure the pfSense Virtual Machine

Once the virtual machine is created, power it on and you will see the pfSense welcome screen:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/7%20software%20install%20accept.jpg)

    Click "Accept"
    Click on "Install pfSense" press tab to click "OK"
    Network Installation click "OK" to configure WAN interface next

WAN interface Assignment and Configuration page:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/10%20click%20advance%20and%20find%20the%20right%20wan%20interface%20which%20should%20be%20the%20NAT%20interface.jpg)

  WAN Mode Setup:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/11.jpg)

Active Subscription Validation:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/12%20choose%20WAN%20to%20get%20to%20this%20and%20click%20install%20CE.jpg)

Installation Options:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/13.jpg)

ZFS Virtual Device Type:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/14.jpg)

Disk Selection:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/15%20click%20ok%20on%20everything.jpg)

Software version:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/16.jpg)

Complete installation by clicking "Reboot"

After rebooting, disconnect the iso by: 

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/18%20how%20to%20disconnect%20and%20click%20reboot%20once%20you%20do%20that.jpg)

    Click "Restart" after you disconnect the iso disc
    pfSense will be installed after this

### Completing pfSense configuration

pfsense welcome page:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/20%20shutdown%20the%20Pfsense%20to%20finish%20install%20and%20load%20it%20up%20again%20and%20you%20will%20be%20taken%20here.jpg)

Next we will Assign the appropriate interfaces for the WAN (em0) and LAN (em1) connections based on your network setup on pfSense by click "1" to Assign Interfaces:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/21%20assigning%20the%20interfaces%20we%20created.jpg)

Next Page:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/22%20click%201%20and%20click%20no%20for%20vlan%20set%20up.jpg)

    Click"n" when asked about configuring vlan unless needed in your installation

Assigned interfaces:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/23%20interface%20setup%20for%20my%20other%20machines.jpg)

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/24%20interface%20setup%20click%20yes.jpg)

    Click "y" to proceed

Next, we will give the assigned interfaces IP addresses each on different subnets: 

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/25%20click%202%20to%20setup%20the%20ip%20address%20for%20the%20other%20adapter.jpg)

    Click "2" to Set IP addresses

Example of configuring the optinal interface we added which is LAN1:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/26%20configuring%20the%20ip%20address%20now.jpg)

When asked about reverting to HTTP as the web configurator, click "y" to access the web interface for your pfSense GUI:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/27%20ip%20dhcp%20range%20for%20this%20lan%20for%20my%20lan%20kali%20inux%20to%20access%20the%20pfsense%20GUI.jpg)

    Configuration above is all the things you will need to assign an IP address to all the other interfaces. As for this one, it's em2=192.168.2.1
    The rest of the IP addresses 3rd Octet will be increased by 1:
    em3=192.168.3.1
    em4=192.168.4.1
    em5=192.168.5.1
    em6=192.168.6.1

    N.B Click "n" for the rest of the IP configs when asked to about reverting to HTTP as the web configurator protocol like the example below:

Example of em2:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/28%20the%20rest%20of%20the%20OP1%20OP6%20use%20increment%20the%203rd%20octet.jpg)

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/29%20after%20the%20subnet%20mask%2C%20everything%20is%20no.jpg)

All the IP addresses configured:

![image alt](https://github.com/Cyberakr21/homelab-2-secuirty-onion-IDS-images/blob/10d39700f4fd1505d3cff3838ad9a56708f514e5/30%20all%20interfaces%20configured.jpg)

## 3. Configuring Security Onion
Security Onion is deployed as an all-in-one solution for intrusion detection, security monitoring, and log management. It provides tools like Zeek, Suricata, and Kibana for analyzing network traffic and detecting threats.

## 4. Configuring Kali Linux as an Attack Machine
Kali Linux is set up as a penetration testing and attack simulation machine. It includes tools for vulnerability scanning, exploitation, and post-exploitation activities.

## 5. Configuring a Windows Server as a Domain Controller
A Windows Server 2025 is configured to act as a Domain Controller for managing user authentication and group policies. This setup mimics a real-world enterprise environment.

## 6. Configuring Windows Desktops
Windows desktop virtual machines are added to the domain for testing user access and security policies. These machines simulate end-user systems in a corporate network.

## 7. Configuring Splunk
Splunk is deployed for log aggregation, analysis, and visualization. It integrates with other components in the lab to provide insights into network and system activities.

## How to Use This Repository
Each section of the lab setup is documented with step-by-step instructions, screenshots, and configuration files. Follow the guides to replicate the setup in your own environment.

## Future Enhancements
- Adding more attack scenarios and detection use cases.
- Expanding the lab to include cloud-based components.
