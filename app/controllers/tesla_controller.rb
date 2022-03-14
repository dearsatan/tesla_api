class TeslaController < ApplicationController
  before_action :validate_request
  before_action :renew_token

  def vehicle
    render :json => MyTeslaApi.instance.vehicle(params['cmd'])
  end

  def renew_token
    MyTeslaApi.instance.renew_token
  end

  def validate_request
    if params['token'] != Rails.configuration.tesla_api.token
      render :json => {}
    end
  end
end
