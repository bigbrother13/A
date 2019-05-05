class Admin::MainController < Admin::BaseController
  def index
    @users = User.all
  end
end
