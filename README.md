# NixOS Config (personal)

Welcome — this is my personal NixOS configuration. It's a first attempt at using Nix and it probably contains a few rough edges, but it works for my setup. Use this as a reference, pick what you need, and avoid installing everything, it is very easy to get very bloated very quickly (I have too many pkgs).

---

## Quick notes & warnings

- This repo contains a lot of different configurations I've tried, so be selective when copying/enabling packages/modules — only enable what you actually want to use.
- Make sure your `home.stateVersion` / `system.stateVersion` match your system original's before switching configurations. Mismatched state versions may cause issues.
- Environment modules (in the repo) are useful, trust me — they show what each environment contains.

---

## Useful links

- [The BEST NixOS tutorial](https://youtube.com/playlist?list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG&si=51kT5IAxmpOvwZCC)
- Nixos Wiki [(official)](https://wiki.nixos.org/) [(unofficial)](https://nixos.wiki/)
- [Home Manager](https://home-manager.dev/)
- [Superfile](https://superfile.dev/)
- [Steam icons](https://www.steamgriddb.com/)

---

## Install helper (superfile)

Install the `spf` command with:

```sh
bash -c "$(curl -sLo- https://superfile.dev/install.sh)"
```

---

### Setting up basic file locations

If your anything like me, you can bearly remeber what you should call the basic directorys. So just run this command in /home/<uname>:

```sh
mkdir Downloads Documents Pictures Videos Music
```


---

## Enable nixpkgs unstable (optional)

If you want pkgs from `nixos-unstable` aka the `unstable` modules in the `nixos` and `.dotfiles` directories, run this:

```sh
nix-channel --add https://channels.nixos.org/nixos-unstable nixpkgs
```
```sh
nix-channel --update
sudo nixos-rebuild switch --upgrade
```

View configured channels:

```sh
nix-channel --list | grep nixos
```

You can run these with sudo if you want them system-wide. From my experience, it's safe.

---

## Steam / external drive notes

If you want store files on another internal drive wich is formatted to ext4, this commands help make i all just work:

```sh
sudo chown -R <uname>:users /mnt/<your-mount-point>
```

And if you want Steam to recognize your drive for games.

```sh
mkdir -p /mnt/<your-mount-point>/SteamLibrary/steamapps
```

Make sure `<your-mount-point>` and the drive UUID match in `drives.nix`, witch is also found in `nixos`

You can check UUIDs with this:

```sh
lsblk -f
```

---

## Small utils

- To make a script executable (an example from my config) run:

```sh
chmod +x ~/.config/Scripts/.fehbg
```

- If you want to use `flatpak` (recomended), add the `flathub` repo using this:

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

---

## Why there's a Waybar hypr config

I reused my Waybar config for `niri`, so thats why there's a `hypr` variant in Waybar — you can choose whichever one you want, just replace the files in the main `waybar` with the ones in `hypr` so then it works correctly in hyprland.

---

## Final thoughts

- This is all experimental and tailored to my hardware preferences (AMD).
- Feel free to open issues or a PR if you want to give suggestions, fixes, or even help adapting parts of this repo to your setup.
- And yes labwc is just openbox but in wayland, I still love them both equally but niri is where my Heart is truly at.

Thanks for reading. Here's a sandwich for your troubles 🥪
