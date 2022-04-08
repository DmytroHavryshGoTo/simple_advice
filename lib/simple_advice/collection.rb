# frozen_string_literal: true

module SimpleAdvice
  class Collection
    attr_reader :data, :total

    def self.from_response(response, key:, type:)
      body = JSON.parse(response.body)
      data = body[key]
      return new(data: [], total: 0) unless data

      new(
        data: data.map { |attrs| type.new(attrs) },
        total: body["total_results"].to_i
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end
