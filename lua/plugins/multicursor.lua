return {
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_add_cursor_at_pos_no_mappings = 1

      vim.keymap.set("n", "<C-Down>", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor down" })
      vim.keymap.set("n", "<C-Up>", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor up" })
    end,
  }
}
