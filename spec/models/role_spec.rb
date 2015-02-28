require 'rails_helper'

RSpec.describe Role, type: :model do
    it {should validate_presence_of(:name)}
    it {should have_many(:scenes)}
    it {should have_many(:speeches)}
    it {should have_many(:lines)}
    it {should belong_to(:play)}
end
