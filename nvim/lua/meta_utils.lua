-- [[
-- Meta Utils
--
-- Helper methods used to simplify syntax
-- ]]


function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- curry functions shorthand normal mapping
function nmap(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

-- curry functions shorthand insert mapping
function imap(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end
