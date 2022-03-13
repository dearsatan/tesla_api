Rails.application.routes.draw do
  get 'tesla/open_front'
  get 'tesla/open_rear'
  get 'tesla/door_lock'
  get 'tesla/door_unlock'
  get 'tesla/vehicle_state'
end
