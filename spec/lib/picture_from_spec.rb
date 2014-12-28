require 'spec_helper'

describe PictureFrom do
  subject { PictureFrom }

  describe 'facebook engine' do
    it 'returns the image url' do
      fake('http://graph.facebook.com/karreiro/picture',
           status: 302,
           message: 'Found',
           location: 'https://fbcdn-profile-a.akamaihd.net/image.png')
      link = subject.url('karreiro')
      expect(link).to eq('http://graph.facebook.com/karreiro/picture')
    end
  end

  describe 'twitter engine' do
    it 'returns the image url' do
      fake('http://graph.facebook.com/g_carreiro/picture', status: 404)
      fake('https://twitter.com/g_carreiro', file: 'twitter_crawler.response')
      link = subject.url('g_carreiro')
      expect(link).to eq('https://pbs.twimg.com/profile_images/524721838002143233/nNdh6ftm_400x400.jpeg')
    end
  end

  describe 'gravatar engine' do
    it 'returns the image url' do
      link = subject.url('karreiro@gmail.com')
      expect(link).to eq('http://www.gravatar.com/avatar/16be5820a296f5bce151f0c1b5e16fc8')
    end
  end
end
