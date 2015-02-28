require 'rails_helper'

RSpec.describe Speech, type: :model do
    it {should belong_to(:scene)}
    it {should belong_to(:role)}
    it {should have_many(:lines)}
end
