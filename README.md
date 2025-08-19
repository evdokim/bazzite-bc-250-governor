# bazzite-bc-250-governor
`install-governor.sh` will install [oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) into Bazzite.

The governor will be built inside a [Distrobox](https://distrobox.it/) container, therefore no additional packages will installed in the Bazzite system.

The governor will be managed by a Systemd user service, and hence `install-governor.sh` can be executed without `sudo`.

Once installed the voltage and frequency ranges can be set in `~/.local/bin/oberon-config.yaml`.


## Troubleshooting
Check service status:

```
systemctl --user status oberon-governor.service
```

Check governor output:

```
cd ~/.local/bin
oberon-governor
```
