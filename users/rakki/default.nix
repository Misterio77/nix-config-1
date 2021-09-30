{ pkgs, ... }:

{
  # Require /data to be mounted at boot
  fileSystems."/data".neededForBoot = true;

  # User info
  users.users.rakki = {
    isNormalUser = true;
    extraGroups = [ "audio" "wheel" ];
    shell = pkgs.fish;
    # Grab hashed password from /data
    passwordFile = "/data/home/rakki/.password";
  };

  # Allow swaylock
  security.pam.services.swaylock = { };

}
