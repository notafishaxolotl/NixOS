{config, pkgs, ... }:

{
  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  # Add user to libvirtd group
  users.users.acito.extraGroups = [
    #"libvirtd"
    "waydroid"
  ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    #spice spice-gtk
    #spice-protocol
    virtio-win
    #win-spice
    adwaita-icon-theme
    qemu_kvm
    dmidecode
    wineWowPackages.staging
    winetricks
    bottles
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        #ovmf.enable = true;
        #ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
    waydroid.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
