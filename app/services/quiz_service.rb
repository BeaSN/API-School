class QuizService
  class << self
    def create_quiz(params)
      quiz = Quiz.create(name: params[:name], description: params[:description], team_id: params[:team_id])
      School::Entities::Quiz.represent(quiz)
    end

    def list(params)
      quizzes = Quiz.all
      quizzes = Quiz.joins(:team).where("teams.name LIKE ? OR teams.id LIKE ? OR quizzes.name LIKE ? OR quizzes.id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      School::Entities::Quiz.represent(quizzes)
    end

    def update_quiz(params)
      quiz = Quiz.find(params[:id])
      quiz.name = params[:name] if params[:name].present?
      quiz.description = params[:description] if params[:description].present?
      quiz.team_id = params[:team_id] if params[:team_id].present?
      quiz.save
      School::Entities::Quiz.represent(quiz)
    end

    def delete_quiz(params)
      quiz = Quiz.find(params[:id])
      quiz.destroy
      "Sucess"
    end
  end
end
