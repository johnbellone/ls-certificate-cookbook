#
# Cookbook: tls
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
require 'poise'

module TlsCookbook
  module Provider
    class TlsCertificateDataBag < Chef::Provider
      include Poise(inversion: :tls_certificate)
      provides(:data_bag)
      inversion_attribute('tls-certificate')
      include TlsCertificate

      # @api private
      def self.provides_auto?(_node, _resource)
        true
      end

      # Set the default inversion options.
      # @return [Hash]
      # @api private
      def self.default_inversion_options(node, resource)
        super.merge(bag_name: 'certificates')
      end

      def content
        data_bag_item(options[:bag_name], options[:bag_item])
      end
    end
  end
end
