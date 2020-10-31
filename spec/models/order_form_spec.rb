require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入時の情報保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it "全ての情報があれば保存ができること" do
      expect(@order_form).to be_valid
    end

    it "tokenが空では登録できないこと" do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")   
    end  
    
    it 'postal_codeがハイフン無しだと保存できないこと' do
      @order_form.postal_code = "1111111"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid")   
    end  
    
    it 'postal_codeが全角入力だと保存できないこと' do
      @order_form.postal_code = "１１１ー１１１１"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid")   
    end  
    
    it 'prefecture_idが空だと保存できないこと' do
      @order_form.prefecture_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")  
    end  
    
    it 'prefecture_idが1だと保存できないこと' do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")   
    end  

    it 'municipalityが空だと保存できないこと' do
      @order_form.municipality = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Municipality can't be blank")  
    end  
    
    it 'addressが空だと保存できないこと' do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")  
    end  
    
    it 'phone_numberが空だと保存できないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")  
    end  
    
    it 'phone_numberが11桁でないと保存できないこと' do
      @order_form.phone_number = "123456789"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")   
    end  
    
    it 'phone_numberが全角入力だと保存できないこと' do
      @order_form.phone_number = "０９０１２３４５６７８"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")      
    end  

  end
end    