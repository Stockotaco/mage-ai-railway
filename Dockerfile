# Build argument for Mage AI version
# Default to a specific version, but can be overridden via build args
ARG MAGE_AI_VERSION=0.9.88

# Use the official Mage AI image with the specified version
FROM mageai/mageai:${MAGE_AI_VERSION}

# Fix numpy/scipy compatibility issue
# This resolves the "All ufuncs must have type numpy.ufunc" error
# Uninstall scipy and numpy, then reinstall compatible versions
# This ensures scipy gets a wheel compatible with the numpy version
RUN pip uninstall -y scipy numpy && \
    pip install --no-cache-dir numpy==1.26.4 && \
    pip install --no-cache-dir scipy==1.11.4

# Expose the default Mage AI port
EXPOSE 6789

# The base image already has the entrypoint configured
# No need to override unless you want custom behavior
