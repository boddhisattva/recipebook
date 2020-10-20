# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  context 'when no recipes are present' do
    it 'displays no recipes available related message', vcr: { cassette_name: 'list_recipes' } do
      @recipes = Recipe.all.load
      allow(@recipes).to receive(:map) { [] }

      render template: 'recipes/index'

      expect(rendered).to have_text('There are no recipes that are currently available')
    end
  end
end
