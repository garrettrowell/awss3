# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include awss3
class awss3 {
  package { 'aws-sdk-s3':
    ensure   => present,
    provider => puppet_gem,
  }
}
