class Book < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  #Book.first.users_adding shows User info.
  has_many :users_adding, through: :categories, source: :user
  validates :title, :author, presence: true

end
