# defines user accounts and overriden user cookbook attributes
default.users = ['deploy']
default.user.ssh_keygen = false

default.openssh.server.use_privilege_separation = 'yes'
default.openssh.server.key_regeneration_interval = '3600'
default.openssh.server.server_key_bits = '768'
default.openssh.server.syslog_facility = 'AUTH'
default.openssh.server.log_level = 'INFO'
default.openssh.server.login_grace_time = '120'


default.openssh.server.permit_root_login = 'no'
default.openssh.server.strict_modes = 'yes'
default.openssh.server.r_s_a_authentication = 'yes'
default.openssh.server.pubkey_authentication = 'yes'
default.openssh.server.ignore_rhosts = 'yes'
default.openssh.server.rhosts_r_s_a_authentication = 'no'
default.openssh.server.hostbased_authentication = 'no'

default.openssh.server.password_authentication = 'no'
default.openssh.server.allow_groups = 'sudo'
default.openssh.server.use_p_a_m = 'no'
default.openssh.server.use_d_n_s = 'no'
default.openssh.server.print_motd = 'no'

# includes nodejs default attributes first to override them
include_attribute 'nodejs'

# defines node.js and npm version configuration
default.nodejs.version = '0.10.0'
default.nodejs.npm = '1.2.14'

# defines npm packages to install globally
default.gexample.application.npm_packages = {
  'grunt-cli' => '0.1.6',
  'bower'     => '0.8.5',
  'forever'   => '0.10.11'
}

default.nginx.init_style = "runit"
default.nginx.default_site_enabled = false

node.default["server_name"] = "ghost.dev"

