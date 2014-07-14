class people::danmikita {
  #############################
  # Variables
  #############################
  $home_directory = '/Users/danmikita'

  #############################
  # OSX Settings
  #############################
  include osx::disable_app_quarantine
  include osx::finder::unhide_library
  include osx::global::disable_autocorrect
  include osx::global::enable_keyboard_control_access
  include osx::no_network_dsstores
  include osx::universal_access::ctrl_mod_zoom

  class { 'osx::global::key_repeat_delay':
    delay => 15
  }

  class { 'osx::global::key_repeat_rate':
    rate => 1
  }

  #############################
  # Git Settings
  #############################
  git::config::global { 'user.name': value => 'Dan Mikita' }
  git::config::global { 'user.email': value => 'danmikita@gmail.com' }
  git::config::global { 'core.editor': value => 'vi' }
  git::config::global { 'color.diff': value => 'auto' }
  git::config::global { 'color.status': value => 'auto' }
  git::config::global { 'color.branch': value => 'auto' }
  git::config::global { 'color.interactive': value => 'auto' }
  git::config::global { 'color.ui': value => 'true' }
  git::config::global { 'alias.st': value => 'status' }
  git::config::global { 'alias.co': value => 'checkout' }
  git::config::global { 'alias.br': value => 'branch -v' }
  git::config::global { 'alias.lg': value => 'log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(red)<%an>%Creset\' --abbrev-commit --date=local' }

  #############################
  # Profile
  #############################
  file { "${home_directory}/.bash_profile":
    source => 'puppet:///modules/people/danmikita/bash_profile'
  }

  #############################
  # Safari Settings
  #############################
  boxen::osx_defaults { 'Safari: enable develop menu':
    ensure => present,
    domain => 'com.apple.Safari',
    key => 'IncludeDevelopMenu',
    type => 'bool',
    value => true,
    user => $::boxen_user
  }
}
