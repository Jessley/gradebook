module GradesHelper

  def student_grades
    result = "<table>"
    student= Student.find(session[:user_id])
    if student
      student.grades.each do |i|
        result << "<tr>"
        result << "<td>#{i.grade}</td>"
        result << "</tr>"
      end
      result << "</table>"
    end
    result.html_safe
  end
  
end
