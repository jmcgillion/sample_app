class User < ActiveRecord::Base
  has_many :notes
  has_many :folders
  has_many :posts
  has_many :comments

  has_many :user_favorites
  has_many :favorites, through: :user_favorites, source: :question

  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}

  def following?(other_user)
      relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
      self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
      self.relationships.find_by_followed_id(other_user.id).destroy
  end

  def feed
    Post.from_users_followed_by(self)
  end
end




















