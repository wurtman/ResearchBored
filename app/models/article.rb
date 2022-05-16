class Article < ApplicationRecord
  
  validates :slug, presence: true, uniqueness: true
  validates_format_of :slug, with: /\A[-_A-Za-z0-9]+\z/, message: "invalid : alphanumeric characters only"

  validates :title, presence: true, uniqueness: true, length: {minimum: 5, maximum: 120}

  validates :image_url, allow_blank: true, format: { with: URI.regexp(%w[http https]), message: 'is not a valid URL' }

  # Many-to-many relationship between tags and articles
  has_many :markers
  has_many :tags, through: :markers

end
