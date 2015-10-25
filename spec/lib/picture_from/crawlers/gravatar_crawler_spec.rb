require 'spec_helper'

describe PictureFrom::Crawlers::GravatarCrawler do

  describe '#image_url_by_username' do
    subject { described_class.new }

    describe 'when the user has a gravatar account' do
      it 'returns an image url' do
        gravatar_url = 'http://www.gravatar.com/avatar/16be5820a296f5bce151f0c1b5e16fc8?d=404'
        fake(gravatar_url, file: 'gravatar_crawler.response')

        image_url = subject.picture_from_email('karreiro@gmail.com')

        expect(image_url).to eq(gravatar_url)
      end
    end
    describe 'when any profile is found' do
      it 'does not return an image url' do
        fake('http://www.gravatar.com/avatar/16be5820a296f5bce151f0c1b5e16fc8?d=404',
             status: 404,
             message: 'Not Found')

        image_url = subject.picture_from_email('karreiro@gmail.com')

        expect(image_url).to be_nil
      end
    end
  end

end
