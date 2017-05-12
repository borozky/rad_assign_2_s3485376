require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  test "test that an empty category cannot be saved" do
    assert_not one.save
  end
  
  test "test that category name with nothing but spaces cannot be saved" do
    category = Category.new
    category.name = " "
    assert_not category.save
  end
  
  test "test that category with valid name can be saved" do 
    category = Category.new
    category.name = "webdev"
    assert category.save
  end
  
  test "test that category with nothing but numbers cannot be saved" do 
    category = Category.new
    category.name = 823324085
    assert_not category.save
  end
  
  test "test that category with nothing but special characters cannot be saved" do
    category = Category.new
    category.name = "!@##$%^^&&*()"
    assert_not category.save
  end
  
  test "test that alpha-numeric-spaces with ,:() categories can be saved" do
    category = Category.new
    category.name = "Software Tutorial 1: Part"
    assert category.save
  end
  
  test "test that categories with ^%$#@!*~[]{}+=\|` cannot be saved" do
    category = Category.new
    category.name = "^%$#@!*~[]{}+=\|"
    assert_not category.save
  end
  
  test "test cannot create category that already exists" do
    category = Category.new
    category.name = "Existing Category"
    assert category.save
    
    another_category = Category.new
    category.name = "Existing Category"
    assert_not category.save
  end
  
  test "test a category name is different from its former after modification" do
    category = Category.new
    category.name = "Category that will be modified"
    assert category.save
    previous_category_name = category.name
    
    category.name = "New category"
    assert category.save
    new_category_name = category.name
    
    assert_not_equal previous_category_name, new_category_name, "Modified categories must not be equal"
  end
  
end
