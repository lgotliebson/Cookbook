require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    
    test "should only have one category with the same name" do 
        @categories = Category.new(:name =>"Breakfast")
        @category.valid?
        assert @category.errors[:name].include?("must be unique")
    
    end
end
