class InstitutionService
  class << self
    def create_institution(params)
      institution = Institution.create(name: params[:name], address: params[:address], phone: params[:phone])
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
      course.save
      School::Entities::Institution.represent(institution)
    end

    def delete_institution(params)
      institution = Institution.find(params[:id])
      institution.destroy
      "Sucess"
    end
  end
end
