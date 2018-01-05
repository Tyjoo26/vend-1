require 'rails_helper'

describe "As a user" do
  context "when i viist a specific snack page" do
    it "displays the name of that snack, price, list of locations with machines that carry that snack, and the average price for snacks in those machines and displays the count of different kinds of items in the machine" do
      owner = Owner.create(name: "Sam's Snacks")

      vitos = owner.machines.create(location: "Vito's Laundromat")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snickers_1 = Snack.create(name: "Snickers", price: 1.25, machine: dons)
      twix_1 = Snack.create(name: "Twix", price: 1.95, machine: dons)

      snickers_2 = Snack.create(name: "Snickers", price: 1.35, machine: vitos)
      twix_2 = Snack.create(name: "Twix", price: 1.75, machine: vitos)

      visit snack_path(snickers_1)

      expect(page).to have_content(snickers_1.name)
      expect(page).to have_content(snickers_1.price)
      expect(page).to have_content("Vito's Laundromat")
      expect(page).to have_content("Don's Mixed Drinks")

      expect(page).to have_content("Average Price: $1.60")
      expect(page).to have_content("Average Price: $1.55")

      expect(page).to have_content("Snacks at this Machine: 2")
      expect(page).to have_content("Snacks at this Machine: 2")

    end
  end
end
