# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  def initialize(subtitle:, title:, card_text:, url:, label:, img:, alt:)
    @subtitle = subtitle
    @title = title
    @card_text = card_text
    @url = url
    @label = label
    @img = img
    @alt = alt
  end

end
