class School::V1::Students < Grape::API
  resource :create do
    desc "Create Students"
    params do
      requires :name, type: String
      requires :email, type: String
      requires :birthday, type: Date
      requires :team_id, type: Integer
    end

    post "", http_codes: [
               [201, "Ok"],
               [401, "Unauthorized"],
               [404, "Not Found"],
               [500, "Internal Server Error"],
             ] do
      StudentService.create_student(params)
    end
  end
  resource :list do
    desc "Get Students"
    params do
      optional :search, type: String
    end

    get "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      StudentService.list(params)
    end
  end
  resource :update do
    desc "Update Students"
    params do
      requires :id, type: Integer
      optional :team_id, type: Integer
      optional :name, type: String
      optional :email, type: String
      optional :birthday, type: Date
    end

    put "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      StudentService.update_student(params)
    end
  end
  resource :delete do
    desc "Delete Students"
    params do
      requires :id, type: Integer
    end

    delete "", http_codes: [
                 [201, "Ok"],
                 [401, "Unauthorized"],
                 [404, "Not Found"],
                 [500, "Internal Server Error"],
               ] do
      StudentService.delete_student(params)
    end
  end
end
