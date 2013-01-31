require 'spec_helper'

class Article
  include Mongoid::Document
  include MongoidMarkdown::Parser

  field :header, type: String
  markdown :content
end

describe 'markdown' do
  it 'can call parsed_ method' do
    article = Article.new content: 'foo'
    article.parsed_content.should == "<p>foo</p>\n"
  end

  describe 'parse_markdown' do
    it 'passes markdown' do
      markdown = <<-EOF.strip_heredoc
        #This is a header

        A paragraph with a small amount of text

        * List with
        * Three
        * Items
      EOF

      expected = <<-EOF.strip_heredoc.html_safe
        <h1>This is a header</h1>

        <p>A paragraph with a small amount of text</p>

        <ul>
        <li>List with</li>
        <li>Three</li>
        <li>Items</li>
        </ul>
      EOF
      html = Article.parse_markdown markdown
      html.should == expected
    end

    it 'returns nil in nil input' do
      Article.parse_markdown(nil).should be_nil
    end
  end
end

