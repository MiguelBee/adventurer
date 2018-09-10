module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_user
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(user_path(current_user)) && return
    end
  end
end