class School::V1::Courses < Grape::API
  resource :create do
    desc "Create Courses"
    params do
      requires :name, type: String
      requires :description, type: String
      requires :institution_id, type: Integer
    end

    post "", http_codes: [
               [201, "Ok"],
               [401, "Unauthorized"],
               [404, "Not Found"],
               [500, "Internal Server Error"],
             ] do
      CourseService.create_course(params)
    end
  end
  resource :list do
    desc "Get Courses"
    params do
      optional :search, type: String
    end

    get "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      CourseService.list(params)
    end
  end
  resource :update do
    desc "Update Courses"
    params do
      requires :id, type: Integer
      optional :name, type: String
      optional :description, type: String
      optional :institution_id, type: Integer
    end

    put "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      CourseService.update_course(params)
    end
  end
  resource :delete do
    desc "Delete Courses"
    params do
      requires :id, type: Integer
    end

    delete "", http_codes: [
                 [201, "Ok"],
                 [401, "Unauthorized"],
                 [404, "Not Found"],
                 [500, "Internal Server Error"],
               ] do
      CourseService.delete_course(params)
    end
  end
end
