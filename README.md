# Active-Directory-Home-Lab-June-2026-

This project is meant to be an active directory home lab project that simulates an anterprise Active Directory environment using Windows Server 2022 and Windows 10 Enterprise virtual machines. Throughout this project, I will be simulating various active directory actions and responsibilities, including the following:
- Lab Setup (Virtual Infrastructure Setup, Active Directory Deployment, Client Domain Integration)
- Identity and Policy Management
- Security Administration and Validation
- Powershell Automation

I hope that with this project, I'm able to gain real, hands-on experience as to what kind of work I will be doing in the future within an IT position. I plan to continue updating this project with new Active Directory practices in order to continue expanding on my knowledge and gaining more experience that I will eventually use in the real world.

Environment Overview:
- Personal Home PC (AMD Ryzen 5 3600, GTX 2070, 16GB RAM, 250GB SSD, 1TB HDD,...) built by myself
- VirtualBox (Hypervisor)
- Windows Server 2022 (Domain Controller; 1 CPU, 2GB of RAM)
- Windows Client PC (Workstation #1; 1 CPU, 2GB of RAM)
- Active Directory Domain Services (AD DS)

Skills Learned and Demonstrated:
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

Project Architecture:

The architecture of this project was based around my home PC in which was used to host this entire project. Through the use of WIndows Server 2022 (domain controller), Windows 10 virtual machine (domain client), Active Directory structure (organizational), and shared network resources, I was able to form this project in a way that simulates a real-world work environment. 






Virtual Infrastructure Setup:
To start off, the very first steps were to download all of the software that I needed. In order to get the virtual machines in the first place, I devided to download VisualBox as my hypervisor. I chose this platform after doing research on various others (ex. VMWare Workstation Pro) because I noticed it's advanced features and ease of use for a project like this.

To get Windows 10 working on my hypervisor, I decided to use an ISO for Windows 10. This allowed me to begin creating virtual machines after configuration. While creating the virtual machine that I would mostly be using (Workstation #1), I set the allocations to my desired amounts (2GB RAM, 1 CPU, 30GB of Disk Space). Windows 10 has a minimum hard drive requirement of 16GBs, so 30GB felt like the right move to be able to handle everything that I wanted to accomplish in Active Directory. After this configuration I was able to add in my Windows 10 ISO, moving me into the installation phase of the project. From this point on, the Windows installation was similar to when I installed it onto my personal PC that I used to host this project. I was able to choose the Drive that I had created through VirtualBox to install Windows and give it a place to make processes.

Next up, I had to install Windows Server 2022. This consisted of the same steps, but rather than using the Windows 10 ISO of course, I had to use the Windows Server 2022 ISO that I had downloaded from Microsoft's website (https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022). After having both virtual machines set up, I moved onto configuring the networks in which they would both be based in. Through VirtualBox, I set up an IPv4 NAT Newtork with DHCP enabled and placed each virtual machine onto the isolated network.

The next step in the process was configuring my host VM onto the same IP address as my Windows Server 2022 VM. Through the use of the command prompt within my Server, I was able to find the IP address being used and set it to the same one within my host. This allows for my host VM to join the domain in which I'll be performing any Active Directory actions.
Afterwards came actually installing Active Directory Domain Services onto my server VM. After installing through the Server Manager, I created a new forest through the server's post-deployment configuration so that I could successfully use the Active Directory services. After creating a DSRM (Directory Services Restore Mode) password, I had successfully installed Active Directory and was ready to begin making users.

The final step of this setup process was creating a user. Through Active Directory, I navigated to Tools > New > User and created my first user (matching up to the host VM that I plan to use for this lab). After setting a username and password and changing some of the settings (ex. making the password never expire - I would never do this in an actual Active Directory environment, but since this is an isolated lab I'm doing it for ease of use), I was finally able to join the host VM with my domain. Through my host VM, I navigated to the Windows settings and through "Access work and school", I was able to successfully join the local Active Directory domain that I created earlier. After entering the domain name, using the login credentials created earlier for the user, and adding the account, I was successfully able to finish setup of my Active Directory lab.

**Note - To access shared folders, press Win + R and then type \\10.0.2.3**
Next tasks:
Users and Groups
- Create users --- Created 12 users; 3 users per organizational position (IT, HR, Sales, and Finance)
- Create security groups --- Created security groups for users based on organizational position
- (FIX) Assign Permissions --- Created shared folders for all separate organizational groups. Added groups (ex. IT_Users) to the security permission for respective organizational positions, and gave specific NTFS permissions to each. IT cannot access Sales folders, Sales cannot access HR folders, etc.

Organizational Units (OU)
- Create departments (IT, finance, etc) --- Created OUs through Server Manager based on made up departments (finance, HR, IT, etc.) for more organized structure, to be able to apply grouping policies, delegate admin control, etc. Leave "protect container from accidental deletion" for good practice
- Organize users and computers --- Organized users into respective OUs and also placed computer into "Workstations" OU
- Delegate administration --- Currently working on delegating permissions to HR as a test. Please hold...

Group Policy
- Password Policies --- Edited password polocies through the Group Policy Management Editor to better match a secure system. These changes apply to all users under the domain
- Account lockout policies --- Edited account lockout policies through the Group Policy Management Editor, settin a total of 5 possible attempts and a 15 min lockout if these attempts are used up. Tested this through the users on my host VM, and also practiced unlocking a user account through Users and Groups settings
- Disable control panel --- Through Group Policy Management Editor, tested our disabling the control panel for a specific group. Updated policy on the account of the HR (group affected), and made sure control panel was not accessible.
- (FIX) Map network drives --- In this part of the lab, you implemented automated network drive mapping using Group Policy Preferences (GPP) to simulate a real enterprise environment where users automatically receive department-specific network drives upon login.
- Configure desktop settings --- Configured desktop settings to disable certain features, such as changing the background, rmoving Run menu from the start menu, etc. using the Group Policy Management Editor

Security Concepts:
- Forcing password reset, disabling account, etc. --- Used Active Directory Users and Computers to implement some of these changes, and tested them with Test User1
- Test access controls --- Control panel restrictions, drive mapping, 
- Audit logon events --- Allow for audit tracking and view log on (4624) and log off (4634) attempts, as well as incorrect password attempts (4625)
- Explore account lockout behavior --- Explored lockout after xx amount of attempts (5), viewed locked account status in ADUC, manually unlocked account

Powershell
- Bulk create users --- Used Powershell to add bulk amount of users to domain...
- Disable inactive accounts --- Done..
- Query AD users and groups --- Done..
Will finish documentation and everything tomorrow morning.
...
