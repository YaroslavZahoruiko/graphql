# frozen_string_literal: true

RSpec.describe 'createProject mutation', type: :request do
  let!(:user_account) { create(:user_account, :with_user_profile) }
  let(:payload) { { account_id: user_account.id } }
  let(:auth_token) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login[:access] }
  let(:variables) do
    {
      input: {
        title: title
      }
    }
  end

  before do
    graphql_post(
      query: create_project_mutation,
      variables: variables,
      headers: { 'Authorization': "Bearer #{auth_token}" }
    )
  end

  describe 'success' do
    let(:title) { FFaker::Lorem.word }

    it 'returns info of created project' do
      expect(response).to match_schema(Projects::CreateSchema::Success)
    end
  end
end
