# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Contact,
    dependent: :destroy

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ContactShare,
    dependent: :destroy

  # set of contacts that have been shared with a user
  # NOT the set of contacts that a user has shared with others
  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :authored_comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment

  has_many :comments, as: :commentable
end
