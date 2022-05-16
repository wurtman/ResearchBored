class Profile < ApplicationRecord
  belongs_to :account, optional: true
  validates :name, presence: true, length: {minimum: 3, maximum: 42}

  def self.marketing_preferences
    {
      newsletter: 'Subscribe to newsletter (we will spam you)',
      courses: 'Subscribe to our private bookmark collection',
      surveys: 'Get and extended warranty for your car',
    }
  end

  def self.report_preferences
    {
      weekly: 'Every week',
      monthly: 'Every month',
      yearly: 'Every year',
      never: 'Never',
    }
  end

end
