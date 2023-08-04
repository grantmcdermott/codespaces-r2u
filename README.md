# Minimal(ish) Codespace environment for R

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

**Update:** Please run `sudo apt update -qq` in the VS Code terminal _before_
executing any R code. This is a temporary, one-time requirement until we resolve
[#1](https://github.com/grantmcdermott/codespaces-r2u/issues/1).

![](vscodespace.png)

Don't forget to close your Codespace once you have finished using it. Click the blue
"Codespace" tab at the very bottom left of your VS Code editor and select "Close the
current codespace" in the resulting pop-up box.
