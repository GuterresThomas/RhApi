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
      token = JWT.encode({ user_id: user.id }, 'senha1234', 'HS256')
      puts "Token gerado: #{token}" # Agora você pode imprimir o token
      token
    end
end