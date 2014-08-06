module Graph
  class ApplicationController < ActionController::API
    def bad_node
      render json: '{}'
    end
  end
end
