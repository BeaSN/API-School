class School::Entities::Institution < Grape::Entity
  expose :name
  expose :address
  expose :phone
  expose :courses, :using => "School::Entities::Course"
  expose :id
  expose :color_1
  expose :color_2
  expose :color_3
  expose :color_4
end
