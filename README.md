### Windows

#### Procedure

1. Download scenv by powershell

  ```
PS> (New-Object System.Net.WebClient).DownloadFile("https://github.com/SiunCyclone/scenv/archive/master.zip", "scenv.zip")
  ```

2. Unzip scenv.zip and execute **windows.bat** by administrator

3. Open a MSYS2-shell and execute below command

  ```
$ pacman --needed -Sy bash pacman pacman-mirrors msys2-runtime
  ```

4. Reopen a MSYS2-shell by administrator and execute **windows.sh**

