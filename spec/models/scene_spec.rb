require 'rails_helper'

RSpec.describe Scene, type: :model do
    it {should belong_to(:play)}
    it {should have_many(:speeches)}
    it {should have_many(:roles)}
end
