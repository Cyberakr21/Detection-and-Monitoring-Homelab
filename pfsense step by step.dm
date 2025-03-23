<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pfSense Setup Guide</title>
</head>
<body>
    <h1>pfSense Setup Guide</h1>

    <h2>1. Install VMware Workstation</h2>
    <p>Start by installing VMware Workstation on your host machine. This will serve as the hypervisor to host the virtual machines for the lab.</p>

    <h2>2. Create a New Virtual Machine for pfSense</h2>
    <p>In VMware Workstation, click on "Create a New Virtual Machine" to start the setup process.</p>
    <p>Select the "Typical (recommended)" configuration type and click "Next".</p>
    <p>Choose the "Installer disc image file (iso)" option and browse to the location of the pfSense installation ISO file.</p>
    <p>Proceed with the default settings for the virtual machine configuration, including the disk size of 20 GB as recommended for FreeBSD version 10 and earlier 64-bit.</p>
    <p>Name the virtual machine as "pfSense" and choose the location to store it.</p>

    <h2>3. Configure the pfSense Virtual Machine</h2>
    <p>Once the virtual machine is created, power it on and you will see the pfSense welcome screen.</p>
    <img src="image1.png" alt="pfSense Welcome Screen" />

    <h2>4. Set up the Network Interfaces</h2>
    <p>After the reboot, you will be prompted to configure the network interfaces.</p>
    <img src="image2.png" alt="Network Interface Configuration" />
    <p>Assign the appropriate interfaces for the WAN (em0) and LAN (em1) connections based on your network setup.</p>
    <img src="image3.png" alt="Assign Interfaces" />

    <h2>5. Configure LAN Settings</h2>
    <p>Configure the LAN settings as follows:</p>
    <img src="image4.png" alt="LAN Configuration" />
    <p>Enable the DHCP server on the LAN interface if required.</p>
    <img src="image5.png" alt="Enable DHCP" />

    <h2>6. Complete the pfSense Configuration</h2>
    <p>Follow the on-screen prompts to finish the pfSense configuration, including setting the admin password and enabling additional features as needed.</p>
    <img src="image6.png" alt="Final Configuration" />

    <h2>7. Explore the pfSense Web Interface</h2>
    <p>You can explore the pfSense web interface and configure firewall rules, VLANs, and other advanced settings to meet the requirements of your cybersecurity homelab.</p>
    <img src="image7.png" alt="pfSense Web Interface" />

    <h2>Conclusion</h2>
    <p>By following these steps, you will have successfully installed and configured the pfSense firewall as the core component of your cybersecurity homelab setup. This provides the foundation for network segmentation, security monitoring, and other security-related tasks in the lab environment.</p>
</body>
</html>
