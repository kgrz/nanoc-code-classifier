# nanoc-code-classifier

The nanoc syntax highlighting filter (Nanoc3::Filters::ColorizeSyntax) requires that the class of the `code` element is set to the language used in the `code` element. However it is impossible to set a class in markup formats other than HTML (e.g. markdown, textile, etc).

This nanoc filter pre-processes HTML for `code` elements for a simple tag which is used to indicate the language used in the `code` element. The appropriate classes are then applied to the HTML.

The tags must be in the format `@language-`.

For example, the following markdown:

    This is a code block in ruby:

        @language-ruby

        puts "hello world"

    And this is a code block in javascript:

        @language-javascript

        alert("hello world");

becomes:

    <p>This is a code block in ruby:</p>

    <pre><code class="language-ruby">
    puts "hello world"
    </code></pre>

    <p>And this is a code block in javascript:</p>

    <pre><code class="language-javascript">
    alert("hello world");
    </code></pre>


## Quickstart

This rule first generates HTML from markdown using bluecloth, then applies the language classes using nanoc-code-classifier and finally highlights the syntax using coderay.

    compile "/*/" do
      filter :bluecloth
      filter :code_classifier, :pre_class => "coderay"
      filter :colorize_syntax, :colorizers => {:ruby => :coderay}
      layout "default"
    end
