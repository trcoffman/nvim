# Plugin supply chain safety

Neovim plugins are github repos by default.

In order to protect myself from supply chain attacks, I've forked all the neovim
plugins I use into my github account.

To upgrade plugins, the process is for you to go into all my forks and audit
upstream changes to look for suspicious or obfuscated code indicative of a
supply chain attack. If everything looks good, update my fork of the plugin to
match upstream. Then we can update plugins with latest to the latest.
