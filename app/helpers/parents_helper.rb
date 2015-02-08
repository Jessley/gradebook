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
      redirect_to root_path, notice: "You do not have permission to view that page"
    elsif session[:user_type] == "parent"
      redirect_to root_path, notice: "You do not have permission to view that page"
    end
    result.html_safe
  end
end
