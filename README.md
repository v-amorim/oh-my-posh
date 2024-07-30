# Oh My Posh

This is my custom theme for [Oh My Posh](https://ohmyposh.dev/), a prompt theming engine for any shell.

<p align="center">
  <img alt="terminal" src="https://github.com/user-attachments/assets/417ed752-acec-4128-9be6-6c1b808e7dcf" width="100%"/>
</p>

## Windows

1. Install [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab)
1. Install [Oh My Posh](https://ohmyposh.dev/docs/installation/windows):

   ```powershell
   winget install JanDeDobbeleer.OhMyPosh -s winget
   ```

1. Go to your WindowsPowerShell folder and paste the contents of `Microsoft.PowerShell_profile.ps1` in the beginning of the file:

   ```powershell
   code $PROFILE
   ```

1. Paste these lines at the start of the file:

   ```powershell
   oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/v-amorim/self_development/main/config/oh-my-posh/themes/v-amorim.omp.json' | Invoke-Expression
   $env:VIRTUAL_ENV_DISABLE_PROMPT = 1
   ```

1. Reload your profile:

   ```powershell
   . $PROFILE
   ```

1. To enable auto suggestions, run:

   ```powershell
   Install-Module PsReadLine -Force
   Install-Module -Name Terminal-Icons -Repository PSGallery
   ```

To get the latest versions whenever there's an update, run:

```powershell
winget upgrade JanDeDobbeleer.OhMyPosh -s winget
winget upgrade --all # Or this, to update all
```

## Linux

1. Install [Oh My Posh](https://ohmyposh.dev/docs/installation/linux):

   ```bash
   sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
   sudo chmod +x /usr/local/bin/oh-my-posh
   sudo apt install unzip; curl -s https://ohmyposh.dev/install.sh | sudo bash -s
   ```

1. Go to your `.bashrc` file:

   ```bash
   code ~/.bashrc
   ```

1. Paste this line at the end:

   ```bash
   eval "$(oh-my-posh init bash --config 'https://raw.githubusercontent.com/v-amorim/self_development/main/config/oh-my-posh/themes/v-amorim.omp.json')"
   ```

1. Reload your profile:

   ```bash
   source ~/.bashrc
   ```

1. To get the latest versions whenever there's an update, run:

   ```bash
   curl -s https://ohmyposh.dev/install.sh | sudo bash -s
   ```

This can fix the auto update requiring sudo:

```bash
sudo chown -R $(whoami) /usr/local/bin
```
