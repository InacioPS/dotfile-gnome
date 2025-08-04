if status is-interactive
    # Commands to run in interactive sessions can go here
end


starship init fish | source

#alias
function cat --wraps=bat --description 'Alias cat que escolhe tema do bat baseado no tema GTK'
    set theme_name (gsettings get org.gnome.desktop.interface gtk-theme)

    if string match -iq "*dark*" $theme_name
        bat --theme=gruvbox-dark $argv
    else
        bat --theme=gruvbox-light $argv
    end
end

alias l="ls -la"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# Set up fzf key bindings
fzf --fish | source
export FZF_CTRL_T_OPTS="
--style full
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"


fish_add_path /home/inacio/.spicetify
