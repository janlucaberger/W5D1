class Goal < ApplicationRecord

  validates :title, :details, :user_id, presence: true
  validates :private, :completed, inclusion: {in: [true, false]}

  belongs_to :user

end
