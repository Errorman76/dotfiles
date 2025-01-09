return {
	"mfussenegger/nvim-dap-python",
	dependencies = "mfussenegger/nvim-dap",
	ft = "python",
	config = function()
		local debugpy = require("mason-registry").get_package("debugpy")
		local path = debugpy:get_install_path() .. "/venv/bin/python"

		require("dap-python").setup(path)
	end,
}
