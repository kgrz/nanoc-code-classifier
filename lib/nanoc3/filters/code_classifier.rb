require 'nokogiri'

module Nanoc3
  module Filters
    # A nanoc filter which pre-processes a code block for a language tag.
    #
    # For example:
    #
    #     @language-ruby
    class CodeClassifier < Nanoc3::Filter
      identifier :code_classifier
      type :text

      def run(content, params = {})
        doc = Nokogiri::HTML.fragment(content)
        doc.css("pre > code").each do |element|
          element.content = element.content.sub(/\s*@(language-\w+)\s*/) do
            append_class(element, $1)
            append_class(element.parent, params[:pre_class)
            nil
          end.strip
        end
        doc.to_s
      end

    private

      def append_class(element, klass)
        element["class"] = ((element["class"] || "") + " " + klass).strip
      end
    end
  end
end
