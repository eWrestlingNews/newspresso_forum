class AddFieldsToNewspressoForumComments < ActiveRecord::Migration
  def self.up
    add_column :newspresso_forum_comments, :sash_id, :integer
    add_column :newspresso_forum_comments, :level, :integer, :default => 0
  end

  def self.down
    remove_column :newspresso_forum_comments, :sash_id
    remove_column :newspresso_forum_comments, :level
  end
end
