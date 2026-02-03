{ pkgs, ... }:

{
  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [
    piper
    input-remapper
  ];

  services.input-remapper.enable = true;

  users.users.acito.extraGroups = [ "input" "uinput" ];
}
