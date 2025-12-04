{ pkgs, ... }:
{
  # Font Configuration
  fonts = {
    packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
    jetbrains-mono

    # Japanese Fonts
    ipafont
    kochi-substitute

    # Symbols
    nerd-fonts.symbols-only
  ];

  fontconfig = {
      defaultFonts = {
        monospace = [ "Noto Sans Mono" "FiraCode Nerd Font" ];
        emoji     = [ "Noto Color Emoji" ];
      };
    };
  };
}