# frozen_string_literal: true

module SimpleAdvice
  class Client
    BASE_URL = "https://api.adviceslip.com"

    class << self
      def get_request(url, params: {}, headers: {})
        handle_response connection.get(url, params, headers)
      end

      private

      def connection
        Faraday.new(BASE_URL) do |conn|
          conn.request :json
          # Can't use because the response is always text/html format and when 500 error happens it crashes
          # conn.response :json
          conn.adapter Config.http_adapter, Config.stubs
        end
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Your request was malformed."
        when 404
          raise Error, "No results were found for your request."
        when 429
          raise Error, "Your request exceeded the API rate limit."
        when 500
          raise Error, "We were unable to perform the request due to server-side problems."
        when 503
          raise Error, "You have been rate limited for sending more than 20 requests per second."
        end

        response
      end
    end
  end
end
