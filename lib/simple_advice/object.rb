# frozen_string_literal: true

require "ostruct"

module SimpleAdvice
  class Object < OpenStruct
    def initialize(attributes)
      super to_struct(attributes)
    end

    def to_struct(obj)
      case obj
      when is_a?(Hash)
        OpenStruct.new(obj.transform_values(&:to_ostruct))
      when is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else
        obj
      end
    end
  end
end
