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

    context 'when email is missing' do
      before do
        user.email = nil
        user.valid?
      end

      it 'not valid' do
        expect(user).not_to be_valid
      end

      it 'set error message' do
        expect(user.errors[:email]).to eq ['is not present']
      end
    end

    context 'when password is missing' do
      before do
        user.password = nil
        user.valid?
      end

      it 'not valid' do
        expect(user).not_to be_valid
      end

      it 'set error message' do
        expect(user.errors[:password]).to eq ['is not present']
      end
    end
  end
end
