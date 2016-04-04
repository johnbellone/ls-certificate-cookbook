#
# Cookbook: tls
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
require 'poise'

module TlsCookbook
  module Resource
    # A `tls_certificate` resource which represents transport-layer
    # security certificates and keys.
    # @provides tls_certificate
    # @action create
    # @action remove
    # @since 1.0
    class TlsCertificate < Chef::Resource
      include Poise(inversion: true)
      provides(:tls_certificate)
      actions(:create, :remove)
      default_action(:create)

      # @!attribute path
      # @return [String]
      attribute(:path, kind_of: String, name_attribute: true)
      # @!attribute owner
      # @return [String]
      attribute(:owner, kind_of: String)
      # @!attribute group
      # @return [String]
      attribute(:group, kind_of: String)
      # @!attribute mode
      # @return [String]
      attribute(:mode, kind_of: String, default: '0444')

      def content
        @content ||= provider_for_action(:content).content
      end
    end
  end

  module Provider
    # A `tls_certificate` provider which manages TLS certificates.
    # @since 1.0
    class TlsCertificate
      def action_create
        notifying_block do
          file new_resource.path do
            content new_resource.content
            owner new_resource.owner
            group new_resource.group
            mode new_resource.mode
          end
        end
      end

      def action_delete
        notifying_block do
          file new_resource.path do
            action :delete
          end
        end
      end
    end
  end
end
