# solder-blue

Personal Fedora COSMIC Atomic image. `mise` is layered; everything else lives in [justyn/dotfiles](https://github.com/justyn/dotfiles) and [justyn/nvim-config](https://github.com/justyn/nvim-config), cloned automatically by chezmoi on first login.

## Rebase

```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/justyn/solder-blue:latest
systemctl reboot
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/justyn/solder-blue:latest
systemctl reboot
```

The first rebase installs cosign keys; the second pins to the signed image.

## Update

```sh
chezmoi update   # pull dotfiles, re-apply, re-run mise install if config changed
mise upgrade     # bump tool versions
```

## Verify

```sh
cosign verify --key cosign.pub ghcr.io/justyn/solder-blue
```
