module PictureFrom
  class FacebookPicture

    def picture_from_username(username)
      "http://graph.facebook.com/#{username}/picture"
    end

    # def picture_from_email(email)
    # end

    # def picture_from_name(name)
    # end

  end
end
