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

  describe '.authenticate' do
    let!(:user) { create(:user, email: 'uemail', password: 'upass') }

    it 'works when params are correct' do
      expect(described_class.authenticate(user.email, 'upass')).to be_truthy
    end
  end
end
