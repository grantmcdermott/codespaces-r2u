# Minimal(ish) Codespaces environment for R

This repo provides a lightweight and batteries-included Codespaces example for
R. Powered by the
[Rocker Project's Devcontainer Features](https://rocker-project.org/images/devcontainer/features.html),
you can get a fully functioning R environment up in cloud in a few minutes.
What's more, thanks to [r2u](https://eddelbuettel.github.io/r2u/) you can add
easily to this environment by installing new R packages in a fast and failsafe
way. 

### Try it out

To get started, simply click on the green "Code" button at the top right. Then
select the "Codespaces" tab and click the "+" symbol to start a new Codespace.

![](codespaces.png)

The first time you do this, it will open up a new browser tab where your Codespace
is being instantiated. This first-time instantiation will take a few minutes
(feel free to click "View logs" to see how things are progressing). But your
Codespace should deploy almost immediately when you use it again in the future.

![](instantiate.png)

Once the VS Code editor opens up in your browser, feel free to open up the
`example.R` and run the code: Highlight or hover over line(s) and execute them
by hitting  `Cmd`+`Return` (Mac) / `Ctrl`+`Return` (Linux / Windows).

![](vscodespace.png)

Don't forget to close your Codespace once you have finished using it. Click the blue
"Codespaces" tab at the very bottom left of your VS Code editor and select "Close
Current Codespace" in the resulting pop-up box. You can restart it at any time, by
going to https://github.com/codespaces and clicking on your instance.


### Local DevContainer build

Codespaces are just DevContainers running in the cloud (where DevContainers are
themselves just Docker images running with some VS Code sugar on top.) To test
this setup locally, simply clone the repo and open it up in VS Code. You will
need to have Docker installed and running on your system (see
[here](https://docs.docker.com/engine/install/)). You will also need the
[Remote Development extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
(you will probably be prompted to install it automatically if you don't have it
yet). Select "Reopen in Container" when prompted. Otherwise, click the `><` tab
at the very bottom left of your VS Code editor and select this option. To shut
down the container, simply click the same button and choose "Reopen Folder
Locally". You can always search for these commands via the command palette too
(`Cmd+Shift+p` / `Ctrl+Shift+p`).

### Customizing

If you find that you install the same packages over and over again when you start the Codespace, you can configure it to do some installs every time you launch it, automatically. Functionally, the `postCreateCommand` can execute any Linux command during the build process. We have here configured it to look for a file `install.R` which simply contains all the necessary `install.packages()` commands as needed. An example (`example-install.R`) is provided. 

#### How would you implement this?

Currently, no extra packags are installed. But if you rename/move the `example-install.R` to `install.R` and rebuild the container, you will have some additional packages installed, every time you launch the Codespace.

Steps:

- Fork the repository
- Rename `example-install.R` to `install.R`
- Commit
- Launch a new Codespace, now from your own fork, and voilà!

#### How do you rename/move?

- Github web interface: click on the "Edit this file" button while viewing `example-install.R`. You can change the filename near the top.
- Codespace interface: right-click on `example-install.R` and choose `[Rename]`. Don't forget to commit changes!

### Costs

Cloud services may cost money. Even closed, Codespaces you create can still accumulate costs based on the storage used, until they are deleted (not just paused). 

> TL;DR Most users will easily stay within the free tier, but if you intend to use Codspaces a LOT, read on.

Github Codespaces has a free tier (see [full pricing information](https://docs.github.com/en/billing/managing-billing-for-github-codespaces/about-billing-for-github-codespaces)). As of Oct 2023, 120 core hours of compute time, and  15GB-months storage, are provided for free. 

#### Compute hours

The smallest devcontainer you can create has 2 cores (that is the default), so that corresponds to 60 active computing hours per month, less if you choose a bigger container for computation, for instance, because you need more memory (see [guidance](https://docs.github.com/en/codespaces/customizing-your-codespace/changing-the-machine-type-for-your-codespace)). Currently, the largest generally available machine type provides 16 cores (and 64GB of RAM) - so that would be 7.5 hours of compute time before you start paying! Also note that unless you pause the machine, your Codespace will continue to run (by default, [for 30 minutes](https://docs.github.com/en/codespaces/customizing-your-codespace/setting-your-timeout-period-for-github-codespaces)) after you close your browser window, consuming compute time from your quota.

#### Storage

An empty container freshly started from this devcontainer (2 cores, 8GB RAM, 32GB of disk) uses about 2GB of storage. The largest machine type comes with 128GB of disk storage. You pay for the amount of storage that you use, shown in the [Codespaces overview](https://github.com/codespaces):

![Storage usage](cs-storage.png)

Storage costs are consumed for as long as your Codespace exists, even when paused. Unused Codespaces (paused, but not yet deleted) are auto-deleted [after 30 days](https://docs.github.com/en/codespaces/customizing-your-codespace/configuring-automatic-deletion-of-your-codespaces). So an empty Codespace you created will consume 2GB-months of your quota of 15GB-months - well within your quota. Choose a larger unit, and create a lot of data, and you may quickly run out of free storage. Use the largest machine type and download and generate, say, 100GB of data, and you would blow through the free quota in 5 days.  

ONe way to curb costs is to actively delete Codespaces you no longer need (after all, they can be recreated any time by clicking on that `+` button). Another is to configure the auto-delete to be shorter than 30 days. YMMV.

### Acknowledgments

There are a few key "plumbing" pieces that make everything work here. Thanks to:

- The [Rocker Project](https://rocker-project.org/) team, especially @eitsupi, for maintaining the [R DevContainer Features](https://rocker-project.org/images/devcontainer/features.html).
- @renkun-ken and the rest of the [VS Code R extension](https://code.visualstudio.com/docs/languages/r) team.
- @eddelbuettel ([r2u](https://eddelbuettel.github.io/r2u/)) and @Enchufa2 ([bspm](https://enchufa2.github.io/bspm/)) for providing the infra that enables fast and safe binary R package installation on Linux.