# frozen_string_literal: true

require 'aws-sdk-s3' if Puppet.features.awss3?
require_relative '../../../puppet_x/garrettrowell/awss3/s3object'
require 'fileutils'

# Ruby Implementation for the s3_get_object type
Puppet::Type.type(:s3_get_object).provide(:ruby) do
  confine :feature => :awss3

  def exists?
    if File.file?(resource[:path])
      return true
    else
      false
    end
  end

  def create
    fail 'bucket_name parameter is missing.' if resource[:bucket_name].nil?
    fail 'object_key parameter is missing.' if resource[:object_key].nil?

    if !exists?
      $s3_obj = get_object
    end
    $s3_obj.get(:response_target => resource[:path])
  end

  def update
    self.create
  end

  def destroy
    FileUtils.rm_rf resource[:path]
  end

  def get_object
    wrapper = PuppetX::Garrettrowell::Awss3::S3ObjectGetWrapper.new(Aws::S3::Object.new(resource[:bucket_name], resource[:object_key]))
    obj_data = wrapper.get_object(resource[:path])
    return unless obj_data
  end

end
