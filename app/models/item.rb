class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :days
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    with_options numericality: { other_than:1 } do
      validates :category_id
      validates :status_id
      validates :shipping_id
      validates :area_id
      validates :days_id
    end
  end
end
