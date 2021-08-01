# docker-vscode-cpp

A VSCode remote capable container that contains gcc, clang, and conan package manager

## Component Versions

| Package | Version                                   |
| ------- | ----------------------------------------- |
| GCC     | gcc (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0 |
| Clang   | clang version 11.0.0-2~ubuntu20.04.1      |
| CMake   | cmake version 3.18.2                      |

## Example devcontainer file

Below is a sample .devcontainer file that you can use for your project. It includes an example on how to add your own conan remote.

```jsonc
// For format details, see https://aka.ms/devcontainer.json. For config options, see the README at:
// https://github.com/microsoft/vscode-dev-containers/tree/v0.187.0/containers/cpp
{
  "name": "C++",
  "image": "vscode-cpp",
  "runArgs": ["--cap-add=SYS_PTRACE", "--security-opt", "seccomp=unconfined"],
  // Set *default* container specific settings.json values on container create.
  "settings": {},
  // Add the IDs of extensions you want installed when the container is created.
  "extensions": [
    "ms-vscode.cpptools",
    "ms-vscode.cpptools-extension-pack",
    "ms-vsliveshare.vsliveshare",
    "cschlosser.doxdocgen"
  ],
  // Use 'forwardPorts' to make a list of ports inside the container available locally.
  // "forwardPorts": [],
  // Mount the conan directory
  "mounts": ["source=conan,target=/home/vscode/.conan"],
  // Use 'postCreateCommand' to run commands after the container is created.
  // Use False if you're using a remote with a valid https cert.
  // --insert without a parameter places it first in the list when searching for a package
  "postCreateCommand": "conan remote add <remote-name> https://<ip-address>/artifactory/api/conan/conan-local False --insert",
  // Comment out connect as root instead. More info: https://aka.ms/vscode-remote/containers/non-root.
  "remoteUser": "vscode"
}
```
