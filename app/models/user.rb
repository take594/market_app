class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :interesteds, dependent: :destroy
  validates :name, presence: true

  def own?(object)
    object.user_id == self.id
  end
end
