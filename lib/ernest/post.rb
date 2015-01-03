require 'ernest/metadata_parser'
require 'ernest/api'

module Ernest
  class Post
    def self.parse_from_file(file_path, parser = MetadataParser, api = API)
      parsed_data = parser.new(File.open(file_path, 'rb').read).parse
      new(parsed_data, file_path, api)
    end

    def initialize(data, file_path, api)
      @data = data
      @file_path = file_path
      @api = api
    end

    def save
      if id?
        update
      else
        create
      end
    end

    def update_id(new_id)
      unless id?
        new_file = File.read(file_path).sub("---\n", "---\nid: #{new_id}\n")
        File.write(file_path, new_file)
      end
    end

    private

    attr_reader :data, :file_path, :api

    def id?
      !!id
    end

    def id
      data.metadata['id']
    end

    def create
      api.with_data(data).post
    end

    def update
      api.with_data(data).put(id)
    end
  end
end
