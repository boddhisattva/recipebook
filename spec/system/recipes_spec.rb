require 'rails_helper'



describe 'Recipes', type: :system do
  let(:recipe_titles) { [
    'White Cheddar Grilled Cheese with Cherry Preserves & Basil',
    'Tofu Saag Paneer with Buttery Toasted Pita',
    'Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing',
    'Crispy Chicken and Rice with Peas & Arugula Salad'
  ]}

  let(:recipe_image_urls) { [
    'http://images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg',
    'http://images.ctfassets.net/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg',
    'http://images.ctfassets.net/kk2bw5ojx476/3TJp6aDAcMw6yMiE82Oy0K/2a4cde3c1c7e374166dcce1e900cb3c1/SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg',
    'http://images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg'
  ]}

  describe 'List recipes', vcr: { cassette_name: 'list_recipes' } do
    context 'when a user is on the homepage or list recipes page' do
      before do
        visit root_path
      end

      it 'lists all the recipe titles' do
        recipe_titles.each do |recipe_title|
          expect(page).to have_text(recipe_title)
        end
      end

      it 'displays the recipe images' do
        recipe_photo_urls = page.find_all('img').map { |image| image['src'] }

        expect(recipe_photo_urls).to match_array(recipe_image_urls)
      end
    end
  end

  describe 'Show recipes', vcr: { cassette_name: 'show_recipe' } do
    context 'when user is on a show recipe page' do
      context 'specified recipe exists' do
        let(:recipe_id) { '437eO3ORCME46i02SeCW46' }
        let(:recipe_description) { 'Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy!' }

        before do
          visit recipe_path(recipe_id)
        end

        it 'displays recipe details' do
          recipe_image_url = page.find_all('img').map { |image| image['src'] }

          expect(page).to have_text(recipe_titles.last)
          expect(recipe_image_url).to match_array(recipe_image_urls.last)
          expect(page).to have_text(recipe_description)
        end

        it 'displays associated recipe info like tag names etc.,' do
          expect(page).to have_text('Tags: gluten free, healthy')
          expect(page).to have_text('Chef: Jony Chives')
        end
      end

      context 'specified recipe does not exist' do
        let(:non_existent_recipe_id) { 'random_recipe_id' }

        it 'displays page not found', vcr: { cassette_name: 'non_existent_recipe' } do
          visit recipe_path(non_existent_recipe_id)

          expect(page).to have_text("The page you were looking for doesn't exist")
        end
      end
    end
  end
end
