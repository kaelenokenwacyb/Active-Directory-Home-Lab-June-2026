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
- Active Directory Domain Services installation + Domain Setup

Identity and Policy Management + Testing
- OU Creation
- Users & Groups
- Group Policy Congifuration
- Password and lockout policies
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

<img width="600" height="350" alt="image" src="https://github.com/user-attachments/assets/29c72de5-89ee-4ca6-9ff7-13807257a627" />
<img width="600" height="350" alt="image" src="https://github.com/user-attachments/assets/df263ccf-0a07-4df8-b9c8-7d56b8b99ceb" />


After this configuration, I was able to add in my Windows 10 ISO, moving me into the installation phase of the project. From this point on the WIndows installation was similar to when I installed it on my personal PC that I used to host this project. I was able to choose the drive that I had created through VirtualBox to install Windows and give it a place to carry out different processes. After having both virtual machines set up, I moved onto configuring the networks in which they would both be based on. Through VirtualBoz, I set up an IPv4 NAT Network with DHCP enabled and placed each virtual machine onto the isolated network.

<img width="960" height="432" alt="image" src="https://github.com/user-attachments/assets/789188a1-da48-438b-b9bb-b79e5a839c52" />
<img width="600" height="350" alt="image" src="https://github.com/user-attachments/assets/3120782f-d224-497c-a6b6-1c7078946f57" />
<img width="600" height="350" alt="image" src="https://github.com/user-attachments/assets/fb9e5e71-a399-4c34-8c86-6dc16fac40c6" />


### Active Directory Installation + Domain Setup

The next step in the process was configuring my host virtual machine on the same IP address as my Windows Server 2022. Through the use of the command prompt within my server virtual machine, I was able to find the IP address being used and set it to the same one within my host. This allowed for my host virtual machine to join the domain in which I'll be performing any Active Directory actions. Afterwards came actualy installing Active Directory Domain Services onto my server virtual machine. After installing through the Server Manager, I created a new forest through the server's post-deployment configuration so that I could successfully use the Active Directory services. After creating a DSRM (Directory Services Restore Mode) password, I had successfully installed Active Directory and was ready to begin making users.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/c6bc90a4-857e-449f-8e65-663a1b67c2bf" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/a268fb5c-82fc-48be-8b36-584409bd8683" />


The final step of this process was creating a user. Through Active Directory, I navigated to Tools > New > User and created my first user (matching up to the host VM that I plan to use for this lab). After setting a username and password, and changing some of the settings (ex. making the password never expire - I would never do this in an actual Active Directory environment, but since this lab is islated I'm doing it for ease of use), I was finally able to join the host virtual machine with my domain.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/6ee4e949-14ac-4352-a53c-e21250d924ff" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/a429bd33-b4d1-48e8-85b0-86fe461f11ac" />


Through my host VM, I navigated to the Windows settings and through "Access work and school", I was able to successfully join the local Active Directory domain that I created earlier. After entering the domain name, using the login credentials created earlier for the user, and adding the account, I was successfully able to finish the set up of my Active Directory lab.

<img width="600" height="350" alt="image" src="https://github.com/user-attachments/assets/cb058bbd-5ff6-4a46-b82e-3a7bc4c9b067" />


## Identity and Policy Management + Testing

The next part of this lab was actually beginning to handle various activities within Active Directory. This section is the true depth of the project, providing me with first hand exprience as to some of the work that an actual IT Support or Help Desk employee would do. 

### OU Creation
Starting this section off, the first step that I decided to take was creating various organizational units. As seen within my diagram above, the OUs that I created were meant to simulate an actual organizational structure, allowing me to get as close as possible to the actual work that this lab is meant to simulate.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/8a6edbdd-30a1-40f0-b69b-3b79efe268b2" />


With these OUs, I would be able to practice many concepts, such as making grouping policies, delegating admin control, etc. Outside of the organizational OUs, that I made, I also decided to create OUs specifically for users (for future use when I return to this project with more users), and a workstation OU, allowing me to move my desktop there for further organization in terms of having structure through Active Directory.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/38694b2e-51f8-41db-a1b6-08e324e68e62" />


### Users and Groups
With my organizational units being completed, next up was creating actual users to populate each simulated organizational area. For this lab, I decided to create 3 users per organizational unit. Each unit (HR, Finance, Sales, and HR) would have their own simulated users with specific files and permissions. Below are the users within each organizational group.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/197e8854-6043-42e1-830d-bf0a5f79c6b5" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/761edd7f-7c2f-498b-beb4-815640bf7f59" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/34a37c35-dcd5-4282-b13d-c802f2e786b7" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/8aa9fc19-5654-49fe-8fda-7d9ab057e116" />


I then created security groups for each group of users based on their organizational position. This allowed for me to bundle all of my users into manageable groups that can be assigned specific permissions and powers depending on which part of the organization they belong to.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/2a02ab11-8cb1-4466-8758-00c4dacb1528" />


With the users and security groups being made, I could begin assigning specific NTFS permissions to different groups of users.  To gain experience and test giving permissions, I decided to create a set of folders for each organizational unit that would house documents specifically made for each separate unit. With the permissions provided, each group should only be allowed to access the contents of their own folders (ex. IT cannot access HR folders, etc.). After making these folders, I went into the properties to change the specific allowances for the IT_Users group.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/000c8c22-b722-45ec-9ce8-47973d64cd79" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/0f224e64-4060-4601-870a-ecfc2cb147be" />


To test this out, I tried to make an IT department user access a sales department folder, in which you can see the permissions stopped this from occurring. 

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/b92907bc-c44b-46bb-a3d9-843ee1241ee7" />


By testing each action that I do, I can not only verify that what I did works, but also gain practice into the good habit of verifying that the changes you make work without assuming. Before moving onto the next portion, I wanted to make an attempt at providing admin permissions to one of my organizational groups as well, hoping that I would be able to successfully complete this. With that being said, I decided to delegate admin permissions to HR department users to test the capabilities. Using the Delegation of Control Wizard, I was able to provide HR users with these permissions, allowing them to create, delete, and manage user accounts, as well as reset user passwords. I wanted the HR department users to be able to simulate what an actual HR employee does in a real-world workplace.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/f0e24961-1b6a-4654-88f9-020083d645ec" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/9499fdb3-b3f1-4a38-9e9f-a2129ec00a9a" />


### Group Policy Configuration
The next step that I wanted to test out within my lab was setting up group policies controlling more of what they can and can't access within the computer. I decided to try out a simple change, focusing on the desktop customization and control panel access this time around. In order to create these policies, I used the Group Policy Management Editor tool within Server Manager to continue testing with my HR users sample group. Within the Policy Management Editor, I found the default domain policy that was currently set to be active, and then located the setting that prohibits access to the Control Panel and PC settings for HR users, just to test and see if this permission would work if changed. After actually changing the policy so that HR users could no longer access the Control Pancel and PC settings, I then had to update said policy through my host virtual machine's command prompt for it to take full effect.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/258dee72-031f-40c0-9fc9-fb34d6bc04b5" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/3d033d4c-708e-458b-b4d9-25f0a3f4eb9b" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/5d756f52-aba7-4586-b906-fcc4f9fde209" />


After attempting to open the control panel to see if this worked, an error message occured stating that restrictions had been put in place, showing me that this process did work in the end. 

<img width="600" height="350" alt="image" src="https://github.com/user-attachments/assets/585d67bc-9eab-4d48-a912-e9be864065a2" />


To test this further, I decided to disable desktop customization to see if this would also function as intended. Similar to how I changed the control panel settings, I navigated through the Group Policy Management Editor to find personalization settings - specifically on being able to edit the desktop background. After finding this setting and turning it on, I tested it again by making an attempt on this HR user to change the background, in which I was again greeted with an error message.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/318f117c-210b-4f6c-ac26-23203133c995" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/81f63603-110f-45d4-a09f-ff5e9d14a383" />


Testing policies and permissions was one of the biggest highlights of this project for me, as it shows that Active Directory gives the user accessibility when it comes to managing an organization and ensuring that access is divided into specific, organized sections rather than being in a random structure.

### Password and Lockout Policies
With my group policies working well, the next thing that I knew I had to tackle was password and lockout policies. This is one of the main areas that an IT worker handles on the day-to-day basis, with passwords constantly being forgotten and mixed up, and the worker having the resposibility of helping those on the other end recover their accounts.

Once again within the Group Policy Management Editor, I found the settings for password management that would allow me to control the rquirements for a password upon being created. There are various settings here that I decided to change, such as the minimum password length, maximum password age, and all passwords requiring a certain amount of complexity.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/4605b8fd-2567-4a19-8f6a-dd10145ca4de" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/5f6f86b9-1309-4ac6-bb99-dba0cf768dda" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/6d8ed36e-58bd-4be0-bdbb-eb21e648d623" />


I also decided to make an attempt at a policy in which a user would be locked out after 5 attempt of inputting an incorrect password. This is important on a security standpoint, where someonme could be attempting to access a device that they shouldn't be in. With that being said, I logged out of my HR user in which I made these changes, and maed sure that these lockdown policies were put into effect. 

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/74422253-5726-471f-b0db-5367095ba5d4" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/1340bcfe-c8c1-4f0b-88ec-d47c9fc4613e" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/fe1ec072-5218-4909-b230-15f0c271898d" />


To ensure that this lockdown worked (and to test unlocking said user's account), I used Server Manager once again to locate the user's account, and within properties, unlock their account so that they could once again access it andinput the correct password.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/bcca4275-b089-44f5-be16-2ead3049c164" />


### Verifying Access and Control
Next, I wanted to test the control settings for disabling user accounts and also resetting user passwords if they are locked out of their account. Disabling a user account is helpful for when you don't want to necessarily delete an account, but you want to cease access while still having your own access to the data, security identifier(s), etc. Once again through the Server Manager's Active Directory Users and Computers section, I decided to test out disabling a sample account that I had created (Test User). Through the users screen, I created and selected this user, and pressed disable account. I wanted to ensure that this change worked, so using this sample user's login credentials, I attempted a log in.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/6d5a14ff-a40c-49e1-a4a1-2b9f1a8f16b5" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/9fe2e789-041f-4a75-922f-c21e84350d82" />


This process worked successfully, as the account was no longer accessible. To reverse this change, I simply had to go back into the Users and Computers section and repeat the same process, this time selecting to enable the account an allow the user to log in. Next, I attempted to force users to reset their password upon logging in again. Within the same section as before, I navigated to the same test user, and went to their account settings through properties, checking the "User must change password at next logon" option. With this, you can ensure that passwords stay protected or changed in the case that a breach or other issue occurs. 

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/6f3170d6-0544-491c-8c83-6877c2005bd3" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/ba0fd431-8c0a-439f-9f23-e04d83a91d27" />


With this now working and the system making the user reset their password at this next login, there was one more thing I wanted to test.

### Audit Analysis
The final process that I wanted to ensure that I could do within the 'Users and Groups' section was seeing an audit log of events that occur within these user accounts. An audit list is useful for tracking who does waht within your network, and when these actions were performed. To begin with this, I used the Group Policy Management Editor to change the type of audit information that is shown within my domain. To start off with somehting simple, I decided to enable Audit Logon and Audit Logoff information, showing me when users log in and log out of their accounts. With that being said, afterwards I opened up Event Viewer within my WinServer virtual machine, and navigated to Windows Logs > Security to view the various logon and logoff times of my various sample users. The event IDs listed hold different meanings, with 4624 being a log on, 4634 being a logoff, and 4625 being an incorrect password attempt.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/7053029f-ba6b-4391-8e89-31d50897b9f4" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/d91ccacc-ca81-48f9-9867-5e67a1395f6b" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/7d94765d-69ee-47a1-a4ed-8f5fb6dc2d9e" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/47c94d3a-3cc4-4787-b8f6-6b5621517b64" />


Through exploring this audit list, I can keep track of what happens within my environment to gain hands-on experience with user activity management.

## PowerShell Automation
### AD Querying
The final portion of this lab handled various actions with PowerShell. Using PowerShell allows you to implement scripting into this entire user management process, simplifying many tasks and allowing the administrator to make the job easier.

The first process that I wanted to test through PowerShell was being able to query within my domain. AD querying allows for you to search and filter through your domain, finding information on the users, groups, and more. I researched online and tested various PowerShell commands that would return back information to me about the domain that I worked on through this entire process. First off, I started with querying my AD users, and then moving on to have this include more information, such as the user's last logon date:

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/155d5cdf-3748-4336-8320-9d204276bbe1" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/e26da9be-099e-46f4-832a-618b6e5023e5" />


I decided to take this a step further, making an attempt at querying based on being able to find a specific user within my domain:

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/0d911cf6-1c0c-4c92-a646-06d95fa525f9" />


I also wanted to ensure that this PowerShell feature would work with the groups within my domain, so I ran scripting that would return back my groups, and members of said groups as well:

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/658147b7-adab-4cce-8d27-28e03afac581" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/fde5ae02-0021-4bee-a736-dbb23c6b7102" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/ddff017f-9ea5-4728-b8fe-c4d76f12d414" />


Lastly, I was able to display groups for specific users of the domain (ex. HR users), as well as displaying both users and group relationships at the same time:

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/044c4b43-3c8e-409b-bb72-2e38641e8b66" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/6c3d4012-f0e1-4054-90d3-868444988fe7" />


### Bulk User Creation
The next section of the domain's PowerShell automation that I wanted to test was being able to create bulk users at once, rather than doing it individually through Server Manager. In order to do this, I first had to create my own csv file (found within this repository's files) that would create a sample group of users to be added into my domain. 

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/4f231635-b15c-435a-8e4a-a113d4a8b50e" />


I then had to create a .ps1 and write the script that would implement these users into my domain. This script would then be implemented into PowerShell through the file itself, rather than manually typing the script into PowerShell. I found this to be much easier, as it makes the process much more seamless.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/955cc081-576b-40e9-8f5c-c0dbd9daf72f" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/4e54978e-4e5f-4e95-9c74-13db135f4944" />


After successfully managing to add the .ps1 file into PowerShell and ensuring that my script worked, I ran everything and checked to ensure that the users were added into my domain. 

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/cabf44d6-c8a5-481d-87f4-7f2a84450dac" />
<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/2bff4fcc-1ff0-4561-b476-1a36c1e624a5" />


This process demosntrated to me how seamless you can make the Active Directory process, whether you decide to rely on programs such as Server Manager, or decide to use your own scripting in order to manage your domain.

### Inactive Account Check
The final part of this lab (for now!) was the ability to check for inactive accounts. I found this to be another crucial part of Active Directory, as you can see which accounts can possibly be cleared or may be unecessary in terms of your domain having excess users that it may not need.

Finding this information was a much easier process. After researching online, I found the necessary functions that would allow me to find this information through PowerShell (Search-ADAccount...). With this line of scripting, I was successfully able to note which user accounts were inactive based on the timespan I specified. Since the users that I created for this lab were all new (only a few days old), it had instead returned any users that I had created but not yet logged into, such assome from the IT and Finance departments of the groups that I created earlier but not yet logged into.

<img width="850" height="600" alt="image" src="https://github.com/user-attachments/assets/26e98a22-20da-4641-a8c6-a07f07fa7be3" />


## Conclusion
With that being said, ths lab taught me a lot about how Active Directory is used for managing domains. I value what I learned within this lab as I will one day use it in the real-world, and I hope that I'm able to land a position in which I can put all of these concepts into play! As time goes on, I plan to find new fun and interesting ways to continue my work through Active Directory here on my home lab. As I discover new things to implement and test, I hope that I can further my understanding of Active Directory as a whole, and share any progress that I make here on my GitHub account for others to see. Thank you for viewing this repository!

--
