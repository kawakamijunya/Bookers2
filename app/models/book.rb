class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user
  

  def get_profile_image
      unless profile_image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          profile_image.attache(io: File.open(file_path),filename: 'default-profile_image.jpg',content_type: 'profile_image/jpg')
      end
      profile_image
  end
end