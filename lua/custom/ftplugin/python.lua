local M = {}

M.venv = {}

M.venv_selector = {
  auto_refresh = false,
  path = os.getenv "USERPROFILE" .. "/venv",
  dap_enable = true,
}

return M
