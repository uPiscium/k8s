{ ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      # ./audio.nix
      # ./bluetooth.nix
      ./i18n.nix
      ./keymap.nix
    ];
}
