class Admin::VersionsController < Admin::AdminController

  def show
    authorize! :admin
  end

end
