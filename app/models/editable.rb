class Editable < ApplicationRecord
  
  validates :shortname, presence: true, uniqueness: true, length: {minimum: 3, maximum: 120}
  validates_format_of :shortname, with: /\A[-_A-Za-z0-9]+\z/, message: "invalid : alphanumeric characters only"

end
