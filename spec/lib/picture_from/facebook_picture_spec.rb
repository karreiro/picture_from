require 'spec_helper'

describe PictureFrom::FacebookPicture do

  describe '#picture_from_username' do
    subject { described_class.new }

    it 'returns the image url' do
      link = subject.picture_from_username('karreiro')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

  describe '#picture_from_user_info' do
    subject { described_class.new }

    it 'returns the image url' do
      search_url = 'https://www.facebook.com/search.php?q=karreiro@gmail.com'
      search_response = 'facebook_crawler.response'
      fake(search_url, search_response)

      link = subject.picture_from_user_info('karreiro@gmail.com')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

end
