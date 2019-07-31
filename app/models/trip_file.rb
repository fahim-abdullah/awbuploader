class TripFile < ApplicationRecord
	mount_uploader :doc, DocUploader
end
