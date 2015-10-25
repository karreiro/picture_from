require 'spec_helper'

describe PictureFrom::GravatarPicture do

  describe '#picture_from_email' do
    subject { described_class.new }

    it 'returns the image url' do
      gravatar_url = 'http://www.gravatar.com/avatar/16be5820a296f5bce151f0c1b5e16fc8?d=404'
      fake(gravatar_url, file: 'gravatar_crawler.response')
      link = subject.picture_from_email('karreiro@gmail.com')
      expect(link).to eq(gravatar_url)
    end
  end

end
