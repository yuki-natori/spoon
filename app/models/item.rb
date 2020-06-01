class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :price,
    presence: true

  validates :description,
    presence: true
end
