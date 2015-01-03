module Ernest
  class UpdatePostId
    def self.after_saving_post(response, post)
      new(response, post)
    end

    def initialize(response, post)
      @response = response
      @post = post
    end

    def call
      if everything_ok?
        update_post_id
      else
        puts response
      end
    end

    private

    attr_reader :response, :post

    def update_post_id
      if new_post_id
        post.update_id(new_post_id)
      else
        puts did_not_receive_id_error_message
      end
    end

    def new_post_id
      response.parsed_response["id"]
    end

    def everything_ok?
      response.code == 200
    end

    def did_not_receive_id_error_message
      <<-ERR_MSG.gsub(/^ {8}/, '').gsub("\n", '')
        The server did not respond with an id,
        therefore I will not be able to update this post
        in the next run, unless you add it manually.
      ERR_MSG
    end
  end
end
