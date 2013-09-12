module Monetizable
  module Lint
    module Tests
      def self.included(base)
        base.send :extend, ClassMethods
      end

      def money
        Money.new 1000, 'USD'
      end

      module ClassMethods
        def test_monetized_fields(*fields)
          fields.each do |field|
            define_method "test_#{field}_int" do
              subject.public_send "#{field}=", 10
              assert_equal money, subject.public_send(field)
            end

            define_method "test_#{field}_decimal" do
              subject.public_send "#{field}=", 10.00
              assert_equal money, subject.public_send(field)
            end

            define_method "test_#{field}_string_int" do
              subject.public_send "#{field}=", '10'
              assert_equal money, subject.public_send(field)
            end

            define_method "test_#{field}_string_decimal" do
              subject.public_send "#{field}=", '10.00'
              assert_equal money, subject.public_send(field)
            end

            define_method "test_#{field}_formatted_string_int" do
              subject.public_send "#{field}=", '$10'
              assert_equal money, subject.public_send(field)
            end

            define_method "test_#{field}_formatted_string_decimal" do
              subject.public_send "#{field}=", '$10.00'
              assert_equal money, subject.public_send(field)
            end

            define_method "test_#{field}_formatted_string_decimal_with_cents" do
              subject.public_send "#{field}=", '$10.50'
              assert_equal Money.new(1050, 'USD'), subject.public_send(field)
            end
          end
        end
      end
    end
  end
end
