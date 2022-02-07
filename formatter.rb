module Formatter
  module PhoneNumber

    class InvalidPhoneNumber < StandardError; end
    class InvalidPrefix < StandardError; end
    class InvalidNumberLength < StandardError; end

    module UK
      def self.format(number)
        regex = /\+?(44|0)7(?<number>\d{9})/
        clean_number = number.gsub(/\s+/, '')

        raise InvalidPrefix, 'Prefix must be: +44, 44 or 0' unless clean_number.start_with?(/\+?(44|0)/)
        raise InvalidNumberLength, 'Number after prefix must be 7, followed by 9 digits' unless clean_number.match?(/\+?(44|0)7\d{9}/)
        raise InvalidPhoneNumber unless clean_number.match?(regex)

        match_num = clean_number.match(regex)
        "+447#{match_num[:number]}"
      end
    end

    module US
      def self.format(number)
        regex = /^(\+?1|0)212(?<number>\d{7})$/
        clean_number = number.gsub(/\s+/, '')

        raise InvalidPrefix, 'Prefix must be: +1, 1, 0' unless clean_number.start_with?(/^(\+?1|0)$/)
        raise InvalidNumberLength, 'Number after prefix must be 212, followed by 7 digits' unless clean_number.match?(/^\+?(44|0)212\d{7}$/)
        raise InvalidPhoneNumber unless clean_number.match?(regex)

        "1212#{clean_number.match(regex)[:number]}"
      end
    end
  end
end

p Formatter::PhoneNumber::US.format('+1 212 1234567')
