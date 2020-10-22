class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one_attached :image

  validates :categories_id, :states_id, :delivery_charges_id, :shipment_sources_id, :days_to_ships_id, :image, presence: true
  
  validates :categories_id, :states_id, :delivery_charges_id, :shipment_sources_id, :days_to_ships_id, numericality: { other_than: 1 }
end
