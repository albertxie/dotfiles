function open_github()
  if not is_git_repo() then print("Not a git repo") return end
  local github_url = get_github_url()
  os.execute('open ' .. github_url)
end


function sout(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()

  if raw then return s end

  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

function get_github_url()
  if not is_git_repo() then return end

  local remote = get_remote_url()
  local branch = get_current_branch()

  -- current path is everything after repo name
  local prefix_query = '.*'..get_repo_name()
  local repo_path = string.gsub(vim.api.nvim_buf_get_name(0), prefix_query, '')

  -- get cursor position
  local line, _ = unpack(vim.api.nvim_win_get_cursor(0))

  local github_location = remote .. '/blob/' .. branch .. repo_path .. "#L" .. line
  return github_location
end

function get_current_branch()
  if not is_git_repo() then return end
  local cmd = 'git rev-parse --abbrev-ref HEAD'
  return sout(cmd)
end

function get_repo_name()
  if not is_git_repo() then return end
  local cmd = 'basename `git rev-parse --show-toplevel`'
  return sout(cmd)
end

function get_remote_url()
  if not is_git_repo() then return end
  local cmd = "git config --get remote.origin.url"
  url = string.gsub(sout(cmd), '.git*$', '')
  return url
end

function is_git_repo()
  local cmd = "git rev-parse --is-inside-work-tree 2> /dev/null"
  local git_status = os.execute(cmd)
  return git_status == 0
end
