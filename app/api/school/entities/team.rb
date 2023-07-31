class School::Entities::Team < Grape::Entity
  expose :id
  expose :course_id
  expose :name
  expose :institution, :using => "School::Entities::Team::Institution"
  expose :course, :using => "School::Entities::Team::Course"
  expose :students, :using => "School::Entities::Student"
  expose :quizzes, :using => "School::Entities::Quiz"

  class Institution < Grape::Entity
    expose :name
    expose :address
    expose :phone
    expose :color_1
    expose :color_2
    expose :color_3
    expose :color_4
  end

  class Course < Grape::Entity
    expose :name
    expose :description
  end
end
