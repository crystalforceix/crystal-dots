-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
-- Packages on here: "https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack"

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nim" },

  -- import/override with your plugins folder
}
