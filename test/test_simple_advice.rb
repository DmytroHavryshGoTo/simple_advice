# frozen_string_literal: true

require "test_helper"

class TestSimpleAdvice < Minitest::Test
  def test_random
    SimpleAdvice::Config.stubs = stub_request("advice", response: stub_response(fixture: "advices/single"))
    result = SimpleAdvice.random
    assert_equal SimpleAdvice::Advice, result.class
    assert_equal result.advice, "Smile and the world smiles with you. Frown and you're on your own."
  end

  def test_find
    advice_id = "2"
    SimpleAdvice::Config.stubs = stub_request("advice/#{advice_id}", response: stub_response(fixture: "advices/single"))
    result = SimpleAdvice.find(advice_id: advice_id)

    assert_equal SimpleAdvice::Advice, result.class
    assert_equal result.advice, "Smile and the world smiles with you. Frown and you're on your own."
  end

  def test_find_by
    search = "you"
    SimpleAdvice::Config.stubs = stub_request("advice/search/#{search}",
                                              response: stub_response(fixture: "advices/collection"))
    result = SimpleAdvice.find_by(query: search)

    assert_equal SimpleAdvice::Collection, result.class
    assert_equal SimpleAdvice::Advice, result.data.first.class
    assert_equal 2, result.total
  end
end
