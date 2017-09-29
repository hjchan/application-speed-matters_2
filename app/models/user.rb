class User < ActiveRecord::Base
  has_many :points

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username,
            presence: true,
            length: { minimum: 2, maximum: 32 },
            format: { with: /^\w+$/, multiline: true },
            uniqueness: { case_sensitive: false }

  validates :email,
            presence: true,
            format: { with: /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i, multiline: true },
            uniqueness: { case_sensitive: false }

  def self.by_total_points
    # joins(:points).group('users.id').order('SUM(points.value) DESC')
    where.not(sum_point: nil).order(sum_point: :desc)
  end

  def total_points
    if sum_point == nil || sum_point == 0
      self.update(sum_point: self.points.sum(:value))
      sum_point
    else
      sum_point
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
