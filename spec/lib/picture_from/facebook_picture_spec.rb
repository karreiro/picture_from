require 'spec_helper'

describe PictureFrom::FacebookPicture do

  describe '#picture_from_username' do
    subject { described_class.new }

    it 'returns the image url' do
      fake('http://graph.facebook.com/karreiro/picture',
           status: 302,
           message: 'Found',
           location: 'https://fbcdn-profile-a.akamaihd.net/image.png')

      link = subject.picture_from_username('karreiro')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

  describe '#picture_from_user_info' do
    subject { described_class.new }

    it 'returns the image url' do
      fake('https://www.facebook.com/search.php?q=karreiro@gmail.com',
           file: 'facebook_crawler.response')

      link = subject.picture_from_user_info('karreiro@gmail.com')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

  describe 'online tests', :online => true do

    describe '#picture_from_user_info' do
      subject { described_class.new }

      it 'returns the image url' do
        link = subject.picture_from_user_info('Mark Zuckerberg')
        expect(link).to eq('http://graph.facebook.com/zuck/picture')
      end
    end

  end

end
