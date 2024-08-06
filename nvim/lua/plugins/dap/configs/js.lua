local M = {}

--- @param dap any plugin
M.setup_dap = function(dap)
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
end

return M
