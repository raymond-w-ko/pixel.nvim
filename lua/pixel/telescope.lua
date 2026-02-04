-- Telescope support for Pixel colorscheme
-- This module provides Telescope-related highlight groups

-- Import shared utility functions
local utils = require("pixel.utils")
local hi = utils.hi

local M = {}

function M.setup(colors)
  -- Telescope general
  hi("TelescopeSelection", { ctermfg = colors.white, ctermbg = colors.black })
  hi("TelescopeSelectionCaret", { ctermfg = colors.white })
  hi("TelescopeMultiSelection", { ctermfg = colors.white })
  hi("TelescopeNormal", { ctermfg = colors.white })
  hi("TelescopeBorder", { ctermfg = colors.br_black })
  hi("TelescopeMatching", { ctermfg = colors.br_green, cterm = "bold" })

  -- Telescope prompt
  hi("TelescopePromptNormal", { ctermfg = colors.white })
  hi("TelescopePromptBorder", { ctermfg = colors.br_black })
  hi("TelescopePromptTitle", { ctermfg = colors.blue, cterm = "bold" })
  hi("TelescopePromptPrefix", { ctermfg = colors.white })

  -- Telescope preview
  hi("TelescopePreviewNormal", { ctermfg = colors.white })
  hi("TelescopePreviewBorder", { ctermfg = colors.br_black })
  hi("TelescopePreviewTitle", { ctermfg = colors.br_blue, cterm = "bold" })
  hi("TelescopePreviewLine", { ctermbg = colors.black })
  hi("TelescopePreviewMatch", { ctermfg = colors.br_green })

  -- Telescope results
  hi("TelescopeResultsNormal", { ctermfg = colors.white })
  hi("TelescopeResultsBorder", { ctermfg = colors.br_black })
  hi("TelescopeResultsTitle", { ctermfg = colors.red, cterm = "bold" })

  -- Telescope file browser essentials
  hi("TelescopeResultsDirectory", { ctermfg = colors.br_blue, cterm = "bold" })

  -- Telescope git (if using git features)
  hi("TelescopeResultsGitStatus", { ctermfg = colors.yellow })
  hi("TelescopeResultsGitBranch", { ctermfg = colors.green })
end

return M
