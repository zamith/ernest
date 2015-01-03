require 'httparty'
require 'dotenv'
Dotenv.load

module Ernest
  class API
    def self.with_data(data)
      new(data)
    end

    def initialize(data)
      @data = data
    end

    def post
      HTTParty.post(
        ENV['API_ENDPOINT'],
        body: http_data,
        headers: { 'Authorization' => 'Token token="' + ENV['TOKEN'] + '"' }
      )
    end

    def put(id)
      HTTParty.put(
        ENV['API_ENDPOINT'] + "/#{id}",
        body: http_data,
        headers: { 'Authorization' => 'Token token="' + ENV['TOKEN'] + '"' }
      )
    end

    private

    attr_reader :data

    def http_data
      {
        post: {
          body: data.output
        }.merge(data.metadata)
      }
    end
  end
end
