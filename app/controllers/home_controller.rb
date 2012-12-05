class HomeController < ApplicationController
  inherit_resources
  actions :show

  before_filter :authenticate_user!

  authorize_resource :class => false

  protected

  # no resource in this controller
  def resource
  end
end
