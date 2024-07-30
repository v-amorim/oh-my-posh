# Oh My Posh

This is my custom theme for [Oh My Posh](https://ohmyposh.dev/), a prompt theming engine for any shell.

## [Moonlight.omp.json][moonlight]

Is my proudly crafted theme, it has a set of customizations and a theme that make me feel at home.

<p align="center">
  <img alt="terminal" src="https://github.com/user-attachments/assets/68732055-e4b7-40a2-b434-2ca0a2149af8" width="100%"/>
</p>

<details>
   <summary>All segments and features displayed</summary>
  <p align="center">
    <img alt="terminal" src="https://github.com/user-attachments/assets/79c28100-644f-4421-9d15-9abf4ac4768a" width="100%"/>
  </p>

Segments, in order:

- Auxiliar 1st row:
  - [Battery][battery_seg]: displays an icon with the current battery, it changes based on 20%'s steps, then almost empty and full.
  - [Root][root_seg]: Icon displayed if the user is root/superuser/administrator.
  - [Upgrade][upgrade_seg]: Icon displayed if there are updates to Oh My Posh available.
  - [Session][session_seg]: Icon displayed if the user is connected via SSH.
  - [Python][python_seg]: Icon displayed if there's an active Python virtual environment.
  - [Docker][docker_seg]: Icon and image context are displayed if Docker is running.
  - [Status][status_seg]: Icon and error details are displayed if the last command failed.
- Main Row:
  - [OS][os_seg]: Icon changes based on OS, also contains a magic URL if clicked.
  - [Time][time_seg]: Displays the current time.
  - [Execution Time][execution_time_seg]: Displays the time it took to execute the last command, with a 500ms threshold.
  - [Git][git_seg]: Displays the current branch, changes based on the status of the repository.
    - Icons inside brackets:
      1. Icon displayed if there are changes in the working directory (untracked or modified files) or if there are changes staged for the next commit.
      2. Icon displayed if the branch has diverged (both ahead and behind the remote).
      3. Icon displayed if the local branch is ahead of the remote branch by at least one commit.
      4. Icon displayed if the local branch is behind the remote branch by at least one commit.
    - The current branch name is displayed and has a clickable URL to the repository.
  - [Path][path_seg]: Displays the current path, with a clickable URL to open the current directory in the default file explorer. Also contains some mapped folders with set icons.

</details>

<details>
   <summary>Theme timeline</summary>
   My theme journey, I learned a lot in the way and I feel proud of myself with how it turned out.
  <p align="center">
    <img alt="terminal" src="https://github.com/user-attachments/assets/6f022368-1bf9-499d-b8f8-0510235fa13e" width="100%"/>
  </p>

If any are to your liking, feel free to check the other theme files in this repository, they are named to be in cronological order.
Started with [Bubbles Extra][bubbles_extra] and kept changing ever since, now I feel that it is done (for now).

</details>

## Installation

A quick guide on how to set up Oh My Posh with this theme.

### Windows

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
   oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/v-amorim/oh-my-posh/main/themes/Moonlight.omp.json' | Invoke-Expression
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
   eval "$(oh-my-posh init bash --config 'https://raw.githubusercontent.com/v-amorim/oh-my-posh/main/themes/Moonlight.omp.json')"
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

<!-- URLS -->

[moonlight]: ./themes/Moonlight.omp.json
[battery_seg]: https://ohmyposh.dev/docs/segments/system/battery
[root_seg]: https://ohmyposh.dev/docs/segments/system/root
[upgrade_seg]: https://ohmyposh.dev/docs/segments/system/upgrade
[session_seg]: https://ohmyposh.dev/docs/segments/system/session
[python_seg]: https://ohmyposh.dev/docs/segments/languages/python
[docker_seg]: https://ohmyposh.dev/docs/segments/cli/docker
[status_seg]: https://ohmyposh.dev/docs/segments/system/status
[os_seg]: https://ohmyposh.dev/docs/segments/system/os
[bubbles_extra]: https://ohmyposh.dev/docs/themes#bubblesextra
[time_seg]: https://ohmyposh.dev/docs/segments/system/time
[execution_time_seg]: https://ohmyposh.dev/docs/segments/system/executiontime
[git_seg]: https://ohmyposh.dev/docs/segments/scm/git
[path_seg]: https://ohmyposh.dev/docs/segments/system/path
