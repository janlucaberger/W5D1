class Goal < ApplicationRecord

  validates :title, :details, :user_id, presence: true
  validates :private, :completed, inclusion: {in: [true, false]}

  belongs_to :user

  has_many :comments,
    foreign_key: :goal_id,
    class_name: :GoalComment

end
