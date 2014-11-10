class BeaconsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :json_request?

  def create
    @beacon = Beacon.new(beacon_params)
    if @beacon.save
      render json: @beacon
    else
      render status: :unprocessable_entity, 
        json: @beacon.as_json.merge!({ errors: @beacon.errors })
    end
  end

  def index
    @beacons = Beacon.all
    respond_to do |format|
      format.html
      format.json { render json: @beacons }
    end
  end

  private

  def beacon_params
    params.require(:beacon).permit(
      :date, 
      :uuid, 
      :local_name, 
      :tx_power_level,
      :rssi,
      :manufacturer_data,
      :lat,
      :lng
    )
  end

  def json_request?
    request.format.json?
  end
 
end
