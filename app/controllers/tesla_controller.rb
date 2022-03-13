class TeslaController < ApplicationController
  before_action :validate_request
  before_action :renew_token

  def vehicle_state
    render :json => MyTeslaApi.instance.vehicle_state
  end

  def open_front
    render :json => MyTeslaApi.instance.open_front
  end

  def open_rear
    render :json => MyTeslaApi.instance.open_rear
  end

  def renew_token
    MyTeslaApi.instance.renew_token
  end

  def validate_request
    if params['user'] != Rails.configuration.tesla_api.user
      render :json => {}
    end
  end
end
