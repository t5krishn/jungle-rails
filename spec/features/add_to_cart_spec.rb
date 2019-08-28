require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do


  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see all products" do
    visit root_path

    save_screenshot
    
    find_button('Add').click

    save_screenshot
  end

end
