require 'spec_helper'

RSpec.describe UserAuthentication do
  let!(:user) { create(:user, email: 'uemail', password: 'upass') }

  describe '.authenticate' do
    subject do
      described_class.call('email' => 'uemail', 'password' => 'upass')
    end

    context 'when params are correct' do
      it 'success' do
        expect(subject.success?).to be_truthy
      end

      it 'set user' do
        expect(subject.user).not_to be_nil
      end
    end

    context 'when params invalid' do
      before { user.update(password: 'another-pass') }

      it 'respond with failure' do
        expect(subject.failure?).to be_truthy
      end

      it 'set error message' do
        expect(subject.message).to eq('Could not log in')
      end
    end
  end
end
