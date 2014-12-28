require 'spec_helper'

describe PictureFrom::Keyword do

  describe '#email?' do

    describe 'when a valid email is passed' do
      subject { described_class.new('karreiro@gmail.com') }

      it 'returns true' do
        expect(subject.type).to eq(:email)
      end
    end

    describe 'when a twitter username is passed' do
      subject { described_class.new('@g_carreiro') }

      it 'returns true' do
        expect(subject.type).to eq(:username)
      end
    end

    describe 'when a facebook username is passed' do
      subject { described_class.new('karreiro') }

      it 'returns true' do
        expect(subject.type).to eq(:username)
      end
    end

    describe 'when an user info is passed' do
      subject { described_class.new('Guilherme Carreiro') }

      it 'returns true' do
        expect(subject.type).to eq(:user_info)
      end
    end

  end

end
