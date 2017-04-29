class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :thumbs_up
      t.belongs_to :user
      t.belongs_to :course

      t.timestamps
    end
  end
end
