class School::Entities::Student < Grape::Entity
  expose :team_id
  expose :name
  expose :email
  expose :birthday
end
