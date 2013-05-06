class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title, :user
  validates_presence_of :title
  validates_presence_of :body
end
