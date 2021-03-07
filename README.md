# Ungoogled Chromium Builder

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Easily builds the `unportable` branch of `https://github.com/ungoogled-software/ungoogled-chromium-debian/` on a Docker container. The output will be found in the repository directory at `output/`.

Tested distributions:
- Ubuntu 20.04 (Focal)
- Debian Buster

> *NOTE*: The scripts don't work on Ubuntu 18.04 due to a version mismatch of the `libc6`. Either upgrade to the latest LTS release, or patch the `debian/control` file to install an earlier version of `libc6` for the Ungoogled Chromium build.

## Changing to other Distros

You would need to change to other Ubuntu versions depending on your target platform, because libraries used to build Ungoogled Chromium varies from platform to platform. The easiest way is to check `build.sh`, where there are two environment variables that is used throughout the build script, called `IMAGE_VERSION` and `GIT_TAG`.

`IMAGE_DISTRO` is the distro. Currently only debian-based distros are theoretically supported.

`IMAGE_VERSION` is the Docker image tag for the distro to use when building Chromium. This should match your target release codename, which can be found with `lsb_release -c`. All image tags can be found [here](https://hub.docker.com/_/ubuntu/?tab=tags).


Tested values:
- Ubuntu 20.04 (Focal)
    - `IMAGE_DISTRO=ubuntu`
    - `IMAGE_TAG=focal`
- Debian (Buster)
    - `IMAGE_DISTRO=debian`
    - `IMAGE_TAG=buster`

# License

Unlicensed. Do whatever you want with it.
