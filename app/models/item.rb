class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :interesteds, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 1}
  validates :category, presence: true

  def interested_by?(user)
    interesteds.exists?(user_id: user.id)
  end
end
