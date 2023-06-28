class StudentService
  class << self
    def create_student(params)
      student = Student.create(params.except!(:authenticity_token))
      School::Entities::Student.represent(student)
    end

    def list(params)
      students = Student.all
      students = Student.where("name LIKE ? OR id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      School::Entities::Student.represent(students)
    end

    def update_student(params)
      student = Student.find(params[:id])
      student.team_id = params[:team_id] if params[:team_id].present?
      student.name = params[:name] if params[:name].present?
      student.email = params[:email] if params[:email].present?
      student.birthday = params[:birthday] if params[:birthday].present?
      student.save
      School::Entities::Student.represent(student)
    end

    def delete_student(params)
      student = Student.find(params[:id])
      student.destroy
      "Sucess"
    end
  end
end
