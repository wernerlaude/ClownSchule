class Movie < ApplicationRecord
  def to_param
    return nil unless persisted?

    [id, slug].join('-')
  end
end
