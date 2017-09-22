require 'open-uri'
require 'uri'
require 'cgi'

module Jekyll

  class TagParameters < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      url = 'https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/' + markup

      puts 'Fetching content of url: ' + url

      if url =~ URI::regexp
        @content = fetchContent(url)
      else
        raise 'Invalid URL passed to RemoteFileContent'
      end

      super
    end

    def render(context)
      if @content
        parameters = @content[/#{Regexp.escape('<!-- START SNIPPET: tagattributes -->')}(.*?)#{Regexp.escape('<!-- END SNIPPET: tagattributes -->')}/m, 1]
        "<p>" + parameters + "</p>"
      else
        raise 'Something went wrong in TagParameters'
      end
    end

    def fetchContent(url)
      open(URI.parse(URI.encode(url.strip))).read.chomp
    end
  end
end

Liquid::Template.register_tag('tag_parameters', Jekyll::TagParameters)