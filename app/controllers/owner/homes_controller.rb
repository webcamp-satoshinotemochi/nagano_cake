class Owner::HomesController < ApplicationController
before_action :authenticate_owner!
#管理者でないとログイン画面に遷移

def top
end

end
