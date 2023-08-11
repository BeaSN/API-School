class StudentController < ApplicationController
  before_action :connection_api

  def destroy
    response = @connection.get("delete", { id: params[:id].to_i })
    @teams = JSON.parse(response.body)
    flash[:notice] = 'Ação concluída com sucesso!'
    render js: "showToast('#{flash[:notice]}')"
  end

  private

  def connection_api
    base_url = "#{root_url}/api/school/v1/students"
    @connection = Faraday.new(url: base_url)
  end
end