# Detection-and-Monitoring-Homelab
# Cybersecurity Homelab Setup

This project demonstrates the setup of a comprehensive cybersecurity home lab environment using VMware Workstation as the hypervisor. The lab includes network segmentation, security monitoring, intrusion detection, and attack simulation. Below are the key components of the setup:

## Network Diagram 
![image alt](https://github.com/Cyberakr21/Detection-and-Monitoring-Homelab/blob/426e2687c0832cffbfaa7653cbd967e73bc76813/homelab%20Detection.jpg)


## 1. Installing VMware Workstation as the Hypervisor
VMware Workstation serves as the foundation for hosting all virtual machines in this lab. It allows for the creation of isolated virtual environments for testing and learning purposes.

[Download Vmware Workstation](https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion)

After you click the link:

**Click Download Fusion or Workstation Next ---> Create account ---> Login and Click My downloads ---> Chick Free Software Downloads available HERE ---> Find VMware Workstation Pro and click that ---> Choose the system preference Win or Linux ---> Download and Install**

[How to Install Vmware Workstation](https://medium.com/analytics-vidhya/step-by-step-install-vmware-workstation-on-windows-1027abc3fadc)

## 2. Configuring pfSense Firewall for Network Segmentation & Security
pfSense is configured as a virtual router and firewall to isolate and secure the network. It enables the segmentation of the lab environment into different subnets for better control and monitoring.

### Steps to configure pfSense

In VMware Workstation:

**Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> Click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of the pfSense installation ISO file.**

Disk space config: 

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/5.jpg)

**Proceed with the default settings for the virtual machine configuration and add 6 new network adapters by clicking "Add" --> After adding interfaces, customize them by clicking "Custom: specific virtual Network":**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/6%20hardware%20specification.jpg)

### Configure the pfSense Virtual Machine

Once the virtual machine is created, power it on, and you will see the pfSense welcome screen:

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/7%20software%20install%20accept.jpg)

    Click "Accept"
    Click on "Install pfSense" and press Tab to click "OK"
    Network Installation: click "OK" to configure the WAN interface next

**WAN interface Assignment and Configuration page:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/10%20click%20advance%20and%20find%20the%20right%20wan%20interface%20which%20should%20be%20the%20NAT%20interface.jpg)

**WAN Mode Setup:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/11.jpg)

**Active Subscription Validation:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/12%20choose%20WAN%20to%20get%20to%20this%20and%20click%20install%20CE.jpg)

**Installation Options:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/13.jpg)

**ZFS Virtual Device Type:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/14.jpg)

**Disk Selection:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/15%20click%20ok%20on%20everything.jpg)

**Software version:**

![image alt](https://github.com/Cyberakr21/homelab-1-pfsense-images/blob/621a9b3d67f83f9a2ddfc4800abd96835dcc8e4d/16.jpg)

**Complete installation by clicking "Reboot"**

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

**Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of the security onion installation ISO file.**

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

Selecting a connection to the internet:

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.7%20after%20doing%20correct%20interface%20i%20did%20ip%20address.jpg)

    Click"Ok"

![image alt](https://github.com/Cyberakr21/2-homelab-security-onion--images-/blob/c1bb6600e8966782087a0d561903c4aa4f51e15c/3.8%20keep%20default.jpg)

    Click"Yes" This just accepts the default settings

Take a screenshot of the last 2 Next screens or Note them down somewhere:

    The first screen will show your final configurations
    Click"Yes"
    The last screen will show you how you can reach your security onion web interface and how to log in
    Click"Ok" after

Next, you will log into the Security Onion console line to configure a firewall rule to allow a device for which you know the IP address so that you can connect to the web interface of Security Onion. Why do this you might ask, Security Onion defalult firewall rule block any traffic inbound espically if they are on different subnets. This is the command to configure an allowed IP address:

    sudo so-firewall --apply includehost analyst <IP ADDRESS>
    For me, this will be my client Ubuntu machine

If you want to install the Ubuntu machine that can manage the Security Onion, you click the provided link to do so:

[Chick here if you want to know how to install unbuntu Desktop](https://medium.com/@florenceify74/how-to-download-install-and-run-ubuntu-in-vmware-workstation-ce5f2d4d0438)

    Once you have installed the Ubuntu
    Open the terminal and run this command so that you can get ifconfig to get the IP address you need to configure the allow rule for the Security Onion web interface:

    Sudo apt-get install net-tools

## 4. Configuring Kali Linux as an Attack Machine
Kali Linux is set up as a penetration testing and attack simulation machine. It includes tools for vulnerability scanning, exploitation, and post-exploitation activities.

[Download the Kali Linux ISO from here](https://www.kali.org/get-kali/#kali-virtual-machines)

[Click here for Kali machine guided installation](https://www.geeksforgeeks.org/how-to-install-and-run-vmware-tool-in-linux/)

### Virtual Machine Configuration

**Since you’re downloading the VM file, all you’ll need to do is click on the .vmx file from the Kali Folder you downloaded, and it will automatically load up the default Kali image in VMware.**

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/1%20installation.jpg)

**When you power on the Kali Machine, It will have a default login account:**

    Username: kali
    password: kali

Once you log in, you can change the password by going to the terminal and typing  this command:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/2%20change%20password%20with%20command.jpg)

    command:
    passwd

The Kali machine is ready for use after configuring your own password.

**With the Kali machine set up, the pfsense WebConfigurator can be accessed in order to make some changes to the pfsense interface and firewall rules. Navigate to the web browser and search for 192.168.1.1**

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/3%20pf%20sense%20LAN%20address%20used%20to%20reach%20webconfig%20em2.jpg)

Accept the risk when trying to access the web interface:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/accept%20risk%20and%20Lan%20is%20what%20you%20type%20to%20reach%20the%20pfsense.jpg)

pfSense login screen:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/4%20default%20login%20user%20name%20admin%20and%20pfsense.jpg)

    default pfSense login:
    Username: admin
    Password: pfsense

Once in pfsense, follow the this guide:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/5%20click%20next.jpg)

    Click"Next"

Configure the DNS using Google's primary and secondary DNS:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/6%20dns%20setup%20google.jpg)

    Click"Next"

Select your timezone:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/7%20set%20your%20time%20zon.jpg)

    Click"Next"

**I am allowing private addresses just to get great alerts for the log collection later:**

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/8%20after%20seeting%20time%20zone%2C%20personal%20choice%20deselect%20to%20get%20more%20alerts%20since%20this%20is%20a%20sandbox%20not%20interproce.jpg)

    Click"Next"

Set up a new password:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/9%20set%20up%20your%20new%20password.jpg)

    Click"Next"
    Next, Click"finish" 
    Then click the browser"reload button to finalize the configuration"

At this point, pfsense Wizard is complete and now we will be making changes to the Interfaces in pfsense settings.

Click on interfaces to get:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/111%20Check%20if%20this%20looks%20like%20what%20you%20have%20on%20pf%20sense.jpg)

The next step is to change the names of the interfaces to reflect our network diagram by clicking on each interfaces that need to be changed:

interface LAN(em1) example:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/11%20next%20step%20is%20to%20change%20the%20names%20to%20reflect%20the%20device%20that%20uses%20it.jpg)

When making edits to the interfaces, remember to disable static IPv4 for this interface e.g:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/12%20remember%20to%20enable%20the%20SPAN%20port%20without%20a%20static%20ip.jpg)

Renamed interfaces:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/13%20renamed%20pf%20interfaces.jpg)

Next, we will be configuring the Bridge, which will be used for your client/victim network acting as the firewall between the clients and pfsense so that pf sense can collect logs. Follow these steps to configure this:

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/15%20member%20is%20Client%20net%20include%20span%20port%20setup.jpg)

Next, click firewall to configure ACL(Acess control list):

![image alt](https://github.com/Cyberakr21/3-homelab-Kali-attacker--images/blob/7b5c5c28d5ef99b1a57fcb914c44861051ee6b6f/16%20next%20click%20firewall%20to%20configure%20ACL.jpg)

        Configure to allow TCP traffic
        Then click "save"

This is the majority of the firewall configuration needed for pfsense, and you can do more I you want.

## 5. Configuring a Windows Server as a Domain Controller
A Windows Server 2025 is configured to act as a Domain Controller for managing user authentication and group policies. This setup mimics a real-world enterprise environment.

[Download the Windows 2025 Server Evaluation](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2025)

    You will need to fill out a form for Microsoft to get the Win server Iso

Recommended installation process:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/1%20hardware%20config%20and%20the%20other%20config%20website%20until.jpg)

Remove Floppy disk hardware:
![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/2%20remove%20floppy%20disk%2C%20can%20affect%20installation.jpg)

N.b Select the Windows Server 2025 standard Evaluation (Desktop Experience)during installation

After powering the VM and installing Windows Server 2025, log into the machine so that you can install software that allows a fullscreen view on any Windows machine:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/3%20after%20installation%20is%20done%2C%20install%20vm%20tools%20to%20get%20resolution%20change.jpg)

Follow this installation process next:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/4%20click%20next%20on%20vm%20tools%20on%20everything%20%20with%20changing%20nothings.jpg)

    Choose "Typical"
    Click Next on everything else until the restart screen
    Click"Restart"

### Steps to Configuring Active Directory

**After the restart, you should end up on this screen or you can use the search bar to search"Server manager". Use the server manager to configure Active Directory.**

Go to manage and select "Add Roles and Features"

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/6%20activation%20the%20DC%20feature.jpg)

**Once on Add Roles and Features --> Sever Roles --> Select Active Directory Domain services--> Select "Add features" --> Click"Next" until you get to installation**

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/7%20click%20next%20until%20you%20arrive%20at%20server%20role%20roles%20and%20click%20on%20add%20feature%20of%20DC%20services.jpg)

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/8%20click%20next%20until%20you%20get%20to%20installation.jpg)

    At the Confirmation menu, click "Install"
    After the Install, Click "Close"

After exiting the installation menu, you will see a yellow flag on the top right:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/9%20click%20on%20the%20flag%20and%20click%20promote%20to%20dc.jpg)

    Click on the flag with the yellow caution triangle
    Click on "Promote this server to a domain controller"

Select Add a new forest:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/10%20set%20up%20the%20new%20forest.jpg)

    Click"Next"

Set a password:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/11%20set%20password%20and%20click%20next%20on%20everything%20until%20you%20reach%20install.jpg)

    click "Next" on everything until you reach the install
    Wait for the Reboot
    After the Reboot, Log back in

**After the installation, Select Manage --> Click on "Add Roles and Features" --> Sever Roles --> Select "Active Directory certificate services"--> Select "Add features" --> Click"Next" until you get to the installation menu**

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/12%20after%20the%20rest%2C%20click%20on%20role%20to%20add%20AD%20certs.jpg)

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/13.jpg)

    Check "Restart the destination server automatically if required"

After exiting the installation menu, you will see a yellow flag on the top right:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/14%20click%20on%20the%20flag%20to%20conf%20the%20certs.jpg)

    Select "Configure Active Directory Certificate Services on the destination server"

Click Next on Credentials:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/15%20click%20next%20after%20this%20until%20validty%20period.jpg)

Click next until Validity Period:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/16%20set%20the%20years%20to%20however%20long%20you%20think%20you%20will%20be%20using%20this%20server%20for%20click%20next%20until%20configure.jpg)

    Click Next till you get to the Confirmation menu
    Then select Configure
    Manually restart the server in order for all the settings to take effect

**At this point, Active Directory has been configured**

### Setting up the users for our client Network that will be managed by our Domain Controller

**In server Manager --> Click"Tools" --> Click"Active Directory Users and Computers":**

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/17%20adding%20users.jpg)

Select your Domain Name **(CYBERAKR.local)**** > Users**, **Right Click & Select New > User**

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/08cf7068f616513fd61cece564d16108bf112fd9/18%20right%20click%20on%20user%20after%20going%20into%20cyberakr.local.jpg)

After clicking **"User"**, you will prompted to create an account:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/19%20adding%20the%20answer%20for%20the%20windows%20machine%20for%20adding%20them%20to%20DC.jpg)

    Configuration can we whatever you them to be
    Click "Next" when you are done

Setting up a password:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/20.1.jpg)

       Set a password that never expires
       Select "Next" to finish set up

Use the configuration above to add more users that you want to simulate to be able to log in with them. 

### Disabling the firewall for the Windows server 2025 since we are using pfSense as the firewall

Go to the search bar to search"Windows Defender Firewall" to get this:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/22%20dissable%20defender%20because%20we%20using%20pfsense.jpg)

    Select Turn Windows Defender Firewall on or off

Turn off the firewall for all Networks:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/22.1%20dissable%20everything.jpg)

    Click"Ok" when you are done 

How to make pfsense the default gateway for the Domain Controller

Navigate to **Control Panel** > **Network and Internet** > **Network Connections**
Use the following configuration:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/23%20pf%20sense%20network%20for%20the%20clientnet.jpg)

    The IP address used is the Network range of the Client Network
    The subnet of this IP address is 192.168.2.X/24

    The 192.168.2.1 is the IP address for pfSense
    Click"OK" once everything is finalized

NB: Go to the pfsense Web interface to configure DHCP so that pfsense knows that it will allocate the IP addresses itself, not the Domain Controller(DC), by adding the DC to pfsense:

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/24%20go%20to%20pf%20web%20config%20to%20add%20our%20DC%20to%20our%20pf%20%20sense%20using%20this%20settings.jpg)

![image alt](https://github.com/Cyberakr21/4-homelab-active-directory--images-/blob/e05687d707c85bac67aa79ab7520ce4b6f128c2d/25%20config%20so%20that%20pfsense%20knows%20that%20it%20will%20allcoate%20the%20ip%20itself%20not%20DC.jpg)

    Set DNS Servers to "<Client Network IP addresss>"
    Domain Name"<Your Domain e.g CYBERAKR.local>"
    Save to finish the configuration
    
## 6. Configuring Windows Desktops
Windows desktop virtual machines are added to the domain to test user access and security policies. These machines simulate end-user systems in a corporate network.

### Configuring Windows 10

**Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of Windows 1o installation ISO file:**

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/1%20create.jpg)

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/2%20select%20iso.jpg)

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/3%20select%20win10%20enterprice.jpg)

Hardware config:

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/4%20interface%20for%20clients.jpg)

After completing the Hardware configuration and before powering the machine, Delete the floppy disk:

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/5%20remove%20floppy%20and%20then%20power%20vm%20on.jpg)

Power the Machine on install Windows 10 Enterprise: 

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/6%20click%20next%20and%20install%20before%20this%20and%20accept%20and%20next.jpg)

    Accept license terms
    Click"Next"
        
![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/7%20custom%20install.jpg)

    Use Custom Install

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/8%20click%20new%20and%20apply.jpg)

    Select New > Apply > OK > Next

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/8.1%20press%20okay.jpg)

    Click"Ok"

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/8.2%20partion%203%20and%20next.jpg)

    Select"Primary"
    Click"Next"
    Select your region and click "Yes"

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/10%20dont%20have%20internet.jpg)

**At this point, accept all defaults, and Windows 10 should be installed. Next, you will install the tool that will allow you to have a fullscreen function:**

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/11%20installation%20process%20in%20website.jpg)

Configure the IP address for this machine using the subnet for our Client Network:

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/14%20ip%20address%20config%20and%20dc%20dns%20and%20gateway.jpg)

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/15%20configure%20and%20try%20join%20domain.jpg)

**Next, we will Join this machine to our Domain Controller, using these steps:**
**NB** **The IP address and DNS need to be configured first to join the Domain**

Go to the search bar and search"Settings" --> Accounts --> Access work and School

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/proper%20domain%20pc%20join.jpg)

Click"Connect" --> Click "Join this device to a local Active Directory domain"

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/2%20add%20local%20dc.jpg)

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/3%20domain%20name.jpg)

    Enter your Domain name"XXX.local"

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/4%20credential%20to%20Join%20the%20DC.jpg)

    Enter the Credential you use to access your Windows Server 2025

Enter the account information for the account and Privilege access this account should have:

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/5%20information%20for%20the%20user%20and%20permission%20type.jpg)

These are the steps you will use to add a computer to the Domain Controller.

**NB Next, head to your Windows Server to check if the device/devices are present there**

Click"Server Manager"-->Tools--> Active Directory users and computer and follow the steps:

![image alt](https://github.com/Cyberakr21/Windows-desktop-machine/blob/f55c1139b04ee0f316abf8d6f5943d7ff7cf1b9d/6%20go%20to%20the%20DC%20and%20check%20if%20pcs%20are%20present%20in%20it.jpg)

## 7. Configuring Splunk
Splunk is deployed for log aggregation, analysis, and visualization. It integrates with other components in the lab to provide insights into network and system activities.

**To begin the installation of Splunk, you will have to download an Ubuntu Server to install the Splunk instance**

[Download Ubuntu Server](https://ubuntu.com/download/server)

Click on "Create a New Virtual Machine" to start the setup process --> Select the "Typical (recommended)" configuration type --> click "Next" --> Choose the "Installer disc image file (iso)" option and browse to the location of Windows 1o installation ISO file:

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/1%20ubuntu%20install%20to%20run%20splunk.jpg)

Hardware specification:

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/2%20hardware%20specs.jpg)

**Power on the VM to install the Ubuntu Server. Follow this installation process:**

Welcome Screen
![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/3%20poweron%20vm%20and%20select%20first.jpg)

    Select"Try and Install"
    Press Enter and select that
    Select the preferred language
    Click"Done" after selecting a language

Select the type of installation of the Ubuntu Server

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/6%20select%20type%20and%20you%20tab%20to%20move%20around.jpg)

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/7%20click%20done.jpg)

    Accept default setting
    Click"Done" for all the options in the menu until you reach the Destruction action menu

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/12%20select%20continue.jpg)

    Click"Continue"

Profile configuration: 

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/13%20set%20login%20and%20use%20tab%20to%20move%20around.jpg)

Skip this menu:

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/14%20skip%20and%20continue.jpg)

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/15%20space%20to%20select%20install%20server%20and%20done.jpg)

    Press space to select "Install OpenSSH server" and Click "Done"
    The installation will run, and you will be asked to reboot
    During the installation, you’ll be prompted to remove the CD(ISO) remove it and then reboot the VM.
    Reboot to complete the installation

**At this point, the Ubuntu Server has been installed. After the VM has rebooted, your sign-in screen should look something similar to this:**

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/18%20login%20with%20credential%20once%20done%20installing.jpg)

**Skip this if you dont want to install the GUI**

**This is optional, but you can install a GUI if you dont want to use the command line to work on the Ubuntu Server by following this process:**

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/19%20after%20login%2C%20use%20this%20command%20to%20get%20gui%20look.jpg)

    Run this command to begin the GUI installation:
    Sudo apt install tasksel
    Followed by:
    sudo  tasksel install ubuntu-desktop
    Reboot your Server to bring the Server up with the GUI

If the above commands dont work, use this link:

[Click Here to Install Desktop (GUI) on Ubuntu Server](https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu)

**We will now Set up Splunk**

On your Ubuntu Server, Navigate to [Splunk.com](https://www.splunk.com/en_us/download/splunk-cloud.html)

Once there, Click on "Splunk Enterprise for Free"
![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/21%20click%20on%20splunk%20for%20hardware%20and%20use%20real%20information%20to%20fill%20things%20out.jpg)

    You will need to create an account too
    Then log in with that account 
    This Splunk instance is a 60-day free license
    
This will be your next screen, so select the system you want to install this instance on:
![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/22%20copy%20web%20get%20for%20tgz.jpg)

    Copy the wget of your choice; I will be using wget since it's what I am used to.

The next step is to paste the wget into your Ubuntu server terminal: 
![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/23%20%20write%20it%20here.jpg)

To open the wget Splunk file:

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/24%20use%20this%20commnd%20to%20run%20open%20the%20spplunk%20file.jpg)

    Command:
    tar xvf <splunk file>

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/25%20next%20command%20and%20run%20it.jpg)

    Use these commands to go into the Splunk file opened:
    cd splunk
    ls
    cd bin
    ./splunk start

At this point, Splunk will begin installing, and you will be prompted with these screens:

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/26.%20space%20and%20then%20agree%20with%20agreement.jpg)

    Click"y"

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/27%20create%20username%20for%20splunk%20and%20password.jpg)

    Create a Username and password to log into Splunk later

Once that is done, you will receive your web configuration to access your Splunk, so save that somewhere

Navigate to http://splunk:8000 in your browser

**NB. You can set up your Splunk to boot up as your Sever boot up, too, if you dont want to type "./start Splunk" every time by using this command:**

    Use this command on your terminal
    sudo./splunk enable boot-start

If you want to access Splunk from a different machine, can use this command to do so:

    sudo ipstables -A INPUT -p tcp --dport 8000 -s <IP address of the machine> -j ACCEPT

**At this point, Splunk has been installed. All you need to do is visit the navigate to the web page and log in:**

    Visit http://splunk:8000
    accept risk and log in using the credential made when we configured Splunk

This will be your welcome page if everything is done right: 

![image alt](https://github.com/Cyberakr21/5-homelab-Splunk--images/blob/1e45f3005a0d432cb6c59e9e1663cd407da5c287/33%20splunk%20working.jpg)

## We will now be Installing the Universal Forwarder on the 2025 Windows Server to send logs to Splunk:**

Before powering the Windows Server 2025, you will need to add a NAT network adapter to allow the internet to download the universal forwarder. You can remove this adapter if you don't want to have your server to have internet access after you are done configuring the forwarder:

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/1%20set%20up%20NAT%20interface%20to%20have%20access%20to%20get%20uni%20forwarder.jpg)

Power on these machines: Windows Server, Splunk, and pfSense to configure the Splunk forwarder.

[Click Here to Download the Universal Forwarder](https://www.splunk.com/en_us/download/universal-forwarder.html)

**Steps to configure the forwarder:**

Log in to your Splunk machine to configure Splunk forwarding so that Splunk can receive Data:

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/3%20log%20into%20your%20splunk%20to%20enable%20splunk%20to%20recieve.jpg)

    Click "Setting"
    Next, Click "Forwarding and Receiving"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/4%20configure%20receiving.jpg)

    Click "Configure receiving"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/5%20click.jpg)

    Click "New Receiving Port"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/6%20use%20default%20splunk%20listening%20port.jpg)

    Click "9997" This is Splunks default listening
    Click"Save"

Configure an index to store the Data from the forwarder on Splunk:

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/7%20next%2C%20create%20splunk%20index%20for%20th%20server.jpg)

    Click "Indexes"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/8%20click.jpg)

    Click "New index"


![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/9%20name%20the%20index%20and%20save%20without%20changing%20anything%20else.jpg)

    Create an Index name
    Click "Save"

Once Splunk has been set up to receive, configure the Universal forwarder on Windows Server 2025:

Search up the Universal forwarder on a browser 

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/11%20log%20in%20an%20download%20the%20forwarder.jpg)

    Click "Download Now" Windows Server 2025

Go to your download folder and open the forwarder installation file:

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/1.jpg)

    Accept the agreement
    Select on Premises Splunk
    Click"Customize Options"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/2.jpg)

    Accept default 
    Click"Next"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/3%20click%20next.jpg)

    Accept default
    Click"Next"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/4.jpg)

    Choose local System
    Click"Next"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/5%20select%20what%20logs%20you%20want%20to%20monitor.jpg)

    Select the Data that you want to be forwarded to Splunk
    Click"Next"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/6%20splunk%20name.jpg)

    For username, use your Splunk username log in
    Set a password of your choice

**If you have Ubuntu GUI installed on the Ubuntu server, follow this to get your IP address to your Splunk instance:**

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/16%20get%20your%20ip%20from%20here.jpg)

Deployment server:

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/7.jpg)

    The hostname or IP will be your Splunk's IP address or hostname
    Use default port 8089
    Click"Next"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/8.jpg)

    The hostname or IP will be your Splunk's IP address or hostname
    Use default port 9997
    Click"Next"
    Click"Install" to go to the next menu
    Click"Finish" to exit the installation

**We will move to Splunk to finish the Splunk forwarder setup:**

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/20%20go%20to%20splunk%20and%20select%20add%20data.jpg)

    When you are in Splunk, Click"Setting"
    Click"Add Data"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/21%20select%20forward.jpg)

    Click"Forward"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/23%20click%20on%20the%20DC%20on%20avalible%20to%20that%20it%20appers%20on%20selected%20and%20type%20new%20server%20class.jpg)

    Double Click on "WINDOWS Cyberakr-DC"< This will be different since it's your domain name>
    On New Server Class Name: create a name like "DC" personal preference
    Click"Next"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/24%20select%20what%20you%20want%20to%20monitor.jpg)

    Click"Local Event Logs"
    Select the logs you want to receive by clicking on them
    Click"Next" when you are done

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/25%20where%20the%20logs%20will%20be%20stored.jpg)

    Select the Index you created earlier by pressing Default to find it
    Click"Review"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/26%20your%20config.jpg)

    The configs that you will see, depending on what you filled out
    Click"Submit"

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/27%20select%20start%20seaching.jpg)

    Click"Start Searching" This will let you see the logs received from your domain controller

**This should be your screen if everything has been configured correctly:**

![image alt](https://github.com/Cyberakr21/6-homelab-Splunk-forwarder--images/blob/23eaa2ec94f1b861b8d4c6323ec310ccf22fa4db/28%20At%20this%20point%20you%20have%20done%20setting%20up%20the%20forwarder.jpg)

This is the end of how to reproduce the lab. I will add more things later, so keep tuned.

## How to Use This Repository
Each section of the lab setup is documented with step-by-step instructions, screenshots, and configuration files. Follow the guides to replicate the setup in your own environment.

## Future Enhancements
- Adding more attack scenarios and detection use cases.
- Expanding the lab to include cloud-based components.
- pfsense firewall rules effects.
