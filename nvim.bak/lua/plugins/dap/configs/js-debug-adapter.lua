local M = {}

--- @param dap any plugin
M.setup_dap = function(dap)
	local mason_registry = require("mason-registry")

	if mason_registry.is_installed("js-debug-adapter") then
		if not dap.adapters["pwa-node"] then
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						mason_registry.get_package("js-debug-adapter"):get_install_path()
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
	else
		print("[dap] js-debug-adapter is not installed")
	end
end

return M
