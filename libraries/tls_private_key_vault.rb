#
# Cookbook: tls
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
require 'poise'

module TlsCookbook
  module Provider
    class TlsPrivateKeyVault < Chef::Provider
      include Poise(inversion: :tls_private_key)
      provides(:vault)
      require_chef_gem 'vault'

      # Set the default inversion options.
      # @return [Hash]
      # @api private
      def self.default_inversion_options(node, resource)
        super.merge()
      end

      def action_create
      end

      def action_delete
      end
    end
  end
end
