{ config, pkgs, ... }:
{
  fileSystems."/mnt/DoubleDisk" = {
    device = "/dev/disk/by-uuid/b15b7d74-f1fc-410f-b5a1-1a4f36afd109";
    fsType = "ext4";
    options = [ 
      "nofail"
      "rw"
      "exec"
      "user_xattr"
      "acl"
    ];
  };
}
