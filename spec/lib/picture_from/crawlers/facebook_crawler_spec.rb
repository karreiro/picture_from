require 'spec_helper'

describe PictureFrom::Crawlers::FacebookCrawler do

  describe '#query' do
    subject { described_class.new }

    describe 'when some profiles are found' do
      it 'returns an image url' do
        search_url = 'https://www.facebook.com/search.php?q=karreiro@gmail.com'
        search_response = 'facebook_crawler.response'
        fake(search_url, search_response)

        username = subject.query('karreiro@gmail.com')

        expect(username).to eq('karreiro')
      end
    end

    describe 'when any profile is found' do
      it 'does not return an image url' do
        search_url = 'https://www.facebook.com/search.php?q=karreiro@gmail.com'
        search_response = 'facebook_crawler_empty.response'
        fake(search_url, search_response)

        username = subject.query('karreiro@gmail.com')

        expect(username).to be_nil
      end
    end

  end

  describe '#username_from_url' do
    subject { described_class.new }

    describe 'when receives valid URLs' do
      let(:urls) do
        [
          'https://www.facebook.com/karreiro',
          'http://www.facebook.com/karreiro',
          'http://facebook.com/karreiro/',
          'http://facebook.com/karreiro'
        ]
      end

      it 'returns a valid username' do
        urls.each do |url|
          expect(subject.send(:username_from_url, url)).to eq('karreiro')
        end
      end
    end

    describe 'when receives invalid URLs' do
      let(:urls) do
        [
          'https://orkut.com/karreiro',
          'http://fb.com/karreiro'
        ]
      end

      it 'does not return any username' do
        urls.each do |url|
          expect(subject.send(:username_from_url, url)).to be_nil
        end
      end
    end

  end

end
