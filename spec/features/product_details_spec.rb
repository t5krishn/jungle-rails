require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

    
    click_link "Details »"
    
    sleep 5

    # save_screenshot

    # puts page.html
    expect(page).to have_selector :css, '.products-show', count: 1
    
  end

end
