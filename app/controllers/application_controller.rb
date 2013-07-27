class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_initial_breadcrumbs

  add_breadcrumb 'Home', '/'

  private

  def set_initial_breadcrumbs
    add_breadcrumb ("Home")
  end
end
