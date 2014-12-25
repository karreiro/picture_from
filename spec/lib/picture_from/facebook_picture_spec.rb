require 'spec_helper'

describe PictureFrom::FacebookPicture do

  describe '#picture_from_username' do
    subject { described_class.new }

    it 'returns the image url' do
      link = subject.picture_from_username('karreiro')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

  describe 'online tests' do

    describe '#picture_from_user_info' do
      subject { described_class.new }

      it 'returns the image url' do
        link = subject.picture_from_user_info('Mark Zuckerberg')
        expect(link).to eq('http://graph.facebook.com/zuck/picture')
      end
    end

  end

end
