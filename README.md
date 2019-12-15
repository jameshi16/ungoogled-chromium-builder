# Chromium Builder

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

Builds `https://github.com/ungoogled-software/ungoogled-chromium-debian/` on a Docker Ubuntu container. This can be useful if you have a private server at home, and don't want to wait 99 years for it to build on your main machine.

## Changing to other Ubuntu versions

You would need to change to other Ubuntu versions depending on your target platform, because libraries used to build Ungoogled Chromium varies from platform to platform. The easiest way is to check `build.sh`, where there are two environment variables that is used throughout the build script, called `IMAGE_VERSION` and `GIT_TAG`.

`IMAGE_VERSION` is the Docker Ubuntu image tag to use when building Chromium. This should match your target release codename, which can be found with `lsb_release -c`. All image tags can be found [here](https://hub.docker.com/_/ubuntu/?tab=tags).

`GIT_TAG` is the Git **branch** (yes, despite it's name) used by the `ungoogled-chromium-debian` repository. The list of branches can be found [here](https://github.com/ungoogled-software/ungoogled-chromium-debian/branches).
