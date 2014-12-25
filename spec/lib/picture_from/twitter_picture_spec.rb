require 'spec_helper'

describe PictureFrom::TwitterPicture do

  describe 'online tests' do

    describe '#picture_from_username' do
      subject { described_class.new }

      it 'returns the image url' do
        link = subject.picture_from_username('unclebobmartin')
        expect(link).to eq('https://pbs.twimg.com/profile_images/1102364992/clean_code_72_color_400x400.png')
      end
    end

  end

end
