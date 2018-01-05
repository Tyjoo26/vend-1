require 'rails_helper'

RSpec.describe Snack, type: :model do
  context "Validations" do
    it "cant save a snack without a machine" do
      snack = Snack.new(name: "Snickers", price: 1.95)

      expect(snack).to_not be_valid
    end
  end
end
