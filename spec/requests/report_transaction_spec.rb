# frozen_string_literal: true

require 'spec_helper'

request_body = <<~BODY
  {"ip_address":"1.2.3.4","tag":"suspected_fraud","transaction_id":"1"}
BODY

describe Minfraud::Components::Transaction do
  let(:transaction) do
    Minfraud::Components::Transaction.new({
                                            ip_address: '1.2.3.4',
                                            tag: 'suspected_fraud',
                                            transaction_id: '1'
                                          })
  end
  let(:assessment) { Minfraud::Assessments.new(transaction: transaction) }
  describe 'report transaction' do
    it 'makes a request' do
      stub_request(:post, 'https://minfraud.maxmind.com/minfraud/v2.0/transactions/report')
        .with(
          body: request_body.strip
        )
        .to_return({ status: 204 })
      expect(assessment.report_transaction).to eq(nil)
    end
  end
end
