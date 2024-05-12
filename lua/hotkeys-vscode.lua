local vscode = require('vscode-neovim')

return {
    ViewFileTree = function() vscode.call("workbench.view.explorer") end,
    anotherCommand = function() vscode.call("just an example") end,
}
