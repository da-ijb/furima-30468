require 'rails_helper'

RSpec.describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録/商品情報' do
    it "商品画像を1枚つけることが必須であること" do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
    end  
    
    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")     
    end  

    
    it "商品の説明が必須であること" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")     
    end  
    
    it "カテゴリーの情報が必須であること" do
      @item.categories_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Categories can't be blank")     
    end

    it "カテゴリーの情報が必須であること" do
      @item.categories_id = 1
      @item.valid?     
      expect(@item.errors.full_messages).to include("Categories must be other than 1")     
    end 
    
    it "商品の状態についての情報が必須であること" do
      @item.states_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("States can't be blank")     
    end

    it "商品の状態についての情報が必須であること" do
      @item.states_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("States must be other than 1")     
    end  
    
    it "配送料の負担についての情報が必須であること" do
      @item.delivery_charges_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charges can't be blank")     
    end  

    it "配送料の負担についての情報が必須であること" do
      @item.delivery_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charges must be other than 1")     
    end  
    
    it "発送元の地域についての情報が必須であること" do
      @item.shipment_sources_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment sources can't be blank")     
    end  

    it "発送元の地域についての情報が必須であること" do
      @item.shipment_sources_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment sources must be other than 1")     
    end  
    
    it "発送までの日数についての情報が必須であること" do
      @item.days_to_ships_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ships can't be blank")     
    end  

    it "発送までの日数についての情報が必須であること" do
      @item.days_to_ships_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ships must be other than 1")     
    end  
    
    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")     
    end  
    
    it "価格の範囲が、¥300~¥9,999,999の間であること" do     
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")     
    end 
    
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")     
    end 
    
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end  
  end  
end
