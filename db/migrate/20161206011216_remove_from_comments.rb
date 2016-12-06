class RemoveFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :subject_id
  end
end
