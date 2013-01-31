# mongoid_markdown

Makes it easy to handle a field in a mongoid document that contains markdown.

Creates an extra method parsed_*field_name* which will return the HTML markup of the markdown.

## Installation

**Note: This is not published to RubyGems yet - waiting for their recovory**

Add this line to your application's Gemfile:

    gem 'mongoid_markdown'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_markdown

## Usage

* Include MongoidMarkdown::Parser
* Add field with `markdown` instead of the normal `field`
* Enjoy the parsed_*field_name* method

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
