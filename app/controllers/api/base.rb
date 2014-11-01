require 'grape-swagger'

module API
  class Base < Grape::API
  	
    mount API::Words
    mount API::Users

    add_swagger_documentation hide_documentation_path: true, base_path: "/api"
  end
end