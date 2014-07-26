class VisitorsController < ApplicationController
  skip_before_filter :ensure_loggedin
  before_filter :ensure_not_loggedin

  def index
  end
end
