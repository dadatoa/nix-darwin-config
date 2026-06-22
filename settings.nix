{ config, lib, pkgs, inputs, ... }:
{
  nix = {
    optimise.automatic = true;

    settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

  };

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  # Pin the hostname so darwin-rebuild resolves the "dadabook" configuration
  # instead of an auto-suffixed name like "dadabook-3012".
  networking.hostName = "dadabook";
  networking.computerName = "dadabook";
  networking.localHostName = "dadabook";

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

}
