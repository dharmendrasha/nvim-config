-- local get_intelephense_license = function()
--     local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
--     local content = f:read("*a")
--     f:close()
--     return string.gsub(content, "%s+", "")
-- end


local function get_intelephense_license()
  local path = vim.fn.expand("~/intelephense/license.txt")
  local f = io.open(path, "r")
  if not f then
    vim.notify("Intelephense license not found at: " .. path, vim.log.levels.WARN)
    return nil
  end
  local content = f:read("*a")
  f:close()
  return content
end

return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    root_markers = { "composer.json", ".git" },
    init_options = {
        licenceKey = get_intelephense_license(),
    },
}
