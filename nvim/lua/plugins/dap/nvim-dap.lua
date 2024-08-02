return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mxsdev/nvim-dap-vscode-js",
	},
	keys = {
    -- stylua: ignore start
    { "<F5>", function() require("dap").continue() end, desc = "Continue" },
    { "<F17>", function() require("dap").terminate() end, desc = "Terminate" },
    { "<F29>", function() require("dap").restart_frame() end, desc = "Restart" },
    { "<F6>", function() require("dap").pause() end, desc = "Pause" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<F21>", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
    { "<F23>", function() require("dap").step_out() end, desc = "Step Out" },

    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
		-- stylua: ignore end
	},
	config = function()
		local dap = require("dap")
		if not dap.adapters["pwa-node"] then
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						require("mason-registry").get_package("js-debug-adapter"):get_install_path()
							.. "/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}
		end

		if not dap.adapters.node then
			dap.adapters.node = function(cb, config)
				if config.type == "node" then
					config.type = "pwa-node"
				end

				local pwa_adapter = dap.adapters["pwa-node"]

				if type(pwa_adapter) == "function" then
					pwa_adapter(cb, config)
				else
					cb(pwa_adapter)
				end
			end
		end

		-- setup dap config by VsCode launch.json file
		local vscode = require("dap.ext.vscode")
		local json = require("plenary.json")
		vscode.json_decode = function(str)
			return vim.json.decode(json.json_strip_comments(str))
		end

		-- Extends dap.configurations with entries read from .vscode/launch.json
		if vim.fn.filereadable(".vscode/launch.json") then
			vscode.load_launchjs()
		end
	end,
}
