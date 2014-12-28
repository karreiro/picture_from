require 'spec_helper'

describe PictureFrom::Apis::FacebookApi do

  describe '#image_url_by_username' do
    subject { described_class.new }

    describe 'when username is blank' do
      let(:url) { subject.image_url_by_username('') }

      it 'returns nil' do
        fake('http://graph.facebook.com//picture',
             status: 400,
             message: 'Bad Request')

        expect(url).to be_nil
      end
    end

    describe 'when username does not exist' do
      let(:url) { subject.image_url_by_username('g_carreiro') }

      it 'returns nil' do
        fake('http://graph.facebook.com/g_carreiro/picture',
             status: 404,
             message: 'Not Found')

        expect(url).to be_nil
      end
    end

    describe 'when username is valid' do
      let(:url) { subject.image_url_by_username('karreiro') }

      it 'returns a valid url' do
        fake('http://graph.facebook.com/karreiro/picture',
             status: 302,
             message: 'Found',
             location: 'https://fbcdn-profile-a.akamaihd.net/image.png')

        expect(url).to eq('http://graph.facebook.com/karreiro/picture')
      end
    end
  end

end
