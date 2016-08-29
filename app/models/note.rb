class Note < ActiveRecord::Base
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :note_folders
  has_many :folders, through: :note_folders


  validates :subject, presence: true
  validates :body, presence: true

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("body LIKE ?", "%#{search_term}%").order("created_at DESC")
  end
end































