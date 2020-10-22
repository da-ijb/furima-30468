class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                  null: false                    
      t.text :description,             null: false
      t.integer :categories_id,        null: false 
      t.integer :states_id,            null: false            
      t.integer :delivery_charges_id,  null: false                    
      t.integer :shipment_sources_id,  null: false                    
      t.integer :days_to_ships_id,     null: false                    
      t.integer :price,                null: false                    
      t.references :user,              null: false, foreign_key: true 
      t.timestamps
    end
  end
end
