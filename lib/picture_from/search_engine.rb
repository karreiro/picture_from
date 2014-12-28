module PictureFrom
  class SearchEngine

    DEFAULT_RULES = {
      username: [
        { facebook: :picture_from_username },
        { twitter: :picture_from_username },
        { facebook: :picture_from_user_info }
      ],
      email: [
        { gravatar: :picture_from_email },
        { facebook: :picture_from_user_info }
      ],
      user_info: [
        { facebook: :picture_from_user_info }
      ]
    }

    def initialize(keyword_value = '')
      @keyword = Keyword.new(keyword_value)
    end

    def image_url
      default_rules.each do |rule|
        rule.each do |provider, method|
          image_url = initialize_provider(provider).send(method, @keyword.value)
          return image_url if image_url
        end
      end
      nil
    end

    private

    def default_rules
      DEFAULT_RULES[@keyword.type]
    end

    def initialize_provider(provider)
      provider_name = "#{provider.capitalize}Picture"
      PictureFrom.const_get(provider_name).new
    end

  end
end
