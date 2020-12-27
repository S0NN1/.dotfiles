
# Load nvm (if enabled for this OS, and if .nvm folder exists)
if [[ "$NVM_AUTO_INIT" == true ]] && [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
fi


precmd_nvm_info() {
    # Always reset the NODE_PROMPT variable before every command
    NODE_PROMPT=''

    # If no package.json or node_modules, don't display anything
    [[ -f package.json || -d node_modules ]] || return

    # Check node version to display
    # (( $+commands[nvm] )) => Checks if command "nvm" exists
    local node_version
    if (( $+commands[nvm] )); then
        node_version=$(nvm current 2>/dev/null)
        [[ $node_version == "system" || $node_version == "node" ]] && return
    elif (( $+commands[node] )); then
        node_version=$(node -v 2>/dev/null)
    else
        # If nvm and node not found, show an alert prompt
        NODE_PROMPT=" %F{202}$NODE_SYMBOL Node not found%f"
        return
    fi

    # Actual (success) prompt displayed
    NODE_PROMPT=" using %F{green}$NODE_SYMBOL ${node_version}%f"
}

precmd_functions+=( precmd_nvm_info )