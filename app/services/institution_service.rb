class InstitutionService
  class << self
    def create_institution(params)
      institution = Institution.create(name: params[:name], address: params[:address], phone: params[:phone], color_1: params[:color_1], color_2: params[:color_2], color_3: params[:color_3], color_4: params[:color_4])
      School::Entities::Institution.represent(institution)
    end

    def list(params)
      institutions = Institution.all
      institutions = Institution.joins(:courses).where("courses.name LIKE ? OR institutions.name LIKE ? OR institutions.id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      School::Entities::Institution.represent(institutions)
    end

    def update_institution(params)
      institution = Institution.find(params[:id])
      institution.name = params[:name] if params[:name].present?
      institution.address = params[:address] if params[:address].present?
      institution.phone = params[:phone] if params[:phone].present?
      institution.color_1 = params[:color_1] if params[:color_1].present?
      institution.color_2 = params[:color_2] if params[:color_2].present?
      institution.color_3 = params[:color_3] if params[:color_3].present?
      institution.color_4 = params[:color_4] if params[:color_4].present?
      institution.save
      School::Entities::Institution.represent(institution)
    end

    def delete_institution(params)
      institution = Institution.find(params[:id])
      institution.destroy
      "Sucess"
    end
  end
end
