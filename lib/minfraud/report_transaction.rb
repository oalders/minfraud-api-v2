module Minfraud
  class ReportTransaction
    include ::Minfraud::HTTPService

    # @!attribute transaction_report
    # @return [Minfraud::Components::TransactionReport] TransactionReport component
    attr_accessor :transaction_report

    # @param  [Hash] params hash of parameters
    # @return [Minfraud::ReportTransaction] ReportTransaction instance
    def initialize(params = {})
      @transaction_report = params[:transaction_report]
    end

    # @method report_transaction
    # Makes a request to the minFraud report transactions API.
    # Raises an error in case of invalid response.
    # @return [nil]
    def report_transaction
      raw = request.perform(verb: :post, endpoint: 'transactions/report', body: request_body)

      response = ::Minfraud::HTTPService::Response.new(
        status: raw.status.to_i,
        body: raw.body,
        headers: raw.headers
      )
      ::Minfraud::ErrorHandler.examine(response)

      return nil if raw.status.to_i == 204
    end

    private
    # Creates a unified request body from components converted to JSON
    # @return [String] Request body
    def request_body
      @transaction_report.to_json
    end

    # Creates memoized Minfraud::HTTPService::Request instance
    # @return [Minfraud::HTTPService::Request] Request instance based on configuration params
    def request
      @request ||= Request.new(::Minfraud::HTTPService.configuration)
    end
  end
end
