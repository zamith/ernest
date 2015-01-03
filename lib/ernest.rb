require 'ernest/version'
require 'ernest/post'
require 'ernest/update_post_id'

module Ernest
  class CreatesDrafts
    def initialize(file_path, response_handler = UpdatePostId, post_class = Post)
      @file_path = file_path
      @response_handler = response_handler
      @post_class = post_class
    end

    def call
      response = post.save
      response_handler.after_saving_post(response, post).call
    end

    private

    attr_reader :file_path, :response_handler, :post_class

    def post
      @_post ||= post_class.parse_from_file(file_path)
    end
  end
end
