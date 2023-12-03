<p align="center"><img src="https://i.imgur.com/kyxhcwg.png" width="128" height="128"></p>

# NPMprune

`npmprune.sh` is an lightweight script designed to clean up your `node_modules` directory by removing unnecessary files like Markdown, doc and config files.

It helps in reducing the overall size of `node_modules`, optimizing storage space, and speeding up deployments, especially in containerized environments.

By detecting `NODE_ENV`, it can perform a more aggressive cleanup, tailored for production builds such as in Docker containers.

1. [Install](#install)
2. [Usage (Unix/Linux)](#usage-linux)
3. [Usage (Windows)](#usage-windows)
4. [Integration](#integration)
   - [In deployment scripts](#in-deployment-scripts)
   - [In a Dockerfile](#in-a-dockerfile)
5. [Compatibility](#compatibility)

## Install

```sh
wget -O /usr/local/bin/npmprune https://raw.githubusercontent.com/xthezealot/npmprune/master/npmprune.sh && chmod +x /usr/local/bin/npmprune
```

## Usage (Unix/Linux)

1. Ensure you have execution permissions: `chmod +x npmprune.sh`
2. Run the script in your project directory: `./npmprune.sh`

## Usage (Windows)

1. Open PowerShell.
2. Navigate to your project directory.
3. Run the script: `.\npmprunewin.ps1`

The PowerShell version, `npmprunewin.ps1`, performs similar functions as the shell script but is tailored for Windows environments. It leverages PowerShell commands to efficiently clean the `node_modules` directory, taking into consideration the Windows filesystem and permissions.

### Production mode

If the `NODE_ENV` environment variable is set to `production`, NPMprune performs a more extensive cleanup by also removing type definitions.

## Integration

### In deployment scripts

```sh
wget -qO- https://raw.githubusercontent.com/xthezealot/npmprune/master/npmprune.sh | sh
```

### In a Dockerfile

```dockerfile
RUN wget -qO- https://raw.githubusercontent.com/xthezealot/npmprune/master/npmprune.sh | sh
```

# Compatibility

NPMprune is compatible with Windows, Linux and macOS environments, even with the most basic Alpine Linux setup.
