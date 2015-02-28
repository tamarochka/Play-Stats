require 'rails_helper'

RSpec.describe Line, type: :model do
    it {should belong_to(:speech)}
    it {should have_one(:role)}
    it {should validate_presence_of(:body)}
end
