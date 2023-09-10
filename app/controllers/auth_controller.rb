class AuthController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = generate_token(user)
        render json: { token: token }
      else
        render json: { error: 'Credenciais inválidas' }, status: :unauthorized
      end
    end
  
    private
  
    def generate_token(user)
      JWT.encode({ user_id: user.id }, 'your-secret-key', 'HS256')
    end
end
  