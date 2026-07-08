[outdated]

# Architecture of nix-config

## structure on fs

```text
~/nix-config
├── docs
│   └── architecture.md
├── flake.nix
├── home
│   ├── common-home.nix
│   ├── desktop
│   ├── programs
│   ├── services
├── lib
│   ├── default.nix
│   ├── devshell.nix
│   ├── mkHome.nix
│   └── mkNixos.nix
├── LICENSE
├── overlays
│   └── default.nix
├── packages
│   └── default.nix
├── profile
│   ├── default.nix
│   ├── email.nix
│   ├── fonts
│   └── theme
├── README.md
└── system
    ├── common-configuration.nix
    ├── hosts
    │   └── dp7530
    ├── programs
    ├── services
    └── virtualisation.nix
```

## function of each component

1. **./home**: This folder contains the configuration for the home system using home-manager.
   - **./desktop**: It contains desktop configurations; although tools like Niri, Hyprland, etc., are not complete desktops, they are configured to function as full desktops, but the main characters remain the tools themselves.
   - **./programs**: Declare tools and configure them, but only for tools located within `programs.*`, for example, programs.git. Although git.nix can be used, it will adhere to the git/default.nix standard for easier extensibility.
   - **./services**: Similar to ~/nix-config/home/programs but for services located in `services.*`
2. **./lib**: shared utility components
   - **./devshell.nix**: Used for the nix-config development environment.
   - **./mkHome.nix**: This utility function helps create config objects of `Home<desktopName>` for homeConfiguration.
   - **./mkNixos.nix**: Similar to mkHome but designed for nixos based on the host model.
3. **./profile**: It contains user configurations such as primary and secondary email addresses, name, background, default editor, etc.
4. **./system**: It contains system configurations; each configuration is based on hosts and is created by the mkNixos utility function into configuration objects named `<hostName>`. A host's configuration is based on `~/nix-config/system/common-configuration.nix ++ ~/nix-config/system/hosts/<host>/default.nix`.
   - **./virtualisation.nix**: Contains configurations to test the configuration in the virtual machine before applying it to the physical machine.
