class Api::ClassesController < Api::ApiController

  def index
    @courses = GoogleSpreadsheet.new("classes").get_courses
  end

  def show
    @course = GoogleSpreadsheet.new("classes").get_course(params[:id])
  end
end
