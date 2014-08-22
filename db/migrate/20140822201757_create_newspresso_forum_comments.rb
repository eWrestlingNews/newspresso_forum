class CreateNewspressoForumComments < ActiveRecord::Migration
  def change
    create_table :newspresso_forum_comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
