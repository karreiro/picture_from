require 'digest/md5'

module PictureFrom
  class GravatarPicture

    # TODO: Gravatar always returns an image. The default Gravatar image should
    # be rejected.
    def picture_from_email(email)
      "http://www.gravatar.com/avatar/#{digest(email)}"
    end

    private

    def digest(email)
      Digest::MD5.hexdigest(email)
    end

  end
end
