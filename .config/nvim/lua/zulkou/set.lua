vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--[[
if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("wl-copy") == 0 then
        print("wl-clipboard not found, clipboard integration won't work")
    else
        vim.g.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = 'wl-copy --foreground --type text/plain',
                ["*"] = 'wl-copy --foreground --primary --type text/plain',
            },
            paste = {
                ["+"] = (function()
                    return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', {''}, 1) -- '1' keeps empty lines
                end),
                ["*"] = (function()
                    return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', {''}, 1)
                end),
            },
            cache_enabled = true
        }
    end
end
]]


-- vim.opt.clipboard="unnamedplus"

local function osc52_copy()
  local text = table.concat(vim.fn.getreg('"', 1, true), "\n")

  if text == "" then
    vim.notify("Nothing to copy", vim.log.levels.WARN)
    return
  end

  -- Base64 encode
  local b64 = vim.fn.system("printf %s " .. vim.fn.shellescape(text) .. " | base64 | tr -d '\n'")

  -- Build OSC52 sequence (tmux-safe)
  local osc
  if os.getenv("TMUX") then
    osc = string.format("\027Ptmux;\027\027]52;c;%s\007\027\\", b64)
  else
    osc = string.format("\027]52;c;%s\007", b64)
  end

  -- Write directly to terminal
  local f = io.open("/proc/self/fd/1", "w")
  if f then
    f:write(osc)
    f:close()
    vim.notify("Copied to clipboard (OSC52)", vim.log.levels.INFO)
  else
    vim.notify("Failed to open /dev/tty", vim.log.levels.ERROR)
  end
end

-- Register as a user command and keymap
vim.api.nvim_create_user_command("OscYank", osc52_copy, {})

vim.keymap.set({ "n", "v" }, "<leader>y", function()
  vim.cmd('normal! "+y')
  vim.cmd('OscYank')
end, { silent = true, desc = "Yank to system clipboard and OSC52" })

vim.keymap.set("n", "<leader>Y", function()
  vim.cmd('normal! "+Y')
  vim.cmd('OscYank')
end, { silent = true, desc = "Yank line to system clipboard and OSC52" })

