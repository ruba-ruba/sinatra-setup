require 'spec_helper'

RSpec.describe User do
  describe '.authenticate' do
    before do
      User.create(email: 'uname', password: 'upass')
    end

    it 'works when params are correct' do
      expect(described_class.authenticate('uname', 'upass')).to be_truthy
    end
  end
end