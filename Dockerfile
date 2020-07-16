# Pre-build Arguments
ARG IMAGE_DISTRO
ARG IMAGE_VERSION
FROM ${IMAGE_DISTRO}:${IMAGE_VERSION}

# Build Arguments
ARG GIT_TAG

# We split these into multiple steps, because we can utilize intermediate containers:
# if we change one script, it won't need reget all depedencies again.

# Step 1: Common files
WORKDIR /tmp
COPY scripts/variables.sh scripts/variables.sh

# Step 2: Get prerequisites
COPY scripts/get_prerequisites.sh scripts/get_prerequisites.sh
RUN scripts/get_prerequisites.sh

# Step 3: Download & configure the sources
COPY scripts/download_sources.sh scripts/download_sources.sh
COPY scripts/0001-fix-unicode.patch scripts/0001-fix-unicode.patch
RUN "scripts/download_sources.sh" $GIT_TAG

# Step 4: Build sources
COPY scripts/build_sources.sh scripts/build_sources.sh
RUN scripts/build_sources.sh

# Step 5: Move builds to output folder
COPY scripts/move_output.sh scripts/move_output.sh
RUN scripts/move_output.sh

# Step 6: Entrypoint. The build.sh script should do the rest
ENTRYPOINT ["/bin/bash", "sleep", "infinity"]
