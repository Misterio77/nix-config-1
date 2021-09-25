{ pkgs, ... }:

{
  # Require /data/home to be mounted at boot
  fileSystems."/data/home".neededForBoot = true;

  # User info
  users.users.rakki = {
    isNormalUser = true;
    extraGroups = [ "audio" "wheel" ];
    shell = pkgs.fish;
    # Grab hashed password from /data
    passwordFile = "/data/home/rakki/.password";
  };

}
