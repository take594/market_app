class Item < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 1}
  validates :category, presence: true

  def own?(object)
    object.user_id == self.id
  end
end
