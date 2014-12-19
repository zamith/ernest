require 'ernest/version'
require 'httparty'
require 'metadown'
require 'dotenv'
Dotenv.load

module Ernest
  class CreatesDrafts
    def initialize(file_path)
      @file_path = file_path
    end

    def call
      response = HTTParty.post(
        ENV['API_ENDPOINT'],
        body: post,
        headers: { 'Authorization' => 'Token token="' + ENV['TOKEN'] + '"' }
      )

      puts response unless response.code == 200
    end

    private

    attr_reader :file_path

    def post
      {
        post: {
          body: data.output
        }.merge(data.metadata)
      }
    end

    def data
      @_data ||= Metadown.render(File.open(file_path, 'rb').read)
    end
  end
end
