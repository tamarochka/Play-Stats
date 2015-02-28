class Line < ActiveRecord::Base
  belongs_to :speech
  has_one :role, through: :speech
  validates :body, presence: true
end
