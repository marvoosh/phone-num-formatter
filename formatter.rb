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
        regex = /(?<prefix>\+?(44\s?|0))(?<seven>7)(?<number>(\d{9}|(\d{4}\s\d{5})|\d\s\d{2}(\s\d{3}){2}|\d\s\d{2}\s\d{6}))/
        number.gsub!(/\s+/, '')

        raise InvalidPrefix unless number.start_with?(/\+?(44|0)/)
        raise InvalidNumberLength unless number.match?(/\+?(44|0)7\d{9}/)
        raise InvalidPhoneNumber unless number.match?(regex)

        match_num = number.match(regex)
        case match_num[:prefix]
        when '0' then number.gsub!(/\A0/, '+44')
        when '44' then number.insert(0, '+')
        end
        number
      end
    end
  end
end
