local function IsLightTheme()
    local filePath = "C:/Users/t.wilson/.IsLightTheme.txt"
    local file = io.open(filePath, "r")

    if file == nil then
        return false
    end

    local contents = file:read("*all")
    contents = tonumber(contents)

    file:close()

    if contents == 1 then
        return true
    end

    return false
end

function Sync_OS_Theme()

    local output = IsLightTheme()

  if output then
    vim.api.nvim_set_option("background", "light")
  else
    vim.api.nvim_set_option("background", "dark")
  end
end

Sync_OS_Theme()
