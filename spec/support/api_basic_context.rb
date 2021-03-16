# frozen_string_literal: true

RSpec.shared_context 'api basic context', shared_generators: :metadata do
  let(:user) { create :user }
  let(:admin) { create :user, role: User::ADMIN }

  def generate_token(user)
    payload = {
      user: {
        email: user.email
      }
    }

    JWT.encode payload, '', 'HS256'
  end
end
