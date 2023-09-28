class School::V1::Institutions < Grape::API
  resource :create do
    desc "Create Institutions"
    params do
      requires :name, type: String
      requires :address, type: String
      requires :phone, type: String
      requires :color_1, type:String
      requires :color_2, type:String
      requires :color_3, type:String
      requires :color_4, type:String
    end

    post "", http_codes: [
               [201, "Ok"],
               [401, "Unauthorized"],
               [404, "Not Found"],
               [500, "Internal Server Error"],
             ] do
      InstitutionService.create_institution(params)
    end
  end
  resource :list do
    desc "Get Institutions"
    params do
      optional :search, type: String
    end

    get "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      InstitutionService.list(params)
    end
  end
  resource :update do
    desc "Update institutions"
    params do
      requires :id, type: Integer
      optional :name, type: String
      optional :address, type: String
      optional :phone, type: String
      optional :color_1, type:String
      optional :color_2, type:String
      optional :color_3, type:String
      optional :color_4, type:String
    end

    put "", http_codes: [
              [201, "Ok"],
              [401, "Unauthorized"],
              [404, "Not Found"],
              [500, "Internal Server Error"],
            ] do
      InstitutionService.update_institution(params)
    end
  end
  resource :delete do
    desc "Delete Institutions"
    params do
      requires :id, type: Integer
    end

    delete "", http_codes: [
                 [201, "Ok"],
                 [401, "Unauthorized"],
                 [404, "Not Found"],
                 [500, "Internal Server Error"],
               ] do
      InstitutionService.delete_institution(params)
    end
  end
end
