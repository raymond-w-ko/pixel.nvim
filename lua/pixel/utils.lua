--- Utility functions for the Pixel colorscheme
local M = {}

--- Helper function to set highlight groups with cterm attributes
--- This function builds a vim highlight command string and executes it
--- @param group string The highlight group name to set
--- @param opts table Table containing highlight options:
---   - ctermfg: string|number Terminal foreground color (0-255 or color name)
---   - ctermbg: string|number Terminal background color (0-255 or color name)
---   - cterm: string Terminal attributes (bold, italic, underline, etc.)
function M.hi(group, opts)
  -- Start building the highlight command string
  local cmd = "highlight " .. group

  -- Add terminal foreground color if specified
  if opts.ctermfg then
    cmd = cmd .. " ctermfg=" .. opts.ctermfg
  end

  -- Add terminal background color if specified
  if opts.ctermbg then
    cmd = cmd .. " ctermbg=" .. opts.ctermbg
  end

  -- Add terminal attributes (bold, italic, etc.) if specified
  -- Strip italic and reverse attributes
  if opts.cterm then
    local attrs = {}
    for attr in opts.cterm:gmatch("[^,]+") do
      attr = vim.trim(attr)
      if attr ~= "italic" and attr ~= "reverse" then
        table.insert(attrs, attr)
      end
    end
    local cterm = #attrs > 0 and table.concat(attrs, ",") or "NONE"
    cmd = cmd .. " cterm=" .. cterm
  end

  -- Execute the highlight command
  vim.cmd(cmd)
end

--- Clean up all explicitly set (non-linked) highlight groups:
--- strip italic/reverse from cterm, and clear all color attributes
function M.clear_defaults()
  for group, hl in pairs(vim.api.nvim_get_hl(0, {})) do
    if not hl.link then
      hl.fg = nil
      hl.bg = nil
      hl.ctermfg = nil
      hl.ctermbg = nil
      local cterm = hl.cterm or {}
      cterm.italic = nil
      cterm.reverse = nil
      hl.cterm = next(cterm) and cterm or nil
      hl.italic = nil
      hl.reverse = nil
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end

return M