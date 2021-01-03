# frozen_string_literal: true

RSpec.describe 'destroyProject mutation', type: :request do
  let!(:user_account) { create(:user_account, :with_user_profile) }
  let(:payload) { { account_id: user_account.id } }
  let(:auth_token) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login[:access] }
  let(:variables) { { id: id } }
  let(:project) { create(:project, user_account: user_account) }

  before do
    graphql_post(
      query: destroy_project_mutation,
      variables: variables,
      headers: { 'Authorization': "Bearer #{auth_token}" }
    )
  end

  describe 'success' do
    let(:id) { project.id }

    it 'returns success status' do
      expect(response).to match_schema(Projects::DestroySchema::Success)
    end
  end
end
