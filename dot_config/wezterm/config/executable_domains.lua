local platform = require('utils.platform')

local options = {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}

if platform.is_win then
   options.ssh_domains = {
      -- {
      --    name = 'ssh:wsl',
      --    remote_address = 'localhost',
      --    multiplexing = 'None',
      --    default_prog = { 'elvish' },
      --    assume_shell = 'Posix',
      -- },
   }

   options.wsl_domains = {
      {
         name = 'wsl:archlinux',
         distribution = 'archlinux',
         -- username = 'nsg',
         -- default_cwd = '/home/kevin',
         -- default_prog = { 'fish', '-l' },
      },
   }
end

return options
