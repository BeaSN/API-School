class School::Entities::Quiz < Grape::Entity
  expose :name
  expose :description
  expose :team_id
end
