require 'mongoid_markdown/version'
require 'redcarpet'

module MongoidMarkdown
  module Parser

    def self.included(base)
      base.class_eval do |klass|
        extend ClassMethods
      end
    end

    module ClassMethods
      def markdown(field_name)
        field field_name, type: String
        define_method("parsed_#{field_name.to_s}") do
          self.class.parse_markdown self.send(field_name)
        end
      end

      def parse_markdown(markdown)
        return nil if markdown.nil?
        @@markdown_parser ||= Redcarpet::Markdown.new(
          Redcarpet::Render::HTML,
          autolink: true
        )
        @@markdown_parser.render(markdown).html_safe
      end
    end

  end
end

