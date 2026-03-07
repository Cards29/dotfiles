return {
	"Root-lee/screensaver.nvim",
	config = function()
		require("screensaver").setup({
			-- ⏱️ Time in milliseconds before the screensaver starts
			idle_ms = 60 * 60 * 1000,

			-- 🚀 Automatically start screensaver after idle time (set to false for manual only)
			auto_start = true,

			-- 🛡️ Disable auto-start when Neovim loses focus (e.g. switching tmux windows)
			-- Requires `set -g focus-events on` in your tmux.conf
			disable_on_focus_lost = true,

			-- ⌨️ Key to exit the screensaver
			exit_key = "<Esc>",

			custom_commands = {
				-- Aquarium (requires asciiquarium installed)
				aquarium = "asciiquarium -t",

				-- Matrix-style digital rain (requires cmatrix installed)
				cmatrix = "cmatrix -s",

				-- Rainbow cat animation (requires nyancat installed)
				nyancat = "nyancat",

				-- Fire effect (requires aafire installed)
				-- Note: aafire exits after one run, so we use a loop
				aafire = "while true; do aafire; done",

				-- Steam locomotive (requires sl installed)
				-- Note: sl exits after one run, so we use a loop
				sl = "while true; do sl -aF; done",

				-- Custom figlet animation
				figlet = "watch -n 1 'echo Neovim | figlet | lolcat'",

				-- pipes.js !!
				pipesjs = "pipes.js",
			},

			-- 🎬 List of enabled animations (defaults to all available)
			animations = {
				"aquarium",
				"cmatrix",
				"sl",
				"figlet",
				"rain",
				"game_of_life",
				"move_left",
				"move_right",
				"scramble",
				"random_case",
				"bounce",
				"starfield",
				"pipesjs",
				"fire",
				"snow",
			},

			-- 👻 Window transparency (0-100)
			winblend = 0,
		})
	end,
}
