class School::V1::Quizzes < Grape::API
  resource :create do
    desc "Create Quizzes"
    params do
      requires :name, type: String
      requires :description, type: String
      requires :course_id, type: Integer
    end

    post "", http_codes: [
               [201, "Ok"],
               [401, "Unauthorized"],
               [404, "Not Found"],
               [500, "Internal Server Error"],
             ] do
      QuizService.create_quiz(params)
    end
  end
  resource :list do
    desc "Get Quizzes"
    params do
      optional :search, type: String
    end

    get "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      QuizService.list(params)
    end
  end
  resource :update do
    desc "Update Quizzes"
    params do
      requires :id, type: Integer
      optional :name, type: String
      optional :description, type: String
      optional :course_id, type: Integer
    end

    put "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      QuizService.update_quiz(params)
    end
  end
  resource :delete do
    desc "Delete Quizzes"
    params do
      requires :id, type: Integer
    end

    delete "", http_codes: [
                 [201, "Ok"],
                 [401, "Unauthorized"],
                 [404, "Not Found"],
                 [500, "Internal Server Error"],
               ] do
      QuizService.delete_quiz(params)
    end
  end
end
