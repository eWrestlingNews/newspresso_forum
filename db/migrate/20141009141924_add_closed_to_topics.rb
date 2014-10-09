class AddClosedToTopics < ActiveRecord::Migration
  def change
    add_column :newspresso_forum_topics, :closed, :bool
  end
end
