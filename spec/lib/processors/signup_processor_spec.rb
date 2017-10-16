require 'spec_helper'

RSpec.describe SignupProcessor do
  describe '.process' do
    before do
      allow_any_instance_of(described_class).to receive(:greet_user)
    end

    context 'when params are valid' do
      let(:params) do
        { 'email' => 'email@com', 'password' => 'pass', 'password_confirmation' => 'pass' }
      end

      it 'creates user' do
        expect { described_class.process(params) }.to change { User.count }.from(0).to(1)
      end

      context 'when duplicate record exists' do
        before { create(:user, email: params['email']) }

        it 'does not create new instance' do
          expect { described_class.process(params) }.not_to change { User.count }
        end
      end
    end
  end
end
