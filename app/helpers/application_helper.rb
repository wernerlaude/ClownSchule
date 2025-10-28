module ApplicationHelper
  def inline_svg(filename, options = {})
    file_path = Rails.root.join("app", "assets", "images", filename)

    if File.exist?(file_path)
      svg = File.read(file_path)

      # Optional: CSS-Klassen hinzufügen
      if options[:class].present?
        svg.sub("<svg", "<svg class='#{options[:class]}'").html_safe
      else
        svg.html_safe
      end
    else
      "<!-- SVG #{filename} not found -->"
    end
  end
end
