class Admin::MonitoringsController < Admin::AdminController


  def index
    authorize! :monitoring
  end

end
