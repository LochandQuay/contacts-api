class AddCommentable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :subject_id, null: false
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :comments, :author_id
    add_index :comments, :subject_id

  end
end
