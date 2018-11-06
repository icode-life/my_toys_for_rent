class Toy < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence:true, inclusion: { in: ["princess","adventure","love","wood"]}
  validates :price, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
