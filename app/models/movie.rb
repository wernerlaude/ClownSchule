class Movie < ApplicationRecord
  validates :slug, presence: true

  def to_param
    return nil unless persisted?
    "#{id}-#{slug}"
  end
end
