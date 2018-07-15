require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'creation' do
    before do
      @category = Category.create(name: "He.he", description: "He")
    end
    it 'can be created' do
      expect(@category).to be_valid
    end

    it 'cannot be created without a name' do
      @category.name = ''
      expect(@category).to_not be_valid
    end

    it 'cannot be created if name has less than 2 words' do
      @category.name = 'Mo'
      expect(@category).to_not be_valid
    end

    it 'cannot be created if name has more than 2 letter in words' do
      @category.name = 'Mother.Fu'
      expect(@category).to_not be_valid
    end

    it "cannot be created if name has not have dot" do
      @category.name = 'Mo Fu'
      expect(@category).to_not be_valid
    end

    it "cannot be created if first letter in name is small" do
      @category.name = 'mo.Fu'
      expect(@category).to_not be_valid
    end
  end
end
