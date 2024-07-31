show_public_ip() {
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module

  icon="$(  get_tmux_option "@catppuccin_public_ip_icon"  "󱚻"           )"
  color="$( get_tmux_option "@catppuccin_public_ip_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_public_ip_text"  "$PUBLIC_IP_ADDRESS" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
