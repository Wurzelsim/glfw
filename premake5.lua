project "GLFW"
	kind "staticLib"
	language "C"

	targetdir ("build/bin/" .. outdir .. "/%{prj.name}")
	objdir ("build/obj/" .. outdir .. "/%{prj.name}")

	files {
		"include/GLFW/**.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/window.c"
	}

	includedirs {
		"%{prj.name}/external/spdlog/include/"
	}

	filter { "system:windows" }
		staticruntime "on"
		systemversion "latest"

		files {
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines {
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}