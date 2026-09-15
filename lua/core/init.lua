-- Config entry point.
-- Order: SHARED parts load first, LANGUAGES load LAST
-- so language settings can override shared defaults.
require("core.pack")          -- 1. Register shared plugins
require("core.keymaps")       -- 2. Shared keymaps
require("core.options")       -- 3. Shared options
require("core.autocmds")      -- 4. Shared autocmds
require("core.langs")         -- 5. Load each language (scan lua/langs/*)
