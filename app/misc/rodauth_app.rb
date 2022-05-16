class RodauthApp < Rodauth::Rails::App
  configure RodauthMain

  route do |r|
    rodauth.load_memory # autologin remembered users
    r.rodauth # route rodauth requests


    if r.path.start_with?("/admin/monitor")
      rodauth.require_authentication
      if Account.find(rodauth.session_value).role != 'admin'
        raise SecurityError.new "not allowed"
      end
    end
  end
  
end
