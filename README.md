# solder-blue

Personal Fedora COSMIC Atomic image. `mise` is layered; everything else lives in [justyn/dotfiles](https://github.com/justyn/dotfiles) and [justyn/nvim-config](https://github.com/justyn/nvim-config), cloned automatically by chezmoi on first login.

## Keyboard

Default layout is `jb` — UK Dvorak with Caps Lock as Backspace and a few key remaps (`files/scripts/install-jb-xkb.sh`). `gb` (UK QWERTY) is configured as a second input source so the COSMIC top-bar picker can switch between them.

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

## Printers

Brother HL-3070CW is pre-defined as a CUPS queue (`files/system/etc/cups/printers.conf` + a symlink under `files/system/etc/cups/ppd/`). The queue uses the cups-filters `pxlcolor` PPD (PCL XL via Ghostscript's `gstopxl`) — Brother's BR-Script3 PPD that auto-discovery picks otherwise hits `limitcheck` on this model's 21 MB free RAM and prints blank pages or PS error pages. The device URI is the mDNS form, so it works on any LAN where the printer broadcasts.

## Verify

```sh
cosign verify --key cosign.pub ghcr.io/justyn/solder-blue
```
