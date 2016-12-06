# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  body             :string           not null
#  author_id        :integer          not null
#  subject_id       :integer          not null
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  validates :title, :body, :author_id, :subject_id, presence: true
  
  belongs_to :commentable, polymorphic: true

end
