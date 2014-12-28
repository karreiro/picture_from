module PictureFrom
  class Keyword

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def type
      case value
      when /^@?([\w\.])*$/
        :username
      when /.+@.+/
        :email
      else
        :user_info
      end
    end

  end
end
