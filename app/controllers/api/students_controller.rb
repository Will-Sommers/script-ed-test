class Api::StudentsController < Api::ApiController

  def index
    @students = GoogleSpreadsheet.new("students").get_students
  end

  def show
    @student = GoogleSpreadsheet.new("students").get_student(params[:id])
  end
end
