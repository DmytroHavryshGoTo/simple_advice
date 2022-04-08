# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simple_advice"
require "minitest/autorun"
require "faraday"
require "json"

SimpleAdvice::Config.http_adapter = :test

module Minitest
  class Test
    def stub_response(fixture:, status: 200, headers: { "Content-Type" => "application/json" })
      [status, headers, File.read("test/fixtures/#{fixture}.json")]
    end

    def stub_request(path, response:, method: :get)
      Faraday::Adapter::Test::Stubs.new do |stub|
        arguments = [method, path]
        stub.send(*arguments) { |_| response }
      end
    end
  end
end
