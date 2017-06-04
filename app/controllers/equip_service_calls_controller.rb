class EquipServiceCallsController < ApplicationController
  def index
    @equip_service_calls = EquipServiceCall.all
  end
end
