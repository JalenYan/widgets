class Widget < ApplicationRecord
  belongs_to :manufacturer

  def self.fresh = self.where(status: "fresh")

  def user_facing_identifier
    id_as_string = self.id.to_s
    if id_as_string.length < 3
      id_as_string
    else
      "%{first}.%{last_two}" % {
        first: id_as_string[0..-3],
        last_two: id_as_string[-2..-1]
      }
    end
  end
end
