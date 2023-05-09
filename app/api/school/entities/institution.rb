class School::Entities::Institution < Grape::Entity
  expose :name
  expose :address
  expose :phone
  expose :courses, :using => "School::Entities::Course"
end
