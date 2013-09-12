module Monetizable
  module Lint
    module Tests
      def money
        Money.new 1000, 'USD'
      end

      def test_int
        subject.public_send "#{monetized_field}=", 10
        assert_equal money, subject.public_send(monetized_field)
      end

      def test_decimal
        subject.public_send "#{monetized_field}=", 10.00
        assert_equal money, subject.public_send(monetized_field)
      end

      def test_string_int
        subject.public_send "#{monetized_field}=", '10'
        assert_equal money, subject.public_send(monetized_field)
      end

      def test_string_decimal
        subject.public_send "#{monetized_field}=", '10.00'
        assert_equal money, subject.public_send(monetized_field)
      end

      def test_formatted_string_int
        subject.public_send "#{monetized_field}=", '$10'
        assert_equal money, subject.public_send(monetized_field)
      end

      def test_formatted_string_decimal
        subject.public_send "#{monetized_field}=", '$10.00'
        assert_equal money, subject.public_send(monetized_field)
      end

      def test_formatted_string_decimal_with_cents
        subject.public_send "#{monetized_field}=", '$10.50'
        assert_equal Money.new(1050, 'USD'), subject.public_send(monetized_field)
      end
    end
  end
end
