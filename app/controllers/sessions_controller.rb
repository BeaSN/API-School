class SessionsController < ApplicationController
  def index
  end

  def signup
    student = Student.new(user_params)

    if student.save
      token = encode_token(user_id: student.id) # Codifique um token JWT com o ID do usuário

      render json: { token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    student = Student.find_by(email: params[:email]) # Encontre o usuário pelo email

    if student&.authenticate(params[:password]) # Verifique a autenticação do usuário
      token = encode_token(user_id: student.id) # Codifique um token JWT com o ID do usuário

      render json: { token: token } # Retorne o token JWT para o cliente
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:student).permit(:name, :email, :password) # Ajuste os parâmetros conforme seu modelo de usuário
  end
end
