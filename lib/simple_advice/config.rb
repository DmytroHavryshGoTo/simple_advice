# frozen_string_literal: true

module SimpleAdvice
  class Config
    @http_adapter = Faraday.default_adapter

    class << self
      attr_accessor :http_adapter, :stubs
    end
  end
end
