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
pfSense is configured as a virtual router and firewall to isolate and secure the network. It enables the segmentation of the lab environment into different subnets for better control and monitoring.

### Steps to configure pfSense

In VMware Workstation:

Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of the pfSense installation ISO file.

Disk space config: 

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/5.jpg)

Proceed with the default settings for the virtual machine configuration and add 6 new network adapters by clicking "Add" --> After adding interfaces, customize them by clicking "Custom: specific virtual Network":

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/6%20hardware%20specification.jpg)

### Configure the pfSense Virtual Machine

Once the virtual machine is created, power it on, and you will see the pfSense welcome screen:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/7%20software%20install%20accept.jpg)

    Click "Accept"
    Click on "Install pfSense" press tab to click "OK"
    Network Installation click "OK" to configure WAN interface next

WAN interface Assignment and Configuration page:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/10%20click%20advance%20and%20find%20the%20right%20wan%20interface%20which%20should%20be%20the%20NAT%20interface.jpg)

  WAN Mode Setup:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/11.jpg)

Active Subscription Validation:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/12%20choose%20WAN%20to%20get%20to%20this%20and%20click%20install%20CE.jpg)

Installation Options:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/13.jpg)

ZFS Virtual Device Type:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/14.jpg)

Disk Selection:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/15%20click%20ok%20on%20everything.jpg)

Software version:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/16.jpg)

Complete installation by clicking "Reboot"

After rebooting, disconnect the iso by: 

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/18%20how%20to%20disconnect%20and%20click%20reboot%20once%20you%20do%20that.jpg)

    Click "Restart" after you disconnect the iso disc
    pfSense will be installed after this

### Completing pfSense configuration

pfsense welcome page:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/20%20shutdown%20the%20Pfsense%20to%20finish%20install%20and%20load%20it%20up%20again%20and%20you%20will%20be%20taken%20here.jpg)

Next, we will Assign the appropriate interfaces for the WAN (em0) and LAN (em1) connections based on your network setup on pfSense by clicking "1" to Assign Interfaces:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/21%20assigning%20the%20interfaces%20we%20created.jpg)

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/22%20click%201%20and%20click%20no%20for%20vlan%20set%20up.jpg)

    Click"n" when asked about configuring vlan unless needed in your installation

Assigned interfaces:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/23%20interface%20setup%20for%20my%20other%20machines.jpg)

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/24%20interface%20setup%20click%20yes.jpg)

    Click "y" to proceed

Next, we will give the assigned interfaces IP addresses each on different subnets: 

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/25%20click%202%20to%20setup%20the%20ip%20address%20for%20the%20other%20adapter.jpg)

    Click "2" to Set IP addresses

Example of configuring the optional interface we added, which is LAN1:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/26%20configuring%20the%20ip%20address%20now.jpg)

When asked about reverting to HTTP as the web configurator, click "y" to access the web interface for your pfSense GUI:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/27%20ip%20dhcp%20range%20for%20this%20lan%20for%20my%20lan%20kali%20inux%20to%20access%20the%20pfsense%20GUI.jpg)

    The configuration above is all the things you will need to assign an IP address to for all the other interfaces. As for this one, it's em2=192.168.2.1
    The rest of the IP addresses of the 3rd Octet will be increased by 1:
    em3=192.168.3.1
    em4=192.168.4.1
    em5=192.168.5.1
    em6=192.168.6.1

    N.B Click "n" for the rest of the IP configs when asked about reverting to HTTP as the web configurator protocol like the example below:

Example of em2:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/28%20the%20rest%20of%20the%20OP1%20OP6%20use%20increment%20the%203rd%20octet.jpg)

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/29%20after%20the%20subnet%20mask%2C%20everything%20is%20no.jpg)

All the IP addresses configured:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/30%20all%20interfaces%20configured.jpg)

## 3. Configuring Security Onion
Security Onion is deployed as an all-in-one solution for intrusion detection, security monitoring, and log management.

[Download Security Onion ISO file from here](https://github.com/Security-Onion-Solutions/securityonion/blob/master/VERIFY_ISO.md)

Recommended installation process:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3%20installation%20process.jpg)

In VMware Workstation:

Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of the security onion installation ISO file.

Important hardware configs for Span/sniffing port and pfSense interface port:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/4%20interface%20with%20no%20ip%20from%20pfsense%20for%20spam%20port.jpg)

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/5%20red%20spam%20port%20and%20green%20pfsense%20connector.jpg)

        Red Span port and green pfSense interface connector

### Steps to configure Security Onion

[Click here if you want to want to see the live walkthrough of installing Security Onion](https://www.youtube.com/watch?v=gDlgDE-vbJ8&list=PLljFlTO9rB17E0hOetV_R4Lc0WbEy8q_Y)

Once the virtual machine is created, power it on, and you will see the Security Onion welcome screen:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/6%20once%20you%20have%20accept%20the%20hardware%20cofig%20power%20on%20the%20vm%20to%20get%20this%20and%20choose%20the%202nd%20option.jpg)

        On the welcome screen, select the first installation process
        NB: Use Tab to move around the screen

This will take you t to this page:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/1.1%20choose%20the%20first%20onin.jpg)

        Type "yes" to accept

After you click yes, an installation process will run and it will ask you to create a username and password followed by you being asked to reboot:

    Click"Enter" to reboot

This will take you to this screen:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/10%20after%20being%20promoted%20to%20login%20using%20creduential%20created%20follow%20this.jpg)

    Click"Yes"

Choose Eval for the type of installation:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.1%20right%20install.jpg)

    Click "OK"

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.2%20agreement.jpg)

    Type AGREE
    Click "Ok"

Node installation type:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.3%20standard.jpg)

    Select Standard
    Click"Ok"
    Next, you will be asked to create a hostname
    Click"Ok"

Select the NIC to manage your Security Onion, which should be the NAT interface we created in the initial process of the hardware configs:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.5%20NAT%20interface%20for%20management.jpg)

Selecting connection to the internet:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.7%20after%20doing%20correct%20interface%20i%20did%20ip%20address.jpg)

    Click"Ok"

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.8%20keep%20default.jpg)

    Click"Yes" this just accepts the default settings

Take a screenshot of the last 2 Next screens or Note them down somewhere:

    First screen will show your final configurations
    Chick"Yes"
    Last sceen will show you how you can reach your security onion web interface and how to login
    Click"Ok" after

Next you will login into the Security onion console line to configure a firewall rule to allow a device of which you know the ip address for so that you can connect to web interface of Security Onion. Why do this you might ask, Security Onion defalult firewall rule block any traffic inbound espically if they are on different subnets. This is the command to configure an allow IP address:

    sudo so-firewall --apply includehost analyst <IP ADDRESS>
    For me, this will be my client Ubuntu machine

If you want to install the ubuntu machine that can manage the Security onion, you click the provide link to do so:

[Chick here if you want to know how to install unbuntu Desktop](https://medium.com/@florenceify74/how-to-download-install-and-run-ubuntu-in-vmware-workstation-ce5f2d4d0438)

    Once you have installed the ubuntu
    Open the terminal and run this command so the you can get ifconfig to get the ip address you need to configure the allow rule for the Security Onion web interface:

    Sudo apt-get install net-tools

## 4. Configuring Kali Linux as an Attack Machine
Kali Linux is set up as a penetration testing and attack simulation machine. It includes tools for vulnerability scanning, exploitation, and post-exploitation activities.

[Download the Kali Linux ISO from here](https://www.kali.org/get-kali/#kali-virtual-machines)

[Click here for Kali machine guided installation](https://www.geeksforgeeks.org/how-to-install-and-run-vmware-tool-in-linux/)

### Virtual Machine Configuration

Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of the pfSense installation ISO file.



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
