# Load Ghostty's shell integration inside tmux
if [[ -o interactive && -n "$TMUX" && -n "$GHOSTTY_RESOURCES_DIR" ]]; then
  source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi
