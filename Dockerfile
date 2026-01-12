# Build argument for Mage AI version
# Default to a specific version, but can be overridden via build args
ARG MAGE_AI_VERSION=0.9.88

# Use the official Mage AI image with the specified version
FROM mageai/mageai:${MAGE_AI_VERSION}

# Fix numpy/scipy compatibility issue
# This resolves the "All ufuncs must have type numpy.ufunc" error
# Force reinstall compatible versions
RUN pip install --force-reinstall --no-cache-dir "numpy>=1.24.0,<2.0" "scipy>=1.10.0,<2.0"

# Expose the default Mage AI port
EXPOSE 6789

# The base image already has the entrypoint configured
# No need to override unless you want custom behavior
