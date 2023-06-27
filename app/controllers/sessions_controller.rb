class SessionsController < ApplicationController
  def index
  end

  def signup
    @student = Student.new
  end

  def create
    byebug
    student = Student.new()

    if @student.save
      render 'sessions/signup', locals: @student
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    student = Student.find_by(email: params[:email]) # Encontre o usuário pelo email

    if student&.authenticate(params[:password]) # Verifique a autenticação do usuário
      render home_path
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:student).permit(:name, :email, :password) # Ajuste os parâmetros conforme seu modelo de usuário
  end
end
