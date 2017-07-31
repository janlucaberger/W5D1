class GoalComment < ApplicationRecord
  validates :author_id, :body, :goal_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :goal,
    foreign_key: :goal_id,
    class_name: :Goal
end
