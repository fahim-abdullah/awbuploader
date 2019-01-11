class Record < ApplicationRecord
	has_one_attached :file
	after_create :set_filename


	def set_filename
	    if self.file.attached?
	      self.file.blob.update(filename: "#{self.awbnum}.#{self.file.filename.extension}")
	    end
  	end
end
