# frozen_string_literal: true

module GraphQL
  module QueryHelpers
    def project_query
      %(
        query project($id: ID!) {
          project(id: $id) {
            title
          }
        }
      )
    end

    def projects_query
      %(
        query projects {
          projects {
            title
          }
        }
      )
    end

    def project_with_task_query
      %(
        query project($id: ID!) {
          project(id: $id) {
            title
            tasks {
              title
              description
            }
          }
        }
      )
    end

    def projects_with_tasks_query
      %(
        query projects {
          projects {
            title
            tasks {
              title
              description
            }
          }
        }
      )
    end
  end
end
