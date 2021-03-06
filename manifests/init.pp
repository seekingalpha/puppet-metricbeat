# Class: metricbeat
# ===========================
#
# Full description of class metricbeat here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'metricbeat':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class metricbeat (
  Enum['present', 'absent'] $ensure,
  Boolean $manage_repo,
  Struct[{
    location => String,
    key      => Struct[{
      id     => String,
      source => String,
    }],
    release  => String,
    repos    => String,
  }] $repository,
  String $package_name,
  String $package_version,
  String $service_name,
  Hash $config = {},
) {
  class { '::metricbeat::repo': } ->
  class { '::metricbeat::install': } ->
  class { '::metricbeat::config': } ->
  class { '::metricbeat::service': }
}
