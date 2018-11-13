require 'rails_helper'

RSpec.feature " can navigate from the home page to the product detail page", type: :feature,  js:  true do
  before :each do
    
  @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "can click on product partial and redirect" do
    # ACT
    visit root_path
    click_on("Details", match: :first)
    # DEBUG
   
    save_screenshot
    # VERIFY
    expect(page).to have_css ".products-show"
  end
end 
