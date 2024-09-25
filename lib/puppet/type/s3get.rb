# frozen_string_literal: true

require 'puppet/resource_api'
require 'aws-sdk-s3' if Puppet.features.awss3?


Puppet::ResourceApi.register_type(
  name: 's3get',
  docs: <<-EOS,
@summary a s3get type
@example
s3get { 'foo':
  ensure => 'present',
}

This type provides Puppet with the capabilities to manage ...

If your type uses autorequires, please document as shown below, else delete
these lines.
**Autorequires**:
* `Package[foo]`
EOS
  features: [],
  attributes: {
    ensure: {
      type: 'Enum[present, absent]',
      desc: 'Whether this resource should be present or absent on the target system.',
      default: 'present',
    },
    name: {
      type: 'String',
      desc: 'The name of the resource you want to manage.',
      behaviour: :namevar,
    },
  },
)
