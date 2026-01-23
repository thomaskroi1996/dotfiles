return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>dc', dap.continue, {})

    vim.keymap.set('n', '<F10>', dap.step_over, {})
    vim.keymap.set('n', '<F11>', dap.step_into, {})
    vim.keymap.set('n', '<F12>', dap.step_out, {})

    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        -- This path matches the one we just cleaned/reinstalled
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        args = { "--port", "${port}" },
      }
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb", -- Must match the adapter name above
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
  end,
}
-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     "rcarriga/nvim-dap-ui",
--     "nvim-neotest/nvim-nio",
--   },
--   config = function()
--     local dap = require("dap")
--     local dapui = require("dapui")
--
--     dapui.setup()
--
--     dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
--     dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
--     dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
--
--     vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
--     vim.keymap.set('n', '<Leader>dc', dap.continue, {})
--
--     vim.keymap.set('n', '<F10>', dap.step_over, {})
--     vim.keymap.set('n', '<F11>', dap.step_into, {})
--     vim.keymap.set('n', '<F12>', dap.step_out, {})
--
--     dap.adapters.gdb = {
--       type = "executable",
--       command = "gdb",
--       args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
--     }
--
--     local config = {
--       {
--         name = "Launch",
--         type = "gdb",
--         request = "launch",
--         program = function()
--           return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = "${workspaceFolder}",
--         stopAtBeginningOfMainSubprogram = false,
--       },
--       {
--         name = "Select and attach to process",
--         type = "gdb",
--         request = "attach",
--         program = function()
--           return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         pid = function()
--           local name = vim.fn.input('Executable name (filter): ')
--           return require("dap.utils").pick_process({ filter = name })
--         end,
--         cwd = '${workspaceFolder}'
--       },
--     }
--
--     dap.configurations.c = config
--     dap.configurations.cpp = config
--     dap.configurations.rust = config
--   end,
-- }
