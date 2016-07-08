class User < ActiveRecord::Base
  has_many :categories
  #User.first.books_added show book title & author that User added in Category
  has_many :books_added, through: :categories, source: :book
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :alias, :email, presence: true

end


#User.first.categories - Shows "playlist" of all books added with category
#Category.where(status:"current") - Shows all "playlists" where status is current

