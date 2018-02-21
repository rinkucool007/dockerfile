#This Docker File created by Pratap Padhy

#Specify the container Image
FROM microsoft/windowsservercore

#Copy the Jenkins installation Files into the container
ADD ./setup C:/DockerImages/jenkins

#Installing IIS
RUN Powershell.exe -Command Install-WindowsFeature Web-Server

#Installing Jenkins
RUN ["msiexec.exe", "/i", "C:\\DockerImages\\jenkins\\jenkins.msi", "/qn"]

#Removing Setup Files from Container
RUN Powershell.exe -Command remove-item C:/DockerImages/jenkins -Recurse