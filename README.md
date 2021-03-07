# Ungoogled Chromium Builder

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Easily builds the `unportable` branch of `https://github.com/ungoogled-software/ungoogled-chromium-debian/` on a Docker container. The output will be found in the repository directory at `output/`.

Tested distributions:
- Ubuntu 20.04 (Focal)
- Debian Buster

> *NOTE*: The scripts don't work on Ubuntu 18.04 due to a version mismatch of the `libc6`. Either upgrade to the latest LTS release, or patch the `debian/control` file to install an earlier version of `libc6` for the Ungoogled Chromium build.

# License

Unlicensed. Do whatever you want with it.
