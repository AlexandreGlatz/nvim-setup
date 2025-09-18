local M = {}

-- Icons (using Nerd Fonts)
local icons = {
    mode = {
        n = "  NORMAL", -- NORMAL
        i = "  INSERT", -- INSERT
        v = "  VISUAL", -- VISUAL
        V = "  V-LINE", -- V-LINE
        ["\22"] = "  V-BLOCK", -- V-BLOCK
        c = "  COMMAND", -- COMMAND
        t = "  TERMINAL", -- TERMINAL
    },
    git = " ", -- Git branch icon
    diagnostics = {
        error = " ", -- Error icon
        warn = " ",  -- Warning icon
    },
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return icons.mode[current_mode] or " " -- Default icon
end

local function filename()
  return vim.fn.expand("%:t")
end

local function filepath()
  return vim.fn.expand("%:p:h:t")
end

local function linecol()
  return string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))
end

local function git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\\n'")
  if branch ~= "" then
    return icons.git .. branch
  end
  return ""
end

local function diagnostics()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if errors > 0 then
    return icons.diagnostics.error .. errors
  elseif warnings > 0 then
    return icons.diagnostics.warn .. warnings
  end
  return ""
end

local function modified_flag()
  if vim.bo.modified then
    return " 󰽂 " --  = modified icon (Nerd Fonts)
  else
    return ""
  end
end

function M.statusline()
  return table.concat({
    "%#StatusLine#",
    mode(),
    " %#StatusLinePath#",
    filepath(),
    " %#StatusLineFile#",
    filename(),
    modified_flag(),
    "  ",
    git_branch(),
    " %#StatusLineEnd#",
    " %#StatusLineFill# %=",
    " %#StatusLineInfo#",
    " ",
    linecol(),
    " ",
    diagnostics(),
  })
end

return M 
