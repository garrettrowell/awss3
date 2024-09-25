# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/s3get'

RSpec.describe 'the s3get type' do
  it 'loads' do
    expect(Puppet::Type.type(:s3get)).not_to be_nil
  end
end
