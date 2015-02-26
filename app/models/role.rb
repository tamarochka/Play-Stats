class Role < ActiveRecord::Base
  belongs_to :play
  has_many :speeches
  has_many :lines, through: :speeches
end
