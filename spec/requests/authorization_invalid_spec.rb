# frozen_string_literal: true

require 'spec_helper'

response_body = <<-HEREDOC
  {
     "code":"AUTHORIZATION_INVALID",
     "error":"An account ID and license key are required to use this service."
  }
HEREDOC

content_type =
  'application/vnd.maxmind.com-error+json; charset=UTF-8; version=2.0'

describe Minfraud::Components::Device do
  let(:device) { Minfraud::Components::Device.new(ip_address: '1.2.3.4.5') }
  let(:assessment) { Minfraud::Assessments.new(device: device) }
  describe 'device with no credentials' do
    it 'makes a request' do
      stub_request(:post, 'https://minfraud.maxmind.com/minfraud/v2.0/insights')
        .to_return(
          status: 401,
          body: response_body,
          headers: { 'Content-Type': content_type }
        )
      expect { assessment.insights }
        .to raise_error(Minfraud::AuthorizationError)
    end
  end
end
