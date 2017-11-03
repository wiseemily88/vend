require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the name and price of all the snacks for that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = Snack.create(name: "White Castle Burger", price: 3.50)
    snack_2 = Snack.create(name: "Pop Rocks", price: 1.50)
    snack_3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)
    snack_1.snack_machines.create(:machine_id => dons)
    snack_2.snack_machines.create(:machine_id => dons)
    snack_3.snack_machines.create(:machine_id => dons)

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content("Pop Rocks: $1.50")
    expect(page).to have_content("Flaming Hot Cheetos: $2.50")
  end



end
