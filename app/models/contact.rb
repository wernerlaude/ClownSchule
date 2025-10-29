class Contact < ApplicationRecord
  acts_as_textcaptcha api_key: nil,
                      raise_errors: false,
                      cache_expiry_minutes: 2,
                      questions: [
                        { "question" => "Alle meine Entchen, schwimmen auf dem...", "answers" => "See" },
                        { "question" => "Welche Zahl kommt vor der Zwölf?", "answers" => "11,elf" },
                        { "question" => "Die nächste Zahl der Serie: 10, 11, 12, 13, 14, ..",
                          "answers" => "15, fünfzehn" },
                        { "question" => "Wie lautet der erste Monat des Jahres?", "answers" => "Januar" },
                        { "question" => "Was ist das Gegenteil von oben?", "answers" => "unten" },
                        { "question" => "Wieviel ist fünfzehn geteilt durch drei?", "answers" => "5,fünf" },
                        { "question" => "Wieviel Jahre dauerte der 30 jähige Krieg?", "answers" => "30" }
                      ]

  attr_accessor :name, :email, :telefon, :betreff, :message, :textcaptcha_answer, :textcaptcha_key

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, presence: true
end
