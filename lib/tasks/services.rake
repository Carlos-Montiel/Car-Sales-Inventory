namespace :services do
  desc "update price of cars when last_updated_price is behind exacly a month"
  task update_car_prices: :environment do
    p 'updating car prices...'
    CarsPriceUpdater.call
  end
end
