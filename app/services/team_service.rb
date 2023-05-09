class TeamService
  class << self
    def create_team(params)
      team = Team.create(name: params[:name], course_id: params[:course_id])
      School::Entities::Team.represent(team)
    end

    def list(params)
      teams = Team.all
      teams = Team.where("name LIKE ? OR id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      School::Entities::Team.represent(teams)
    end

    def update_team(params)
      team = Team.find(params[:id])
      team.name = params[:name] if params[:name].present?
      team.course_id = params[:course_id] if params[:course_id].present?
      team.save
      School::Entities::Team.represent(team)
    end

    def delete_team(params)
      team = Team.find(params[:id])
      team.destroy
      "Sucess"
    end
  end
end
