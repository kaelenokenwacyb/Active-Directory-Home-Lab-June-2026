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

<img width="1800" height="1200" alt="My Physical PC" src="https://github.com/user-attachments/assets/33431bfa-4efd-4d71-beaa-f6744def3728" />

# Project Phases
Note: More depth to each of these phases can be found below where I explain each one in depth with screenshots

Lab Setup
- Virtual machine creation
- Active Directory Domain Services installation
- Domain creation
- Client joining the domain

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

## In-Depth Explanations
