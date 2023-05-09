class School::Entities::Course < Grape::Entity
  expose :id
  expose :name
  expose :description
  expose :institution_id
  expose :teams, :using => "School::Entities::Team"
  expose :quizzes, :using => "School::Entities::Quiz"
end
