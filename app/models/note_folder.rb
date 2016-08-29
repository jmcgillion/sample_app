class NoteFolder < ActiveRecord::Base
  belongs_to :note
  belongs_to :folder
end

