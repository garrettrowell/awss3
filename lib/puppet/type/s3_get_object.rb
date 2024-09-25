# frozen_string_literal: true

Puppet::Type.newtype(:s3_get_object) do
  @doc = 'Download a file from an S3 bucket'
  ensurable

  newparam(:path, :namevar => true) do
    desc 'The local path to the file to manage.'
  end

  newparam(:bucket_name) do
    desc 'The AWS S3 bucket from which to copy the object.'
  end

  newparam(:object_key) do
    desc 'The AWS S3 bucket object to copy.'
  end
end
