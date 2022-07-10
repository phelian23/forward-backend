require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get api_v1_articles_path
      expect(response).to be_successful
    end
  end
end