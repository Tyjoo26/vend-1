require 'rails_helper'


feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "I see the name of all of the snacks associated with that vending machine along with their price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snickers = Snack.create(name: "Snickers", price: 1.25)
    twix = Snack.create(name: "Twix", price: 1.95)

    machine_snack_1 = MachineSnack.create(machine_id: dons.id, snack_id: snickers.id )
    machine_snack_2 = MachineSnack.create(machine_id: dons.id, snack_id: twix.id )

    visit machine_path(dons)

    expect(page).to have_content(snickers.name)
    expect(page).to have_content("$1.25")

    expect(page).to have_content(twix.name)
    expect(page).to have_content("$1.95")

    expect(page).to have_content("Average Price: $1.60")
  end
end
