class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :category_id, :state_id, :delivery_charge_id, :shipment_source_id, :days_to_ship_id, :price, :image, presence: true
  
  validates :category_id, :state_id, :delivery_charge_id, :shipment_source_id, :days_to_ship_id, numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9999999 
end  
