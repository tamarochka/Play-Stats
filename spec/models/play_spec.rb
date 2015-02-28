require 'rails_helper'

RSpec.describe Play, type: :model do

    it {should validate_presence_of(:title)}
    it {should have_many(:scenes)}
    it {should have_many(:roles)}
end
