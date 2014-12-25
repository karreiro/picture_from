require 'spec_helper'

describe PictureFrom::Crawlers::TwitterCrawler do

  describe '#image_url_by_username' do
    subject { described_class.new }

    describe 'when some profiles are found' do
      it 'returns an image url' do
        fake('https://twitter.com/g_carreiro', file: 'twitter_crawler.response')

        image_url = subject.image_url_by_username('g_carreiro')

        expect(image_url).to eq('https://pbs.twimg.com/profile_images/524721838002143233/nNdh6ftm_400x400.jpeg')
      end
    end

    describe 'when any profile is found' do
      it 'does not return an image url' do
        fake('https://twitter.com/g_carreiro_fake',
             status: 404,
             message: 'Not Found')

        image_url = subject.image_url_by_username('g_carreiro_fake')

        expect(image_url).to be_nil
      end
    end

  end

end
