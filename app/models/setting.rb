# Only one row for this record, in order to handle global (but dynamic) settings,
# Like the website title (for SEO) or website description (also for SEO)
class Setting < ApplicationRecord
  before_create :only_one_row

  validates :clock_diff, presence: true, numericality: { only_integer: true }

  private
  
  def only_one_row
    raise "You can create only one row of this table" if Setting.count > 0
  end

end
