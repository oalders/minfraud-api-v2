# frozen_string_literal: true

module Minfraud
  module Components
    # Contains all of the fields which are used in the report_transaction API
    class Transaction < Base
      include ::Minfraud::Enum

      # @!attribute ip_address
      # @return [String] The IP address of the customer placing the order. This
      # should be passed as a string like "44.55.66.77" or "2001:db8::2:1".
      attr_accessor :ip_address

      # @attribute tag
      # @return [String] A string indicating the likelihood that a transaction
      # may be fraudulent
      enum_accessor :type,
                    %i[
                      chargeback
                      not_fraud
                      spam_or_abuse
                      suspected_fraud
                    ]

      # @attribute maxmind_id
      # @return [String] A unique eight character string identifying a minFraud
      # Standard or Premium request. These IDs are returned in the maxmindID
      # field of a response for a successful minFraud request. This field is
      # not required, but you are encouraged to provide it, if possible.
      attr_accessor :maxmind_id

      # @attribute minfraud_id
      # @return [String] A UUID that identifies a minFraud Score, minFraud
      # Insights, or minFraud Factors request. This ID is returned at /id in
      # the response. This field is not required, but you are encouraged to
      # provide it if the request was made to one of these services.
      attr_accessor :minfraud_id

      # @attribute notes
      # @return [String] Your notes on the fraud tag associated with the
      # transaction. We manually review many reported transactions to improve
      # our scoring for you so any additional details to help us understand
      # context are helpful.
      attr_accessor :notes

      # @attribute transaction_id
      # @return [String] The transaction ID you originally passed to minFraud.
      # This field is not required, but you are encouraged to provide it or the
      # transaction's maxmind_id or minfraud_id
      attr_accessor :transaction_id

      # Creates Minfraud::Components::Transaction instance
      # @param  [Hash] params hash of parameters
      # @return [Minfraud::Components::Transaction] a Transaction instance
      def initialize(params = {})
        @ip_address = params[:ip_address]
        @tag = params[:tag]
        @maxmind_id = params[:maxmind_id]
        @minfraud_id = params[:minfraud_id]
        @notes = params[:notes]
        @transaction_id = params[:transaction_id]
        self.type       = params[:type]
      end
    end
  end
end
