require "rails_helper"

RSpec.describe Recipe do
  let(:recipe_id) { '437eO3ORCME46i02SeCW46' }
  let(:recipe_id_without_associated_recipe_info) { '5jy9hcMeEgQ4maKGqIOYW6' }

  describe "#photo_url" do
    context 'given a recipe with an associated photo' do
      it 'gets the image url', vcr: { cassette_name: 'show_recipe' } do
        recipe = Recipe.find(recipe_id)

        expect(recipe.photo_url).to eq('//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg')
      end
    end
  end


  describe '#tag_names' do
    context 'given a recipe that is associated with certain tags' do
      it 'gets a collection of comma separated tag names', vcr: { cassette_name: 'show_recipe' } do
        recipe = Recipe.find(recipe_id)

        expect(recipe.tag_names).to eq('gluten free, healthy')
      end
    end

    context 'given a recipe that does not have associated tags' do
      it 'returns nil', vcr: { cassette_name: 'recipe_without_associated_recipe_info' } do
        recipe = Recipe.find(recipe_id_without_associated_recipe_info)

        expect(recipe.tag_names).to be_nil
      end
    end
  end

  describe '#chef_name' do
    context 'given a recipe that has associated chef details' do
      it 'gets the chef name', vcr: { cassette_name: 'show_recipe' } do
        recipe = Recipe.find(recipe_id)

        expect(recipe.chef_name).to eq('Jony Chives')
      end
    end

    context 'given a recipe that does not have associated chef details' do
      it 'returns nil', vcr: { cassette_name: 'recipe_without_associated_recipe_info' } do
        recipe = Recipe.find(recipe_id_without_associated_recipe_info)

        expect(recipe.chef_name).to be_nil
      end
    end
  end
end
