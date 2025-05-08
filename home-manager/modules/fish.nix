{ config, lib, ... }:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      # Custom greeting
      set KERNEL (uname -r)
      set -g fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
        (set_color normal)"fish \$FISH_VERSION" \
        (set_color normal)"| \$KERNEL"
    '';

    interactiveShellInit = ''
      # Vi mode key bindings
      function fish_user_key_bindings
        fish_vi_key_bindings
        bind -M insert -m default kj backward-char force-repaint
      end

      # Right prompt
      function fish_right_prompt
        echo (set_color e5e5e5)"$USER"@(hostname)
      end

      # Mode indicator
      function fish_mode_prompt
        switch "$fish_bind_mode"
          case "default"
            echo -n (set_color f43f5e)"𝓷"
          case "insert"
            echo -n (set_color 84cc16)"𝒾"
          case "visual"
            echo -n (set_color 8b5cf6)"𝓿"
          case "*"
            echo -n "?"
        end
        echo -n " "
      end

      # Custom prompt
      function fish_prompt
        set_color --bold 4086ef
        set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 3b82f6))
        echo -n $transformed_pwd

        # Git branch
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1
          echo -n " "(set_color --bold 4338ca)"("(set_color f0abfc)(git branch --show-current)(set_color --bold 4338ca)")"
        end

        echo -n " "(set_color --bold 14b8a6)"→ "
        set_color normal
      end
    '';

    shellAliases = {
      ls = "exa --icons";
      treelist = "tree -a -I '.git'";
      fetch = "fastfetch --localip-show-ipv4 false";
    };

    shellAbbrs = {
      # Add any abbreviations here if needed
    };
  };

  # Environment variables
  home.sessionVariables = {
    EDITOR = "code";
    WLR_NO_HARDWARE_CURSORS = 1;
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    FZF_DEFAULT_OPTS = lib.concatStringsSep " " [
      "--bind='ctrl-j:down,ctrl-k:up,ctrl-t:toggle-all,ctrl-v:toggle-preview,ctrl-space:toggle-preview'"
      "--color=fg:#ffffff,hl:#00ff00,fg+:#a5b4fc,bg+:#737373,hl+:#ffff00,info:#14b8a6,spinner:#00ffff,pointer:#f59e0b"
    ];
  };

  # Color scheme (TokyoNight Storm)
  programs.fish.shellInit = lib.mkAfter ''
    set -l foreground c0caf5
    set -l selection 6366f1
    set -l comment 737373
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection
  '';

  # Path additions
  home.sessionPath = [
    "/usr/local/bin"
    "/opt/bin"
    "$HOME/.bun/bin"
    "$HOME/.local/share/pnpm"
  ];

  # Bun initialization
  programs.bash.initExtra = ''
    if [ -n "$BUN_INSTALL" ]; then
      export BUN_INSTALL="$HOME/.bun"
      export PATH="$BUN_INSTALL/bin:$PATH"
    fi
  '';

  # PNPM initialization
  programs.fish.interactiveShellInit = lib.mkAfter ''
    set -gx PNPM_HOME "$HOME/.local/share/pnpm"
    if not contains -- "$PNPM_HOME" $PATH
      set -gx PATH "$PNPM_HOME" $PATH
    end
  '';
}