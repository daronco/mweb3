class WebconfServersController < Bigbluebutton::ServersController
  before_filter :authenticate_user!
  authorize_resource :class => BigbluebuttonServer
end
