# frozen_string_literal: true

RSpec.describe 'projects query', type: :request do
  let!(:user_account) { create(:user_account, :with_user_profile) }
  let(:payload) { { account_id: user_account.id } }
  let(:auth_token) { JWTSessions::Session.new(payload: payload, refresh_payload: payload).login[:access] }

  describe 'success' do
    context 'when projects present' do
      before do
        create_list(:project, 3, user_account: user_account)
        graphql_post(
          query: projects_query,
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )
      end

      it 'returns projects info' do
        expect(response).to match_schema(Projects::IndexSchema::Success)
      end
    end

    context 'when projects is blank' do
      before do
        graphql_post(
          query: projects_query,
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )
      end

      it do
        expect(response).to match_schema(Projects::IndexSchema::Success)
      end
    end

    context 'with tasks' do
      before do
        create_list(:project, 5, :with_tasks, user_account: user_account)
        graphql_post(
          query: projects_with_tasks_query,
          headers: { 'Authorization': "Bearer #{auth_token}" }
        )
      end

      it do
        expect(response).to match_schema(Projects::IndexSchema::SuccessWithTasks)
      end
    end
  end
end
