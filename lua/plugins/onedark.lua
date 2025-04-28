return {
  "navarasu/onedark.nvim",
  name = "onedark",
  priority = 1000,
  config = function()
    -- For some reason opts = {{style = "darker"}} doesn't work
    require("onedark").setup({ style = "darker" })
    require("onedark").load()
  end,
}
