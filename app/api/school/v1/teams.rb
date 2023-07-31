class School::V1::Teams < Grape::API
  resource :create do
    desc "Create Teams"
    params do
      requires :name, type: String
      requires :course_id, type: Integer
    end

    post "", http_codes: [
               [201, "Ok"],
               [401, "Unauthorized"],
               [404, "Not Found"],
               [500, "Internal Server Error"],
             ] do
      TeamService.create_team(params)
    end
  end
  resource :list do
    desc "Get Teams"
    params do
      optional :search, type: String
    end

    get "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      TeamService.list(params)
    end
  end
  resource :get_teams_by_course_id do
    desc "Get Teams"
    params do
      requires :course_id, type: Integer
      optional :search, type: String
    end

    get "", http_codes: [
      [201, "Ok"],
      [401, "Unauthorized"],
      [404, "Not Found"],
      [500, "Internal Server Error"],
    ] do
      TeamService.get_teams_by_course_id(params)
    end
  end
  resource :update do
    desc "Update Teams"
    params do
      requires :id, type: Integer
      optional :course_id, type: Integer
      optional :name, type: String
    end

    put "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      TeamService.update_team(params)
    end
  end
  resource :delete do
    desc "Delete Teams"
    params do
      requires :id, type: Integer
    end

    delete "", http_codes: [
                 [201, "Ok"],
                 [401, "Unauthorized"],
                 [404, "Not Found"],
                 [500, "Internal Server Error"],
               ] do
      TeamService.delete_team(params)
    end
  end
end
