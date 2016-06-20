FROM nanoserver:latest

RUN powershell -Command "Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force;Set-PSRepository -Name PSGallery -InstallationPolicy Trusted;Install-Module PS7Zip;" 
 
ADD https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.91-3/java-1.8.0-openjdk-1.8.0.91-3.b14.windows.x86_64.zip java.zip

RUN setx /M JRE_HOME C:\java-1.8.0-openjdk-1.8.0.91-3.b14.windows.x86_64\jre
RUN setx /M JAVA_HOME C:\java-1.8.0-openjdk-1.8.0.91-3.b14.windows.x86_64
RUN powershell -Command "Expand-7Zip java.zip"
RUN powershell.exe -Command $path = $env:path + ';C:\java-1.8.0-openjdk-1.8.0.91-3.b14.windows.x86_64\bin'; Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\' -Name Path -Value $path

CMD powershell.exe