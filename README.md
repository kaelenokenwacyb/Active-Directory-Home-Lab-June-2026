# Active Directory Home Lab (June 2026)

This project is meant to be an active directory home lab project that simulates an anterprise Active Directory environment using Windows Server 2022 and Windows 10 Enterprise virtual machines. Throughout this project, I will be simulating various active directory actions and responsibilities, including the following:
- Lab Setup (Virtual Infrastructure Setup, Active Directory Deployment, Client Domain Integration)
- Identity and Policy Management
- Security Administration and Validation
- Powershell Automation

I hope that with this project, I'm able to gain real, hands-on experience as to what kind of work I will be doing in the future within an IT position. I plan to continue updating this project with new Active Directory practices in order to continue expanding on my knowledge and gaining more experience that I will eventually use in the real world.

# Environment Overview:
- Personal Home PC (AMD Ryzen 5 3600, GTX 2070, 16GB RAM, 250GB SSD, 1TB HDD,...) built by myself
- VirtualBox (Hypervisor)
- Windows Server 2022 (Domain Controller; 1 CPU, 2GB of RAM)
- Windows Client PC (Workstation #1; 1 CPU, 2GB of RAM)
- Active Directory Domain Services (AD DS)

# Skills Learned and Demonstrated:
- Active Directory Domain Services (AD DS)
- Domain Controller configuration
- Organizational Unit (OU) design
- User and group management
- Group Policy (GPO)
- PowerShell automation
- File sharing and NTFS permissions
- Security policy enforcement
- Account lockout and password policies
- Client domain integration

# Project Architecture:

The architecture of this project was based around my home PC in which was used to host this entire project. Through the use of WIndows Server 2022 (domain controller), Windows 10 virtual machine (domain client), Active Directory structure (organizational), and shared network resources, I was able to form this project in a way that simulates a real-world work environment. 

<img width="900" height="600" alt="My Physical PC" src="https://github.com/user-attachments/assets/33431bfa-4efd-4d71-beaa-f6744def3728" />

# Project Phases
Note: More depth to each of these phases can be found below where I explain each one in depth with screenshots

Lab Setup
- Virtual machine + hypervisor creation
- Active Directory Domain Services installation
- Domain creation + joining

Identity and Policy Management + Testing
- OU Creation
- Users & Groups
- Group Policy Congifuration
- Password and lockout policies
- Access restrictions
- Verifying Access and Control
- Audit Analysis

Powershell Automation
- Bulk user creation
- AD querying
- Inactive account checks

# Key Takeaways

This project provided valuable hands-on experience simulating real-world IT environments and workflows. It strengthened my understanding of core tools and concepts such as Active Directory, virtualization, and domain administration, while also giving me practical experience building and managing a domain from the ground up.

Throughout the project, I encountered several challenges that helped deepen my technical problem-solving skills. For example, while developing PowerShell automation scripts, I ran into errors that prevented proper execution. By carefully reviewing my code, researching solutions, and troubleshooting step by step, I was able to identify small syntax and logic issues and ultimately resolve them successfully.

Another challenge arose when testing Group Policy configurations within the HR_Users group. Some policies did not behave as expected, and the system appeared to apply additional unintended settings. By investigating group properties and reviewing policy inheritance and configurations, I was able to identify and correct the issue, ensuring the intended policies were properly applied and tested.

Overall, these challenges reinforced the importance of methodical troubleshooting, attention to detail, and independent research when working in IT environments.

In a real-world context, this lab closely reflects responsibilities commonly found in IT support or help desk roles, such as managing user accounts, handling password resets and account lockouts, configuring access permissions, and maintaining organizational resources. This experience has helped prepare me for similar responsibilities in a professional environment and will serve as a strong foundation for my future career in IT.

# In-Depth Explanations
## Lab Setup
### Virtual Machine + Hypervisor Creation
To start off with this lab, the very first steps were to download all of the environment tools that I needed to complete this lab in the first place. In order to get the virtual machines that I needed, I decided to use VirtualBox as my hypervisor. I chose this platform after doing research on various others (ex. VMWare Workstation Pro). because I found it to have advanced features while still being simple and reliable for a prject like this. 

To get Windows 10 working on my hypervisor, I decided to use an ISO. This allowed me to begin setting up virtual machines after configuration. While creating the virtual machines that I would mostly be using (WinPC1 and WinServer), I set the allocations to my desired amounts (2GB RAM, 1 CPU, 30GB of Disk Space. Windows 10 has aminimum hard drive requirement of 16GBs, so 30GB felt like the right move to be able to handle everything that I wanted to accomplish in Active Directory. Windows Server 2022 installation consisted of the same process, but rather than using the Windows 10 ISO, I used the Windows Server 2022 ISO from Microsoft's website (https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022). 

<img width="776" height="516" alt="image" src="https://github.com/user-attachments/assets/29c72de5-89ee-4ca6-9ff7-13807257a627" />
<img width="778" height="517" alt="image" src="https://github.com/user-attachments/assets/df263ccf-0a07-4df8-b9c8-7d56b8b99ceb" />

After this configuration, I was able to add in my Windows 10 ISO, moving me into the installation phase of the project. From this point on the WIndows installation was similar to when I installed it on my personal PC that I used to host this project. I was able to choose the drive that I had created through VirtualBox to install Windows and give it a place to carry out different processes. After having both virtual machines set up, I moved onto configuring the networks in which they would both be based on. Through VirtualBoz, I set up an IPv4 NAT Network with DHCP enabled and placed each virtual machine onto the isolated network.

<img width="1919" height="864" alt="image" src="https://github.com/user-attachments/assets/789188a1-da48-438b-b9bb-b79e5a839c52" />
<img width="778" height="519" alt="image" src="https://github.com/user-attachments/assets/3120782f-d224-497c-a6b6-1c7078946f57" />
<img width="778" height="516" alt="image" src="https://github.com/user-attachments/assets/fb9e5e71-a399-4c34-8c86-6dc16fac40c6" />

### Domain Creation

The next step in the process was configuring my host virtual machine on the same IP address as my Windows Server 2022. Through the use of the command prompt within my server virtual machine, I was able to find the IP address being used and set it to the same one within my host. This allowed for my host virtual machine to join the domain in which I'll be performing any Active Directory actions. 

### Active Directory Installation + Domain Joining

Afterwards came actualy installing Active Directory Domain Services onto my server virtual machine. After installing through the Server Manager, I created a new forest through the server's post-deployment configuration so that I could successfully use the Active Directory services. After creating a DSRM (Directory Services Restore Mode) password, I had successfully installed Active Directory and was ready to begin making users.

<img width="1023" height="847" alt="image" src="https://github.com/user-attachments/assets/c6bc90a4-857e-449f-8e65-663a1b67c2bf" />
<img width="1025" height="852" alt="image" src="https://github.com/user-attachments/assets/a268fb5c-82fc-48be-8b36-584409bd8683" />

The final step of this process was creating a user. Through Active Directory, I navigated to Tools > New > User and created my first user (matching up to the host VM that I plan to use for this lab). After setting a username and password, and changing some of the settings (ex. making the password never expire - I would never do this in an actual Active Directory environment, but since this lab is islated I'm doing it for ease of use), I was finally able to join the host virtual machine with my domain.

<img width="1075" height="850" alt="image" src="https://github.com/user-attachments/assets/6ee4e949-14ac-4352-a53c-e21250d924ff" />
<img width="1076" height="853" alt="image" src="https://github.com/user-attachments/assets/a429bd33-b4d1-48e8-85b0-86fe461f11ac" />

Through my host VM, I navigated to the Windows settings and through "Access work and school", I was able to successfully join the local Active Directory domain that I created earlier. After entering the domain name, using the login credentials created earlier for the user, and adding the account, I was successfully able to finish the set up of my Active Directory lab.

<img width="946" height="853" alt="image" src="https://github.com/user-attachments/assets/cb058bbd-5ff6-4a46-b82e-3a7bc4c9b067" />







## Identity and Policy Management + Testing

--

## Powershell Automation

--
