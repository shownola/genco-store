class Product < ApplicationRecord

    mount_uploader :image
    # serialize :image, JSON  # If using SQLite
    belongs_to :user, optional: true

  validates :name, :price, :cost, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 1500, too_long: "%{count} characters allowed" }
  validates :name, length: {maximum: 140, too_long: "%{count} characters allowed"}
  validates :price, numericality: {only_decimal: true}, length: {maximum: 7}
  validates :uses, presence: true, length: {maximum: 1500}




end
