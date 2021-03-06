# Ernest

> Write drunk; edit sober

-- *Ernest Hemingway*

Writing drunk is not always easy, to help with that, Ernest tries to make creating a draft on your blog a no brainer.

## Requirements

Your blog must accept a `POST` with an authentication token for the creating of drafts (or publish them immediately if you're fealing lucky).

See an example [here](https://github.com/groupbuddies/gb-blog).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ernest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ernest

## Usage

Ernest is expecting two environment variables:

```
API_ENDPOINT="http://localhost:3000/api/posts"
TOKEN="a-random-token"
```

To make this super easy, Ernest comes bundled with `dotenv`, which means that you can add these variables to a file called `.env` and place it wherever you want to create your drafts from (e.g. a `~/posts` directory).

After you've set those variables, write your post in plain old markdown, adding any extra fields you want to send to the server as metadata. See an example [here](/examples/post-1.markdown.example).

When you're done with the writing, create a draft:

```
$ ernest post-name.markdown
```

### Updates

If you already have a post created and want to update it, you just need to add
its id to the metadata:

```markdown
---
id: 28
title: "A title"
---

... Rest of post ...
```

Now just call ernest again and it will do a `PUT` instead of a `POST`.

If you create your post with ernest, it will add the id for you (the server must
respond with the post id upon creation).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ernest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
