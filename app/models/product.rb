class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items
  mount_uploader :image
    # serialize :image, JSON  # If using SQLite


  validates :name, :price, :cost, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 1500, too_long: "%{count} characters allowed" }
  validates :name, length: {maximum: 140, too_long: "%{count} characters allowed"}
  validates :price, numericality: {only_decimal: true}, length: {maximum: 7}
  validates :uses, presence: true, length: {maximum: 1500}


  private

    def not_referenced_by_any_line_item
      unless line_item.empty?
        errors.add(:base, 'Line items present')
        throw :abort
      end
    end 




end
