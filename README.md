# NanoJava

This is a nanoserver based Docker image which provides openJDK to windows containers.

# Usage

Please set up docker on Windows 10 or Windows Server 2016 following the [instructions from Microsoft](https://msdn.microsoft.com/en-us/virtualization/windowscontainers/quick_start/quick_start_windows_10).

Then, as Administrator, build the docker file.  

```
docker build --tag nanojava .
```

# Examples

```
docker run nanojava java -version
``` 