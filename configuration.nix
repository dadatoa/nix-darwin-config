{ pkgs
, inputs
, ...
}:
{
  imports =
  [
    ./settings.nix
    ./usefull_tools.nix
  ];

  # used for backwards compatibility
  system.stateVersion = 5;

  system.primaryUser = "dadatoa";

  # fingerprint for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # services.tailscale.enable = true;
  # intall with tailscale standalone version

  environment.systemPackages = with pkgs; [
    coreutils
    cosign
    devin-cli
    docker
    ext4fuse ## did not find in brew
    fd
    flyctl
    forgejo-cli
    fzf
    gh
    # ghostty # broke - install with homebrew
    glow
    lazygit
    mosh
    opencode
    opentofu
    rclone
    ripgrep
    rsync
    tldr
    tree-sitter
    wishlist
    ### LSP
    alejandra ## nix formatter
    lua-language-server   
    nixd ## lsp nix
    tofu-ls
    yaml-language-server
    ###
    ### tree-sitter
    # tree-sitter # The CLI tool
    # tree-sitter-grammars.tree-sitter-astro # Standalone Astro grammar
    # tree-sitter-grammars.tree-sitter-markdown
  ];
}
