#
# Cookbook: tls
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
require 'poise'

module TlsCookbook
  module Provider
    class TlsPrivateKeyChefVault < Chef::Provider
      include Poise(inversion: :tls_private_key)
      provides(:chef_vault)
      require_chef_gem 'chef-vault'

      # @api private
      def self.provides_auto?(_node, _resource)
        true
      end

      # Set the default inversion options.
      # @return [Hash]
      # @api private
      def self.default_inversion_options(node, resource)
        super.merge(vault_name: 'tls_private_keys', vault_item: '')
      end

      def action_create
      end

      def action_delete
      end
    end
  end
end
