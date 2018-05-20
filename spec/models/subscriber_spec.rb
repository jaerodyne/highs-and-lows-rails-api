require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  it "is valid with an email address" do
  	subscriber = FactoryBot.build(:subscriber, email: "jsbetaoption@example.com")
  	expect(subscriber).to be_valid
  end
  it "is invalid without an email address" do
  	subscriber = FactoryBot.build(:subscriber, email: nil)
  	subscriber.valid?
  	expect(subscriber.errors[:email]).to include("can't be blank")
  end
  it "is invalid without a unique email address" do
  	subscriber1 = FactoryBot.create(:subscriber)
  	subscriber2 = FactoryBot.build(:subscriber)
  	subscriber2.valid?
  	expect(subscriber2.errors[:email]).to include("has already been taken")
  end
  it "is invalid without a properly formatted email" do
  	subscriber = FactoryBot.build(:subscriber, email: "user@")
  	subscriber.valid?
  	expect(subscriber.errors[:email]).to include("is invalid")
  end
end
