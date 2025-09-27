colors = {};

local function get_hyprland_color(color_name)
  local hyprland_conf = os.getenv("HOME") .. "/.config/hypr/colors.conf"
  local file = io.open(hyprland_conf, "r")
  if not file then
    return nil
  end

  for line in file:lines() do
    if line:match("^$" .. color_name .. ".*") then
      local hex_color = line:match("rgba%((%x+)ff%)")
      if hex_color and #hex_color == 6 then
        return "#" .. hex_color:upper()
      end
    end
  end

  file:close()
  return nil
end

colors["primary"] = get_hyprland_color("primary")
colors["background"] = get_hyprland_color("background")

return colors;

