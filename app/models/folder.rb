class Folder < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'

  has_many :posts

  has_ancestry

  has_many :note_folders
  has_many :notes, through: :note_folders

  validates :name, presence: true
end













