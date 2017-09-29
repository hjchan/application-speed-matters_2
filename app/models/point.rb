class Point < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :label, presence: true

  after_create :add_points

  def add_points
    self.user.update(sum_point: self.user.total_points + value)
  end
end
