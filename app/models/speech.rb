class Speech < ActiveRecord::Base
  belongs_to :scene
  belongs_to :role
  has_many :lines
end
