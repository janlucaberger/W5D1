class UserComment < ApplicationRecord
  validates :author_id, :body, :commentee_id, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :commentee,
    foreign_key: :commentee_id,
    class_name: :User
end
