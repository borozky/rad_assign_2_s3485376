class AddVoteResetsToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :vote_resets, :integer, default: 0
    add_column :courses, :last_vote_reset, :datetime, default: Time.now
  end
end
