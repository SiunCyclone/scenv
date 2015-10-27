## Setup Procedure

### Windows

1. Download scenv by powershell

  ```
PS> (New-Object System.Net.WebClient).DownloadFile("https://github.com/SiunCyclone/scenv/archive/master.zip", "scenv.zip")
  ```

2. Unzip scenv.zip and execute **windows.bat** by administrator

3. Open a MSYS2-shell and execute below command

  ```
$ update-core
  ```

4. Reopen a MSYS2-shell by administrator and execute **setup.sh**


### Arch Linux

1. Install Git
  ```
$ sudo pacman -S git
  ```

2. Clone the scenv repository
  ```
$ git clone https://github.com/SiunCyclone/scenv.git
  ```

3. Execute **setup.sh**
  ```
$ cd scenv
$ ./setup.sh
  ```

