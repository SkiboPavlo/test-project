require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      category = Category.create(name: "He.he", description: "He")
      @post = Post.create(name: "He.he", content: "He", category_id: category.id)
    end
    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a name' do
      @post.name = ''
      expect(@post).to_not be_valid
    end

    it 'cannot be created if name has less than 2 words' do
      @post.name = 'Mo'
      expect(@post).to_not be_valid
    end

    it 'cannot be created if name has more than 2 letter in words' do
      @post.name = 'Mother.Fu'
      expect(@post).to_not be_valid
    end

    it "cannot be created if name has not have dot" do
      @post.name = 'Mo Fu'
      expect(@post).to_not be_valid
    end

    it "cannot be created if first letter in name is small" do
      @post.name = 'mo.Fu'
      expect(@post).to_not be_valid
    end
  end
end
