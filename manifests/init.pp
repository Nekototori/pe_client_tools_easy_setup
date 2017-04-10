# Class: pe_client_tools_easy_setup
# ===========================
#
# This module installs and configures PE client tools on your machine
#
# Parameters
# ----------
#
# $client_tools_package_path = Path to client tools .msi,.rpm, or .dmg
# $pe_server_certname = certname of the PE Master (must match the name in the ca.pem file)
# $access_token_path  = Where to find the access token
#
# Examples
# --------
#
# @example
#    class { 'pe_client_tools_easy_setup':
#      pe_server_certname          => 'master.inf.puppet.vm',
#      client_tools_package_path   => '/root/pe-client-tools-16.5.2-1.el7.x86_64.rpm',
#      access_token_path           => '~/.puppetlabs/token',
#      client_tools_package_source => puppet:///modules/pe-client-tools-16.5.2-1.el7.x86_64.rpm',
#     }
#
# Authors
# -------
#
# Author Name Abir Majumdar <abir@puppet.com>
#
# Copyright
# ---------
#
# Copyright 2017 Abir Majumdar, unless otherwise noted.
#
class pe_client_tools_easy_setup (
    String $client_tools_package_path,
    String $client_tools_package_source,
    String $pe_server_certname = 'master',
    String $access_token_path  = '~/.puppetlabs/token',
){

  case $::kernel {
    'windows': {
      class {'pe_client_tools_easy_setup::windows':
        client_tools_package_path => $client_tools_package_path,
        pe_server_certname        => $pe_server_certname,
        access_token_path         => $access_token_path,
      }
    }
    'Linux': {
      class {'pe_client_tools_easy_setup::linux':
        client_tools_package_path => $client_tools_package_path,
        pe_server_certname        => $pe_server_certname,
        access_token_path         => $access_token_path,
      }
    }
    'Darwin': {
      class {'pe_client_tools_easy_setup::darwin':
        client_tools_package_path => $client_tools_package_path,
        pe_server_certname        => $pe_server_certname,
        access_token_path         => $access_token_path,
      }
    }
    default: {
      class {'pe_client_tools_easy_setup::linux':
        client_tools_package_path => $client_tools_package_path,
        pe_server_certname        => $pe_server_certname,
        access_token_path         => $access_token_path,
      }
    }
  }

}
