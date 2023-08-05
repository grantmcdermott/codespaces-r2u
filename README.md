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


### Acknowledgments

There are a few key "plumbing" pieces that make everything work here. Thanks to:

- The [Rocker Project](https://rocker-project.org/) team, especially @eitsupi, for maintaining the [R DevContainer Features](https://rocker-project.org/images/devcontainer/features.html).
- @renkun-ken and the rest of the [VS Code R extension](https://code.visualstudio.com/docs/languages/r) team.
- @eddelbuettel ([r2u](https://eddelbuettel.github.io/r2u/)) and @Enchufa2 ([bspm](https://enchufa2.github.io/bspm/)) for providing the infra that enables fast and safe binary R package installation on Linux.