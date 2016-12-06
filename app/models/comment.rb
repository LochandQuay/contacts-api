# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  body             :string           not null
#  author_id        :integer          not null
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  validates :title, :body, :author_id, :commentable_id, :commentable_type, presence: true

  belongs_to :commentable, polymorphic: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  def self.comments_for_user_id(user_id)
    authored = User.find(user_id).authored_comments
    received = User.find(user_id).comments
    { authored: authored,
      received: received }
  end
end
