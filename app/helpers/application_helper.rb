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

  def betreff_options(selected: nil)
    options = [
      ['Kurs "Entdecke den Clown in Dir"', "clown-entdecken"],
      ["KlinikClown Ausbildung", "klinikclown"],
      ["Clown Coaching", "coaching"],
      ["Performance Feedback", "feedback"],
      ["Allgemeine Frage", "allgemein"]
    ]

    options
  end

  def extract_youtube_id(url)
    # Unterstützt verschiedene YouTube URL Formate
    # https://www.youtube.com/watch?v=VIDEO_ID
    # https://youtu.be/VIDEO_ID
    # https://www.youtube.com/embed/VIDEO_ID

    regex = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/
    match = url.match(regex)
    match ? match[1] : nil
  end

  def format_link(link)
    # Falls du die bestehende format_link Methode brauchst
    link
  end

  def betreff_label(betreff)
    labels = {
      "clown-entdecken" => "Kurs: Entdecke den Clown in Dir",
      "klinikclown" => "KlinikClown Ausbildung",
      "coaching" => "Clown Coaching",
      "feedback" => "Performance Feedback",
      "allgemein" => "Allgemeine Anfrage"
    }

    labels[betreff] || betreff
  end
end
