{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        shell = [ "${pkgs.fish}/bin/fish" "-c" ];
        bufferline = "multiple";
        idle-timeout = 200;
        color-modes = true;
        cursor-shape.insert = "underline";
        statusline = {
          left = [ "mode" "spinner" ];
          center = [ "file-name" "diagnostics" ];
          right = [ "selections" "position" "file-encoding" "file-type" ];
        };
        lsp.display-signature-help-docs = false;
      };
      keys.normal = {
        "X" = "extend_line_above";
        "A-w" = ":buffer-close";
        "A-l" = ":buffer-next";
        "A-h" = ":buffer-previous";
      };
      theme = "sonokai-atlantis";
    };
    languages = [
      {
        name = "rust";
      }
      {
        name = "python";
        roots = [ "pyproject.toml" ];
        language-server = { command = "pyright-langserver"; args = [ "--stdio" ]; };
        config = { }; # <- this is the important line;
        formatter = { command = "black"; args = [ "--quiet" "-" ]; };
        auto-format = true;
      }
      {
        name = "nix";
        auto-format = true;
        formatter = { command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt"; args = [ ]; };

      }
    ];
    themes.sonokai-atlantis =
      let
        black = "#181a1c";
        bg0 = "#2a2f38";
        bg1 = "#333846";
        bg2 = "#373c4b";
        bg3 = "#3d4455";
        bg4 = "#424b5b";
        bg_red = "#ff6d7e";
        diff_red = "#55393d";
        bg_green = "#a5e179";
        diff_green = "#394634";
        bg_blue = "#7ad5f1";
        diff_blue = "#354157";
        diff_yellow = "#4e432f";
        fg = "#e1e3e4";
        red = "#ff6578";
        orange = "#f69c5e";
        yellow = "#eacb64";
        green = "#9dd274";
        cyan = "#8cd1bd"; # added for compatibility with `edge` scheme
        blue = "#72cce8";
        purple = "#ba9cf3";
        grey = "#828a9a";
        grey_dim = "#5a6477";
      in
      {
        # https://github.com/CptPotato/helix-themes
        "type" = blue;
        "constant" = purple;
        "constant.numeric" = purple;
        "constant.character.escape" = orange;
        "string" = yellow;
        "string.regexp" = orange;
        "comment" = grey;
        "variable" = fg;
        "variable.builtin" = orange;
        "variable.parameter" = fg;
        "variable.other.member" = fg;
        "label" = orange;
        "punctuation" = grey;
        "punctuation.delimiter" = grey;
        "punctuation.bracket" = fg;
        "keyword" = red;
        "keyword.directive" = purple;
        "operator" = orange;
        "function" = green;
        "function.builtin" = blue;
        "function.macro" = purple;
        "tag" = yellow;
        "namespace" = blue;
        "attribute" = purple;
        "constructor" = blue;
        "module" = blue;
        "special" = orange;

        "markup.heading.marker" = grey;
        "markup.heading.1" = { fg = red; modifiers = [ "bold" ]; };
        "markup.heading.2" = { fg = orange; modifiers = [ "bold" ]; };
        "markup.heading.3" = { fg = yellow; modifiers = [ "bold" ]; };
        "markup.heading.4" = { fg = green; modifiers = [ "bold" ]; };
        "markup.heading.5" = { fg = blue; modifiers = [ "bold" ]; };
        "markup.heading.6" = { fg = fg; modifiers = [ "bold" ]; };
        "markup.list" = red;
        "markup.bold" = { modifiers = [ "bold" ]; };
        "markup.italic" = { modifiers = [ "italic" ]; };
        "markup.link.url" = { fg = blue; modifiers = [ "underlined" ]; };
        "markup.link.text" = purple;
        "markup.quote" = grey;
        "markup.raw" = green;

        "diff.plus" = green;
        "diff.delta" = orange;
        "diff.minus" = red;

        "ui.background" = { bg = bg0; };
        "ui.background.separator" = grey;
        "ui.cursor" = { fg = bg0; bg = fg; };
        "ui.cursor.match" = { fg = orange; bg = diff_yellow; };
        "ui.cursor.insert" = { fg = black; bg = grey; };
        "ui.cursor.select" = { fg = bg0; bg = blue; };
        "ui.cursorline.primary" = { bg = bg1; };
        "ui.cursorline.secondary" = { bg = bg1; };
        "ui.selection" = { bg = bg4; };
        "ui.linenr" = grey;
        "ui.linenr.selected" = fg;
        "ui.statusline" = { fg = fg; bg = bg3; };
        "ui.statusline.inactive" = { fg = grey; bg = bg1; };
        "ui.statusline.normal" = { fg = bg0; bg = fg; modifiers = [ "bold" ]; };
        "ui.statusline.insert" = { fg = bg0; bg = yellow; modifiers = [ "bold" ]; };
        "ui.statusline.select" = { fg = bg0; bg = blue; modifiers = [ "bold" ]; };
        "ui.bufferline" = { fg = grey; bg = bg1; };
        "ui.bufferline.active" = { fg = fg; bg = bg4; modifiers = [ "bold" ]; };
        "ui.popup" = { fg = grey; bg = bg2; };
        "ui.window" = { fg = grey; bg = bg0; };
        "ui.help" = { fg = fg; bg = bg2; };
        "ui.text" = fg;
        "ui.text.focus" = green;
        "ui.menu" = { fg = fg; bg = bg3; };
        "ui.menu.selected" = { fg = bg0; bg = green; };
        "ui.virtual.whitespace" = { fg = bg4; };
        "ui.virtual.indent-guide" = { fg = bg4; };
        "ui.virtual.ruler" = { bg = bg2; };

        "hint" = blue;
        "info" = green;
        "warning" = yellow;
        "error" = red;
        "diagnostic" = { underline = { style = "line"; }; };
        "diagnostic.hint" = { underline = { color = blue; style = "dotted"; }; };
        "diagnostic.info" = { underline = { color = green; style = "dotted"; }; };
        "diagnostic.warning" = { underline = { color = yellow; style = "curl"; }; };
        "diagnostic.error" = { underline = { color = "red"; style = "curl"; }; };
      };
  };
}
