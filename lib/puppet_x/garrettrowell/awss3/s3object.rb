# Based off of example at: https://github.com/awsdocs/aws-doc-sdk-examples/blob/main/ruby/example_code/s3/object_get.rb
module PuppetX::Garrettrowell::Awss3
  class S3ObjectGetWrapper
    attr_reader :object

    # @param object [Aws::S3::Object] An existing Amazon S3 object.
    def initialize(object)
      @object = object
    end

    # Gets the object directly to a file.
    #
    # @param target_path [String] The path to the file where the object is downloaded.
    # @return [Aws::S3::Types::GetObjectOutput, nil] The retrieved object data if successful; otherwise nil.
    def get_object(target_path)
      @object.get(response_target: target_path)
    rescue Aws::Errors::ServiceError => e
      raise Puppet::Error, _("Couldn't get object %{object}. Here's why: %{detail}") % { object: @object.key, detail: e.message }, e.context
    end

  end
end
