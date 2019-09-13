class Shift < ApplicationRecord
  belongs_to :user

  validates :start, presence: true
  validates :finish, presence: true
  validates :break_length, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :finish_after_start
  validate :finish_equal_start

  # t.integer :user_id
  #   t.date :shift_date
  #   t.time :start
  #   t.time :finish
  #   t.integer :break_length
  private
  def finish_after_start
    return if start.blank? || finish.blank?
    
    if finish < start
        errors.add(:finish, "time must be after the start time.")
    end
  end

  def finish_equal_start
    return if start.blank? || finish.blank?
    
    if finish == start
        errors.add(:finish, "and Start time cannot be equal.")
    end
  end

end
