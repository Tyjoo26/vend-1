require 'rails_helper'

describe "As a user" do
  context "when i viist a specific snack page" do
    it "displays the name of that snack, price, list of locations with machines that carry that snack, and the average price for snacks in those machines and displays the count of different kinds of items in the machine" do
      owner = Owner.create(name: "Sam's Snacks")

      vitos = owner.machines.create(location: "Vito's Laundromat")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snickers_1 = Snack.create(name: "Snickers", price: 1.25)
      twix_1 = Snack.create(name: "Twix", price: 1.95)

      machine_snack_1 = MachineSnack.create(machine_id: dons.id, snack_id: snickers_1.id )
      machine_snack_2 = MachineSnack.create(machine_id: dons.id, snack_id: twix_1.id )

      snickers_2 = Snack.create(name: "Snickers", price: 1.35)
      twix_2 = Snack.create(name: "Twix", price: 1.75)

      machine_snack_3 = MachineSnack.create(machine_id: vitos.id, snack_id: snickers_2.id )
      machine_snack_4 = MachineSnack.create(machine_id: vitos.id, snack_id: twix_2.id )

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
