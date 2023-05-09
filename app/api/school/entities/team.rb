class School::Entities::Team < Grape::Entity
  expose :course_id
  expose :name
  expose :students, :using => "School::Entities::Student"
end
