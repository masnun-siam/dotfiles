local dap = require("dap")

dap.adapters.dart = {
	type = "executable",
	command = "node",
	args = { "~/Tools/Dart-Code/out/dist/debug.js", "flutter" },
}
dap.configurations.dart = {
	{
		type = "dart",
		request = "launch",
		name = "Launch flutter",
		dartSdkPath = os.getenv("HOME") .. "/Tools/flutter/bin/cache/dart-sdk/",
		flutterSdkPath = os.getenv("HOME") .. "/Tools/flutter",
		program = "${workspaceFolder}/lib/main.dart",
		cwd = "${workspaceFolder}",
	},
}
