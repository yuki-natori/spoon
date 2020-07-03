require 'rails_helper'

describe Item do
  describe '#create' do
    it "name、price、description、shipping_from、days_before_shipping、shipping_methodが存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "nameが空では登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "priceが空では登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "descriptionが空では登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "shipping_fromが空では登録できないこと" do
      item = build(:item, shipping_from: nil)
      item.valid?
      expect(item.errors[:shipping_from]).to include("can't be blank")
    end

    it "days_before_shippingが空では登録できないこと" do
      item = build(:item, days_before_shipping: nil)
      item.valid?
      expect(item.errors[:days_before_shipping]).to include("can't be blank")
    end

    it "shipping_methodが空では登録できないこと" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("can't be blank")
    end

    it "nameが41文字以上は登録できないこと" do
      item = build(:item, name: "41字以上")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 41 characters)")
    end
  end
end