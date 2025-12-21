{config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
   # autocd = true;
    enableCompletion = true;
    
    setOptions = [
      "AUTO_CD"
    ];

    ohMyZsh = {
      enable = true;
      #theme = "agnoster";  # or "agnoster", "powerlevel10k/powerlevel10k"
      plugins = [
        "git"
        "sudo"
        "docker"
        "kubectl"
        "history"
      ];
    };

    promptInit = ''
      PS1='%F{white}%n@%m:%~%f '
    '';
    
    # Optional: Add custom aliases
    shellAliases = {
      upgrade-flake = "nix flake update --flake ./.dotfiles";
      rebuild-home = "home-manager switch --flake ./.dotfiles";
      rebuild = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade";
      config = "sudo vi /etc/nixos/configuration.nix";
      home = "vi ~/.dotfiles/home.nix";
      flake = "vi ~/.dotfiles/flake.nix";
      garbage = "nix-collect-garbage -d";
      trashy = "trash empty --all";
      c = "clear";
      watermark = "activate-linux";
    };
  };
  
  users.defaultUserShell = pkgs.zsh;
}
