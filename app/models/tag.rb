class Tag < ApplicationRecord
  
  validates :shortname, presence: true, uniqueness: true
  validates_format_of :shortname, with: /\A[-_A-Za-z0-9]+\z/, message: "invalid : alphanumeric characters only"

  validates :display_name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 80}
  validates_format_of :display_name, with: /\A[a-zA-Z0-9\s]+\z/i, message: "invalid : can only contain letters, spaces, and numbers."

  # Many-to-many relationship between tags and articles
  has_many :markers
  has_many :articles, through: :markers, dependent: :delete_all

end
