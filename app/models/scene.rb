class Scene < ActiveRecord::Base
  belongs_to :play
  has_many :speeches
  has_many :roles, through: :speeches
end
