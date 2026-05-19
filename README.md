# solder-blue

Personal Fedora COSMIC Atomic image, built with BlueBuild.

## Rebase

```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/justyn/solder-blue:latest
systemctl reboot
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/justyn/solder-blue:latest
systemctl reboot
```

The first rebase installs cosign keys; the second pins to the signed image.

## Verify

```sh
cosign verify --key cosign.pub ghcr.io/justyn/solder-blue
```
