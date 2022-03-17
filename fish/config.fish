set fish_greeting

# Theme
set -U fish_color_normal normal
set -U fish_color_command blue
set -U fish_color_quote white
set -U fish_color_redirection brred
set -U fish_color_end white
set -U fish_color_error red
set -U fish_color_param white
set -U fish_color_comment brblack
set -U fish_color_match --underline
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator green
set -U fish_color_escape brred
set -U fish_color_cwd green
set -U fish_color_cwd_root green
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion brblack
set -U fish_color_user green
set -U fish_color_host normal
set -U fish_color_cancel --reverse
set -U fish_pager_color_prefix normal --bold --underline
set -U fish_pager_color_progress green
set -U fish_pager_color_completion normal
set -U fish_pager_color_description yellow
set -U fish_pager_color_selected_background green

# Utils
set BAT_DEFAULT_OPTS '--plain --theme ansi-dark --color always'
set --export PAGER "bat $BAT_DEFAULT_OPTS"

abbr --add ls exa
abbr --add cat "bat $BAT_DEFAULT_OPTS"
abbr --add g git
abbr --add grep rg
abbr --add vi nvim

# FZF
set -U FZF_FIND_FILE_COMMAND "fd --hidden --follow --exclude .git . \$dir"

# Key bindings
bind \t accept-autosuggestion
bind --erase \ct
bind \et __fzf_find_file
bind --erase \cr
bind \er __fzf_reverse_isearch

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
