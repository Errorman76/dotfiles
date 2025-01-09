return {
	"mfussenegger/nvim-dap",
	keys = {
    -- stylua: ignore start
    { "<F5>", function() require("dap").continue() end, desc = "continue" },
    { "<F17>", function() require("dap").terminate() end, desc = "terminate" },
    { "<F29>", function() require("dap").restart_frame() end, desc = "restart" },
    { "<F6>", function() require("dap").pause() end, desc = "pause" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
    { "<F21>", function() require("dap").set_breakpoint(vim.fn.input('breakpoint condition: ')) end, desc = "breakpoint condition" },
    { "<F10>", function() require("dap").step_over() end, desc = "step over" },
    { "<F11>", function() require("dap").step_into() end, desc = "step into" },
    { "<F23>", function() require("dap").step_out() end, desc = "step out" },

    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "toggle repl" },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "widgets" },
		-- stylua: ignore end
	},
	config = function()
		local dap = require("dap")

		-- setup dap-adapter per languages
		local adapters = {
			"js-debug-adapter",
		}

		for _, adapter in ipairs(adapters) do
			local ok, config = pcall(require, "plugins.dap.configs." .. adapter)
			if ok then
				config.setup_dap(dap)
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
