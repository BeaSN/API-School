class StudentsController < ApplicationController
  before_action :connection_api
  layout "container"

  def destroy
    response = @connection.delete("delete", { id: params[:id].to_i })
    render json: [title: "", content: ""]
  end

  def new
    @student = Student.new
    team = Team.find(params[:relation_id])
    @student.team_id = team.id
    @action = "create"
    render "students/form/form"
  end

  def edit
    @student = Student.find(params[:id])
    @action = "update"
    render "students/form/form"
  end

  def create
    response = @connection.post("create", JSON.parse(params[:student].to_json))
    if response.success?
      render json: [title: "Success", content: "Student Created"]
    else
      error = JSON.parse(response.body)["error"].split("<br/>").first
      arr = error.split(":")
      title = arr.first
      errors = arr.second.split(", ")

      render json: {error: [title: title, errors: errors]}, status: :unprocessable_entity
    end
  end

  def update
    response = @connection.put("update", JSON.parse(params[:student].to_json))
    if response.success?
      render json: [title: "Success", content: "Student Updated"]
    else
      error = JSON.parse(response.body)["error"].split("<br/>").first
      arr = error.split(":")
      title = arr.first
      errors = arr.second.split(", ")

      render json: {error: [title: title, errors: errors]}, status: :unprocessable_entity
    end
  end

  private

  def connection_api
    base_url = "#{root_url}api/school/v1/students"
    @connection = Faraday.new(url: base_url)
  end
end
