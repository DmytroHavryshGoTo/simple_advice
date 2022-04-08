# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "json"

require_relative "simple_advice/version"

module SimpleAdvice
  autoload :Config, "simple_advice/config"
  autoload :Client, "simple_advice/client"
  autoload :Collection, "simple_advice/collection"
  autoload :Error, "simple_advice/error"
  autoload :Object, "simple_advice/object"

  # Classes used to return a nicer object wrapping the response data
  autoload :Advice, "simple_advice/objects/advice"

  class << self
    def random
      Advice.new JSON.parse(Client.get_request("advice").body)["slip"]
    end

    def find(advice_id:)
      advice_obj = JSON.parse(Client.get_request("advice/#{advice_id}").body)["slip"]
      advice_obj ? Advice.new(advice_obj) : nil
    end

    def find_by(query:)
      Collection.from_response(Client.get_request("advice/search/#{query}"), key: "slips", type: Advice)
    end
  end
end
