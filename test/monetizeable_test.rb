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

  private

  def monetized_field
    'amount'
  end

  def subject
    @my_object ||= MyObject.new
  end
end
