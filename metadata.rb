name 'tls'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache 2.0'
version '1.0.0'

supports 'centos', '>= 7.2'
supports 'redhat', '>= 7.2'
supports 'ubuntu', '>= 14.04'

depends 'chef-sugar'
depends 'chef-vault'
depends 'poise', '~> 2.6'

source_url 'https://github.com/johnbellone/tls-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/johnbellone/tls-cookbook/issues' if respond_to?(:issues_url)
