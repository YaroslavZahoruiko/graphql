# frozen_string_literal: true

module GraphQL
  module QueryHelpers
    def me_query
      %(
        query me {
          me {
              email
            userProfile {
              firstName
              lastName
              fullName
            }
          }
        }
      )
    end
  end
end
