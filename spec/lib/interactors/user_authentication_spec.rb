require 'spec_helper'

RSpec.describe UserAuthentication do
  let!(:user) { create(:user, email: 'uemail', password: 'upass') }

  describe '.authenticate' do
    subject do
      described_class.call({ 'email' => 'uemail', 'password' => 'upass' })
    end

    it 'success when params are correct' do
      expect(subject.success?).to be_truthy
      expect(subject.user).not_to be_nil
    end

    it 'fails when params invalid' do
      user.update(password: 'another-pass')
      expect(subject.failure?).to be_truthy
      expect(subject.message).to eq('Could not log in')
    end
  end
end
