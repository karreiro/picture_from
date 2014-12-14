require 'spec_helper'

describe PictureFrom::FacebookPicture do

  describe '#picture_from_username' do
    subject { described_class.new }

    it 'returns the image url' do
      link = subject.picture_from_username('karreiro')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

end
