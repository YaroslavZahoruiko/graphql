# frozen_string_literal: true

RSpec.describe 'updateProject mutation', type: :request do
  let!(:user_account) { create(:user_account, :with_user_profile) }
  let(:payload) { { account_id: user_account.id } }
  let(:auth_token) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login[:access] }
  let(:project) { create(:project, user_account: user_account) }
  let(:variables) do
    {
      id: project.id,
      input: {
        title: title
      }
    }
  end

  before do
    graphql_post(
      query: update_project_mutation,
      variables: variables,
      headers: { 'Authorization': "Bearer #{auth_token}" }
    )
  end

  describe 'success' do
    let(:title) { FFaker::Lorem.word }

    it 'returns updated project' do
      expect(response).to match_schema(Projects::UpdateSchema::Success)
    end
  end
end
