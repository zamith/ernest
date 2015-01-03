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
      end
    end

    def new_post_id
      response.parsed_response["id"]
    end

    def everything_ok?
      response.code == 200
    end
  end
end
