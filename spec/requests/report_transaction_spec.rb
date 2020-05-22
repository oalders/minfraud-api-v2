# frozen_string_literal: true

require 'spec_helper'

request_body = <<-BODY
  {"ip_address":"1.2.3.4","tag":"suspected_fraud","maxmind_id":"12345678","minfraud_id":"58fa38d8-4b87-458b-a22b-f00eda1aa20d","notes":"notes go here","transaction_id":"1FA254yZ"}
BODY

describe Minfraud::Components::TransactionReport do
  let(:report) do
    Minfraud::Components::TransactionReport.new(
      ip_address:     '1.2.3.4',
      tag:            'suspected_fraud',
      maxmind_id:     '12345678',
      minfraud_id:    '58fa38d8-4b87-458b-a22b-f00eda1aa20d',
      notes:          'notes go here',
      transaction_id: '1FA254yZ'
    )
  end
  let(:assessment) { Minfraud::Assessments.new(transaction_report: report) }
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
