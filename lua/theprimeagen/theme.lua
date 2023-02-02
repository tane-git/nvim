function Sync_OS_Theme()
    print("Syncing with OS...")

  -- Retrieve the OS theme
  local file = io.popen("powershell.exe -Command \"Get-ItemProperty -Path 'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize' | Select-Object -ExpandProperty AppsUseLightTheme\"")

  local output = file:read("*all")

  file:close()

  -- Trim the leading and trailing whitespaces
  output = output:gsub("^%s*(.-)%s*$", "%1")
  --local output = "1"

  if output == "1" then
    vim.api.nvim_set_option("background", "light")
  else
    vim.api.nvim_set_option("background", "dark")
  end
end

Sync_OS_Theme()
