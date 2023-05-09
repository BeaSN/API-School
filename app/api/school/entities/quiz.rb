class School::Entities::Quiz < Grape::Entity
  expose :name
  expose :description
  expose :course_id
end
