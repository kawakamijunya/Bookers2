class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy

  has_one_attached :profile_image
  
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20} #空でない、一意性を持たせ、かつ2～20文字の範囲で設定
  validates :introduction, length: {maximum: 50} #最大50文字までに設定

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end
end
