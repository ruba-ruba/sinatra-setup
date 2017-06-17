require 'spec_helper'

RSpec.describe User do
  describe 'hooks' do
    context 'before create' do
      let(:user) { build(:user, password: 'pass') }

      it 'secure password' do
        expect { user.save }.to change { user.password }.from('pass')
      end
    end
  end

  describe 'validations' do
    let(:user) { build(:user) }

    it 'requires email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to eq ['is not present']
    end

    it 'requires email' do
      user.password = nil
      expect(user).not_to be_valid
      expect(user.errors[:password]).to eq ['is not present']
    end
  end
end
