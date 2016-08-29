class User < ActiveRecord::Base
  has_many :notes
  has_many :folders
  has_many :posts

 has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}
end












