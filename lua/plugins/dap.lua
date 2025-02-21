local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")
local widgets = require("dap.ui.widgets")

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local python_path = "python"
dap_python.setup(python_path)
dap_python.test_runner = "pytest"

dap.adapters.python = {
  type = "executable",
  command = python_path,
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch File",
    program = "${file}",
    console = "integratedTerminal",
    justMyCode = false,
    pythonPath = python_path,
  },
}

vim.keymap.set("n", "<Leader>dc", function() dap.continue() end, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end, { desc = "Open REPL" })
vim.keymap.set("n", "<Leader>dv", function() widgets.hover() end, { desc = "Show Variable" })
vim.keymap.set("n", "<Leader>de", function() dapui.eval() end, { desc = "Evaluate Expression" })
vim.keymap.set("n", "<Leader>ds", function() dap.terminate() end, { desc = "Stop Debugger" })
