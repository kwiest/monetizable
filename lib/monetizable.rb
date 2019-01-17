require_relative "./monetizable/version"
require 'money'
require 'monetize'

module Monetizable
  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def monetize(field)
      define_method field do
        amount = send "#{field}_cents"
        currency = send "#{field}_currency"

        money = Money.new amount, currency
        memoized = instance_variable_get "@#{field}"
        return memoized if memoized == money

        instance_variable_set "@#{field}", money
      end

      define_method "#{field}=" do |value|
        raise ArgumentError unless value.respond_to? :to_money
        money = value.to_money
        send "#{field}_cents=", money.cents
        send "#{field}_currency=", money.currency.to_s

        instance_variable_set "@#{field}", money
      end
    end
  end
end
