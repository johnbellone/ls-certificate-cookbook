#
# Cookbook: tls
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
require 'poise'

module TlsCookbook
  module Resource
    class TlsPrivateKey < Chef::Resource
      include Poise(inversion: true)
      provides(:tls_private_key)
      actions(:create, :delete)
      default_action(:create)
    end
  end

  module Provider
  end
end
