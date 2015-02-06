module StudentsHelper
  # Students who have logged in should be able to:
  # See their grades.
  def all_students
    result = "<table>"
    teacher= Teacher.find(session[:user_id])
    if teacher
      teacher.students.each do |s|
        result << "<tr>"
        result << "<td>#{s.name}</td>"
        result << "<td>#{Parent.find(s.parent_id).parent_name}</td>"
        result << "</tr>"
      end
      result << "</table>"
    end
    result.html_safe
  end

end
