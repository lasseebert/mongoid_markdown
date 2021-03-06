# mongoid_markdown

[![Code Climate](https://codeclimate.com/github/lasseebert/mongoid_markdown.png)](https://codeclimate.com/github/lasseebert/mongoid_markdown)
[![Gem Version](https://badge.fury.io/rb/mongoid_markdown.png)](http://badge.fury.io/rb/mongoid_markdown)
[![Build Status](https://semaphoreci.com/api/v1/projects/8249b480-a1b3-4ef0-9ed9-90323383af84/401323/badge.svg)](https://semaphoreci.com/lasseebert/mongoid_markdown)

Makes it easy to handle a field in a mongoid document that contains markdown.

Creates an extra method `parsed_field_name` which will return the HTML markup of the markdown.

## Installation

Add this line to your application's Gemfile:

    gem 'mongoid_markdown'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_markdown

## Usage

* Include `MongoidMarkdown::Parser`
* Add field with `markdown` instead of the normal `field`
* Enjoy the `parsed_field_name` method

Example:
```ruby
class Article
  include Mongoid::Document
  include MongoidMarkdown::Parser

  field :header, type: String
  markdown :content
end

article = Article.new header: 'Check out mongoid_markdown', content: "Wow\n\n* list\n* *items*"
article.parsed_content # => "<p>Wow</p>\n\n<ul>\n<li>list</li>\n<li><em>items</em></li>\n</ul>\n"
```

## Alternatives

[mongoid-markdown](https://github.com/kristianmandrup/mongoid-markdown), which takes a slightly different approach.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
