module StudentsHelper
  # Students who have logged in should be able to:
  # See their grades.
  def all_students
    result = "<table>"
    if session[:user_type] == "teacher"
      teacher= Teacher.find(session[:user_id])
      teacher.students.each do |s|
        result << "<tr>"
        result << "<td>#{link_to s.name, edit_student_path(s)}</td>"
        result << "<td>#{Parent.find(s.parent_id).parent_name}</td>"
        result << "</tr>"
      end
      result << "</table>"
    elsif session[:user_type] == "student"
      student = Student.find(session[:user_id])
      result << "<tr>"
      result << "<td>#{student.name}</td>"
      result << "</tr>"
      result << "</table>"
    elsif session[:user_type] == "parent"
      parent = Parent.find(session[:user_id])
      result << "<tr>"
      result << "<td>#{parent.students.first.name}</td>"
      result << "</tr>"
      result << "</table>"
    end
    result.html_safe
  end

end
