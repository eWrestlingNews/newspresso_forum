class CreateNewspressoForumTopics < ActiveRecord::Migration
  def change
    create_table :newspresso_forum_topics do |t|
      t.string :title
      t.text :body
      t.references :user
      t.timestamps
    end
  end
end
