module ApplicationHelper
  def format_link(content)
    "#{content} Video ansehen".html_safe
  end

  def current_class?(current_path)
    return 'active' if request.path == current_path

    ''
  end
end
