class AddFieldsToNewspressoForumTopics < ActiveRecord::Migration
  def self.up
    add_column :newspresso_forum_topics, :sash_id, :integer
    add_column :newspresso_forum_topics, :level, :integer, :default => 0
  end

  def self.down
    remove_column :newspresso_forum_topics, :sash_id
    remove_column :newspresso_forum_topics, :level
  end
end
