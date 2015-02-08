module ParentsHelper
  def all_parents
    result = "<table>"
    if session[:user_type] == "teacher"
      teacher= Teacher.find(session[:user_id])
      teacher.parents.each do |p|
        result << "<tr>"
        result << "<td>#{link_to p.parent_name, edit_parent_path(p)}</td>"
        result << "</tr>"
      end
      result << "</table>"
    elsif session[:user_type] == "student"
      result << "You do not have permission to view that page"
      result << "<td>#{link_to "Home", root_path}</td>"
    elsif session[:user_type] == "parent"
      result << "You do not have permission to view that page"
      result << "<td>#{link_to "Home", root_path}</td>"
    end
    result.html_safe
  end
end
