module GradesHelper

  def student_grades
    result = "<table>"
    if session[:user_type]== "student"
    student= Student.find(session[:user_id])
    if student
      student.grades.each do |i|
        result << "<tr>"
        result << "<td>#{i.grade}</td>"
        result << "</tr>"
      end
      result << "</table>"
     end
   elsif session[:user_type] == "parent"
      parent = Parent.find(session[:user_id])
      student = parent.students.first
      student.grades.each do |i|
        result << "<tr>"
        result << "<td>#{i.grade}</td>"
        result << "</tr>"
      end
      result << "</table>"
    elsif session[:user_type] == "teacher"
      result << "<p>"
      Student.all.each do |i|
        i.grades.each do |g|
        result << "#{link_to "#{i.name} received a #{g.grade} on the #{g.grade_type} for #{g.date}.", edit_grade_path(g)}"
        result << "</p>"
        end
      end
    end
    result.html_safe
  end
end
