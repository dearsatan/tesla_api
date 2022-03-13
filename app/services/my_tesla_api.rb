require 'tesla_api'
require 'json'
require 'singleton'

class MyTeslaApi
  include Singleton

  def initialize()
    client_id = Rails.configuration.tesla_api.client_id
    client_secret = Rails.configuration.tesla_api.client_secret 
    base_uri = Rails.configuration.tesla_api.base_uri
    sso_uri = Rails.configuration.tesla_api.sso_uri

    refresh_token = Rails.configuration.tesla_api.refresh_token
    user_agent = Rails.configuration.tesla_api.user_agent
    api_timeout = Rails.configuration.tesla_api.api_timeout

    @tesla_api = TeslaApi::Client.new(client_id: client_id, client_secret: client_secret, base_uri: base_uri,
                                      sso_uri: sso_uri, refresh_token: refresh_token, 
                                      client_options:{request: { timeout: api_timeout }, headers: { 'User-Agent' => user_agent}})
    
    renew_token()
    @car = @tesla_api.vehicles.first
  end

  def renew_token
    if @tesla_api.expired?
        @tesla_api.refresh_access_token
    end
  end

  def vehicle_state
    state = @car.vehicle_state                                                                                                              
    Rails.logger.info JSON.pretty_generate(state)
    state
  end

  def open_front
    state = @car.open_fronk
    Rails.logger.info JSON.pretty_generate(state)
    state
  end

  def open_rear
    state = @car.open_trunk
    Rails.logger.info JSON.pretty_generate(state)
    state
  end

  def door_lock
    state = @car.door_lock
    Rails.logger.info JSON.pretty_generate(state)
    state
  end

  def door_unlock
    state = @car.door_unlock
    Rails.logger.info JSON.pretty_generate(state)
    state
  end

end

