class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(city)
    @city = city
    @api_key = ENV['OPENWEATHER_API_KEY']
  end

  def fetch_weather
    options = {
      query: {
        q: @city,
        appid: @api_key,
        units: 'metric',
        lang: 'ja'
      }
    }
    self.class.get('/weather', options)
  end
end
