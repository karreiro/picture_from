require 'spec_helper'

describe PictureFrom::Crawlers::FacebookCrawler do

  describe '#image_url_by_user_info' do
    subject { described_class.new }

    describe 'when some profiles are found' do
      it 'returns an image url' do
        fake('https://www.facebook.com/search.php?q=karreiro@gmail.com',
             file: 'facebook_crawler.response')

        username = subject.image_url_by_user_info('karreiro@gmail.com')

        expect(username).to eq('karreiro')
      end
    end

    describe 'when any profile is found' do
      it 'does not return an image url' do
        fake('https://www.facebook.com/search.php?q=guilherme@gmail.com',
             file: 'facebook_crawler_empty.response')

        username = subject.image_url_by_user_info('guilherme@gmail.com')

        expect(username).to be_nil
      end
    end
  end

  describe PictureFrom::Crawlers::FacebookCrawler::SearchPage do

    describe '#username_from_url' do

      subject do
        fake('https://www.facebook.com/search.php?q=')
        described_class.new('')
      end

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
            'http://fb.com/karreiro',
            'https://www.facebook.com/pages/Mark-Zuckerberg/112845672063384'
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

end
