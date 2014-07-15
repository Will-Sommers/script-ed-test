class GoogleSpreadsheet

  TABLES = {students: 0, classes: 1}

  def initialize(table)
    session = GoogleDrive.login(ENV["GOOGLE_USERNAME"], ENV["GOOGLE_PASSWORD"])
    table_id = TABLES[table.to_sym]
    @ws = session.spreadsheet_by_key(ENV["SPREADSHEET_KEY"]).worksheets[table_id]
  end

  def build_student(id)
    row = id.to_i + 1
    student_hash =  {id: @ws[row, 1],
                     name: @ws[row, 2],
                     classes: @ws[row, 3].delete(",").split}
    return student_hash.has_value?("") ? false : student_hash
  end

  def get_students
    students = []
    for student_id in 1..@ws.num_rows
      student = build_student(student_id)
      unless student == false
        students << student
      end
    end
    return students
  end

  def get_student(id)
    build_student(id)
  end

  def build_course(id)
    row = id.to_i + 1
    course_hash = {id: @ws[row, 1],
                  name: @ws[row, 2],
                  time: @ws[row, 3]}
    return course_hash.has_value?("") ? false : course_hash
  end

  def get_courses
    courses= []
    for course_id in 1..@ws.num_rows
       course = build_course(course_id)
       unless course == false
          courses << course
       end
    end
    return courses
  end

  def get_course(id)
     build_course(id)
  end
end

