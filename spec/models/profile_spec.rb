require 'rails_helper'

describe Profile do
  describe '#create' do
    it "zipcode、prefecture、city、blockが存在すれば登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it "zipcodeが空では登録できないこと" do
      profile = build(:profile, zipcode: nil)
      profile.valid?
      expect(profile.errors[:zipcode]).to include("can't be blank")
    end

    it "prefectureが空では登録できないこと" do
      profile = build(:profile, prefecture: nil)
      profile.valid?
      expect(profile.errors[:prefecture]).to include("can't be blank")
    end

    it "cityが空では登録できないこと" do
      profile = build(:profile, city: nil)
      profile.valid?
      expect(profile.errors[:city]).to include("can't be blank")
    end

    it "blockが空では登録できないこと" do
      profile = build(:profile, block: nil)
      profile.valid?
      expect(profile.errors[:block]).to include("can't be blank")
    end

    it "zipcodeが7文字以下の数字でなければ登録できないこと" do
      profile = build(:profile, zipcode: "1234567")
      profile.valid?
      expect(profile.errors[:zipcode]).to include("is too short (minimum is 7 characters)")
    end
  end
end