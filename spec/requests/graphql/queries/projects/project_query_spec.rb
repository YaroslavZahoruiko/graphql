# frozen_string_literal: true

RSpec.describe 'project query', type: :request do
  let!(:user_account) { create(:user_account, :with_user_profile) }
  let(:payload) { { account_id: user_account.id } }
  let(:auth_token) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login[:access] }
  let(:project) { create(:project, user_account: user_account) }
  let(:variables) { { id: id } }

  before do
    create_list(:task, 3, project: project)
    graphql_post(
      query: project_query,
      variables: variables,
      headers: { 'Authorization': "Bearer #{auth_token}" }
    )
  end

  describe 'success' do
    let(:id) { project.id }

    it 'returns project info' do
      expect(response).to match_schema(Projects::ShowSchema::Success)
    end

    context 'with tasks' do
      before do
        create_list(:task, 3, project: project)
        graphql_post(
          query: project_with_task_query,
          variables: variables,
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )
      end

      it 'returns project info' do
        expect(response).to match_schema(Projects::ShowSchema::SuccessWithTasks)
      end
    end
  end
end
