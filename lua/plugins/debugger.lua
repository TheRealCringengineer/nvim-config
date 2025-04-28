return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set("n", "<F9>", function()
        require("dap").continue()
      end)
      vim.keymap.set("n", "<F8>", function()
        require("dap").step_over()
      end)
      vim.keymap.set("n", "<F7>", function()
        require("dap").step_into()
      end)
      vim.keymap.set("n", "<F5>", function()
        require("dap").toggle_breakpoint()
      end)
      vim.keymap.set("n", "<F4>", function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end)
      vim.keymap.set("n", "<Leader>dr", function()
        require("dap").repl.open()
      end, { desc = "DAP Repl Open" })
      vim.keymap.set("n", "<Leader>dl", function()
        require("dap").run_last()
      end, { desc = "DAP Run Last" })
      vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
        require("dap.ui.widgets").hover()
      end, { desc = "DAP Hover Info" })
      vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
        require("dap.ui.widgets").preview()
      end, { desc = "DAP Preview" })
      vim.keymap.set("n", "<Leader>df", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end, { desc = "DAP Frames" })
      vim.keymap.set("n", "<Leader>ds", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
      end, { desc = "DAP Scope" })

      local dap = require("dap")

      -- dap.adapters.lldb = {
      --   type = 'executable',
      --   command = 'lldb-dap', -- adjust as needed, must be absolute path
      --   name = 'lldb'
      -- }
      dap.adapters.codelldb = {
        type = "server",
        port = "33565",
        executable = {
          -- CHANGE THIS to your path! For some reason on windows path is not working correctly
          -- command = "codelldb",
          command = "codelldb",
          args = { "--port", "33565" },

          -- On windows you may have to uncomment this:
          detached = false,
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp

      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })
      -- To Debug
      -- dap.set_log_level("TRACE")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.keymap.set("n", "<F2>", function()
        dapui.toggle()
      end, { desc = "Toggle dapui" })
    end,
  },
}
