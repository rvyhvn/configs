local utils = {}

local std_in = false

vim.api.nvim_create_autocmd({ "StdinReadPre" }, {
  callback = function()
    std_in = true
  end
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    if #vim.v.argv == 1 and vim.fn.isdirectory(vim.v.argv[1]) == 1 and not std_in then
      require("nvim-tree").find_file(require("nvim-tree.config").get_default_opts(vim.v.argv[1]))
      pcall(require("nvim-tree").focus)
    end
  end
})


---Sets up an autocmd to create a custom mapping for the passed filetype.
---
---This function automatically creates a custom mapping defined by the provided
---`keymap` when the specified `filetype` is detected. When pressed the mapping,
---it run the passed external command (`ext_cmd`) over the current buffer.
---@param filetype string Filetype extension
---@param keymap string Mapping that is going to trigger the command
---@param ext_cmd string Command to run the file. Should begin with "`!`" and end with "` %`".
function utils.set_autocmd_runner(filetype, keymap, ext_cmd)
  local cmd = "noremap " .. keymap .. " <Cmd>" .. ext_cmd .. "<CR>"
  vim.api.nvim_create_autocmd({ "FileType" }, {
    command = cmd,
    group = vim.api.nvim_create_augroup("UserAutocmd_" .. filetype, {}),
    pattern = filetype,
  })
end

return utils
