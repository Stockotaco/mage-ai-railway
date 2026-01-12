# Mage AI Railway Deployment

A customizable Docker deployment for Mage AI that allows you to specify which version to deploy on Railway.

## Features

- ✅ Version selection via build arguments
- ✅ Railway-ready configuration
- ✅ Easy to customize and deploy

## How to Deploy to Railway

### Option 1: Using Railway Dashboard (Recommended)

1. **Connect your repository to Railway:**
   - Go to [Railway](https://railway.app/)
   - Click "New Project" → "Deploy from GitHub repo"
   - Select this repository

2. **Set the Mage AI version:**
   - In your Railway project, go to the service settings
   - Navigate to "Variables" tab
   - Add a new variable:
     - **Name:** `MAGE_AI_VERSION`
     - **Value:** The version you want (e.g., `0.9.88`, `0.9.87`, etc.)
   - Railway will use this as a build argument

3. **Configure the port:**
   - Railway automatically handles port mapping
   - The service will be available on Railway's provided domain

### Option 2: Using Railway CLI

```bash
# Install Railway CLI if you haven't already
npm i -g @railway/cli

# Login to Railway
railway login

# Link to your project
railway link

# Set the version variable
railway variables set MAGE_AI_VERSION=0.9.88

# Deploy
railway up
```

### Option 3: Using railway.toml (Alternative)

If you prefer using a `railway.toml` file, you can create one with:

```toml
[build]
builder = "dockerfile"
dockerfilePath = "Dockerfile"

[build.buildArgs]
MAGE_AI_VERSION = "0.9.88"
```

## Finding Available Versions

To find available Mage AI versions, check:
- [Docker Hub - mageai/mageai tags](https://hub.docker.com/r/mageai/mageai/tags)
- [Mage AI GitHub Releases](https://github.com/mage-ai/mage-ai/releases)

## Default Version

The default version is set to `0.9.88` in the Dockerfile. You can change this by:
1. Modifying the `ARG MAGE_AI_VERSION=0.9.88` line in the Dockerfile
2. Or setting the `MAGE_AI_VERSION` environment variable in Railway

## Customization

### Changing the Default Version

Edit the Dockerfile and change the default version:

```dockerfile
ARG MAGE_AI_VERSION=0.9.88  # Change this to your preferred default
```

### Adding Environment Variables

You can add environment variables in Railway's dashboard under the "Variables" tab. Common Mage AI environment variables include:
- `MAGE_DATA_DIR` - Directory for Mage data
- `MAGE_SECRET_KEY` - Secret key for encryption
- Other Mage AI specific configurations

## Port Configuration

Mage AI runs on port `6789` by default. Railway will automatically map this to an external URL. No additional configuration needed.

## Troubleshooting

- **Build fails:** Make sure the version you specified exists on Docker Hub
- **Service won't start:** Check Railway logs for error messages
- **Can't access the UI:** Ensure the service is deployed and the URL is correct

## License

MIT
