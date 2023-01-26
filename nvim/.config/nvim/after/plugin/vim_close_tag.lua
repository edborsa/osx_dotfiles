-- Closetag Config
local closetag_region_dict = {}
closetag_region_dict["typescript.tsx"] = "jsxRegion,tsxRegion"
closetag_region_dict["javascript.jsx"] = "jsxRegion"

local user_emmet_settings_dict = {}
user_emmet_settings_dict["javascript.jsx"] = {extends = 'jsx'}

vim.g.closetag_regions = closetag_region_dict
vim.g.closetag_filenames = "*.html,*.jsx,*.tsx,*.js"
vim.g.vim_jsx_pretty_colorful_config = 1
--
-- Emmet Config
vim.g.user_emmet_mode = 'inv'
vim.g.user_emmet_settings = user_emmet_settings_dict

-- vim.g.user_emmet_leader_key = '<C-E>'
