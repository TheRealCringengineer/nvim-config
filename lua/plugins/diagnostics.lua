return {
  "kaputi/e-kaput",
  config = function()
    require("e-kaput").setup({
      -- defaults
      enabled = true, -- true | false,  Enable EKaput.
      transparency = 25, -- 0 - 100 , transparecy percentage.
      borders = true, -- true | false, Borders.
      error_sign = "", -- Error sign.
      warning_sign = "", -- Warning sign.
      information_sign = "", -- Information sign.
      hint_sign = "", -- Hint sign.
    })
  end,
}
