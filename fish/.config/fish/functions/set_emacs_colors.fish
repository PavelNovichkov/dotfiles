#!/usr/bin/env fish

function set_emacs_colors -d 'Set color scheme for Emacs.'
   set -gx fish_color_normal normal
   set -gx fish_color_command blue
   set -gx fish_color_quote blue
   set -gx fish_color_redirection normal
   set -gx fish_color_end yellow
   set -gx fish_color_error red
   set -gx fish_color_param cyan
   set -gx fish_color_comment red
   set -gx fish_color_match cyan
   set -gx fish_color_operator cyan
   set -gx fish_color_escape cyan
   set -gx fish_color_cwd green
   set -gx fish_color_autosuggestion cyan
   set -gx fish_color_user green
   set -gx fish_color_host normal
   set -gx fish_color_history_current cyan
   set -gx fish_color_selection blue
   set -gx fish_color_status magenta
   set -gx fish_pager_color_prefix cyan
   set -gx fish_pager_color_completion magenta
   set -gx fish_pager_color_description normal
   set -gx fish_pager_color_progress green
end
