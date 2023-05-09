class CourseService
  class << self
    def create_course(params)
      course = Course.create(name: params[:name], description: params[:description], institution_id: params[:institution_id])
      School::Entities::Course.represent(course)
    end

    def list(params)
      courses = Course.all
      courses = Course.where("name LIKE ? OR id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      School::Entities::Course.represent(courses)
    end

    def update_course(params)
      course = Course.find(params[:id])
      course.name = params[:name] if params[:name].present?
      course.description = params[:description] if params[:description].present?
      course.institution_id = params[:institution_id] if params[:institution_id].present?
      course.save
      School::Entities::Course.represent(course)
    end

    def delete_course(params)
      course = Course.find(params[:id])
      course.destroy
      "Sucess"
    end
  end
end
