class AddUserRefToCourses < ActiveRecord::Migration[5.0]
  def change
    add_reference :courses, :created_by, references: :users, index: true
    add_foreign_key :courses, :users, column: :created_by
  end
end
