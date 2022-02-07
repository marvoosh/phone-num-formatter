module Formatter
  module PhoneNumber
    module UK

      class InvalidPhoneNumber < StandardError; end

      class InvalidPrefix < StandardError
        def initialize(msg = 'Prefix must be: +44, 44 or 0', exception_type = 'custom')
          @exception_type = exception_type
          super(msg)
        end
      end

      class InvalidNumberLength < StandardError
        def initialize(msg = 'Number after prefix must be 7, followed by 9 digits', exception_type = 'custom')
          @exception_type = exception_type
          super(msg)
        end
      end

      def self.format(number)
        regex = /\+?(44|0)7(?<number>\d{9})/
        clean_number = number.gsub(/\s+/, '')

        raise InvalidPrefix unless clean_number.start_with?(/\+?(44|0)/)
        raise InvalidNumberLength unless clean_number.match?(/\+?(44|0)7\d{9}/)
        raise InvalidPhoneNumber unless clean_number.match?(regex)

        match_num = clean_number.match(regex)
        "+447#{match_num[:number]}"
      end
    end
  end
end
