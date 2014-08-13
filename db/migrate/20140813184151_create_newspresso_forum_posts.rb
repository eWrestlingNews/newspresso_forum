class CreateNewspressoForumPosts < ActiveRecord::Migration
  def change
    create_table :newspresso_forum_posts do |t|
      t.references :topic
      t.text :text
      t.references :user
      t.timestamps
    end
  end
end
