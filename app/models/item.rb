class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :days
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: {greater_than: 299,less_than: 10000000}
    with_options numericality: { other_than:1 } do
      validates :category_id
      validates :status_id
      validates :shipping_id
      validates :area_id
      validates :days_id
    end
  end
end
