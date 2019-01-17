class Record < ApplicationRecord
	mount_uploader :doc, FileUploader
	# after_create :set_filename


	# def set_filename
	#     if self.file.attached?
	#       self.file.blob.update(filename: "#{self.awbnum}.#{self.file.filename.extension}")
	#     end
 #  	end
end
