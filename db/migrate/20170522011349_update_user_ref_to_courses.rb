class UpdateUserRefToCourses < ActiveRecord::Migration[5.0]
  def change
    remove_reference :courses, :created_by, references: :users, index: true
    remove_foreign_key :courses, column: :created_by
    
    add_reference :courses, :users, foreign_key: true
  end
end
