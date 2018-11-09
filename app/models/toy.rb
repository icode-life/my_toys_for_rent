class Toy < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence:true, inclusion: { in: ["Babies","Games", "Babydoll", "Heroes", "Puzzle"]}
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
