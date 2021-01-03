# frozen_string_literal: true

module GraphQL
  module MutationHelpers
    def create_project_mutation
      %(
        mutation createProject($input: ProjectInput!) {
          createProject(input: $input) {
            title
          }
        }
      )
    end

    def update_project_mutation
      %(
        mutation updateProject($input: ProjectInput!, $id: ID!) {
          updateProject(input: $input, id: $id) {
            title
          }
        }
      )
    end

    def destroy_project_mutation
      %(
        mutation destroyProject($id: ID!) {
          destroyProject(id: $id) {
            success
          }
        }
      )
    end
  end
end
