class Avatar < ActiveRecord::Base
  has_attached_file :avatar, style: {
    medium: '300x300>'
    small: '140x140>'
    thumb: '64x64!'
  }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end





