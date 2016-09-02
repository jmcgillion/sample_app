class Avatar < ActiveRecord::Base
  has_attached_file :avatar, style: {
    medium: '300x300>'
    small: '140x140>'
    thumb: '64x64!'
  }
  
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end

# source: treehouse tutorial -- attaching files in rails as well as paperclip documentation and stackoverflow -- error messages ...





