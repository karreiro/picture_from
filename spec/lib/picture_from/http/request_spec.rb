require 'spec_helper'

describe PictureFrom::HTTP::Request do
  subject { described_class.new }
  describe '#open_url' do
    describe 'when server return bad request' do

      it 'returns nil' do
        fake('http://graph.facebook.com//picture',
             status: 400,
             message: 'Bad Request')
        url = subject.open_url('http://graph.facebook.com//picture')
        expect(url).to be_nil
      end
    end

    describe 'when server return content' do

      it 'returns a valid url' do
        fake('http://graph.facebook.com/karreiro/picture',
             status: 302,
             message: 'Found',
             location: 'https://fbcdn-profile-a.akamaihd.net/image.png')

        url = subject.open_url('http://graph.facebook.com/karreiro/picture')
        expect(url).to eq('http://graph.facebook.com/karreiro/picture')
      end
    end
  end
end
