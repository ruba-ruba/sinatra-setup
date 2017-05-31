require 'spec_helper'

RSpec.describe User do
  describe '.authenticate' do
    let!(:user) { create(:user, email: 'uemail', password: 'upass') }

    it 'works when params are correct' do
      expect(described_class.authenticate(user.email, 'upass')).to be_truthy
    end
  end
end
