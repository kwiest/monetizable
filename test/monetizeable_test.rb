require_relative './test_helper'
require_relative '../lib/monetizable'
require_relative '../lib/monetizable/lint'

class MyObject
  include Monetizable

  attr_accessor :amount_cents, :amount_currency
  monetize 'amount'
end

class MyObjectTest < MiniTest::Unit::TestCase
  include Monetizable::Lint::Tests

  test_monetized_fields 'amount'

  private

  def subject
    @my_object ||= MyObject.new
  end
end
