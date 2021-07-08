class MitumoriImage < ApplicationRecord
    mount_uploader :image, MitumoriImageUploader
end
