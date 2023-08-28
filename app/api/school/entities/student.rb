class School::Entities::Student < Grape::Entity
  expose :team_id
  expose :name
  expose :email
  expose :password
  expose :birthday
  expose :id
end
