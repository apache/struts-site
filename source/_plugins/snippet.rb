require 'open-uri'
require 'uri'
require 'cgi'
require 'digest'

module Jekyll

  class Snippet < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      parse_params(markup)

      unless @url.start_with?('http')
        @url = absolute_url(@url)
      end

      if @url =~ URI::regexp
        @content = fetchContent(@url)
      else
        STDERR.puts "Invalid URL passed to Snippet: " + @url
      end

      super
    end

    def render(context)
      if @content
        snippet = @content
        if @id
          snippet = snippet[/#{Regexp.escape("START SNIPPET: " + @id)}[^\n]*\n(.*?)\n[^\n]*#{Regexp.escape("END SNIPPET: " + @id)}/m, 1]
          unless snippet
            snippet = "START SNIPPET: " + @id + " not found in " + @url
            STDERR.puts snippet
          end
        end
        if @javadoc
          unless @javadoc.to_s.strip.casecmp("FALSE") == 0
            snippet = snippet.gsub /^\s*\*/, ''
          end
        end
        if @lang
          snippet = "\r\n" + "```" + @lang + "\r\n" + snippet + "\r\n" + "```" + "\r\n"
        else
          snippet = "<p>" + escape(snippet) + "</p>"
        end

        return snippet
      else
        raise 'Something went wrong in Snippet'
      end
    end

    def fetchContent(url)
      cacheKey = Digest::SHA1.hexdigest(url.strip)
      cacheFile = "target/snippet_" + cacheKey + ".cache"
      unless File.exist?(cacheFile)
        File.open(cacheFile, 'w') { |file| file.write(Net::HTTP.get(URI.parse(URI.encode(url.strip)))) }
      end
      file = File.open(cacheFile, "rb")
      content = file.read
      file.close
      return content
    end

    def parse_params(markup)
      markup_split = markup.split("|").reject { |s| s.empty? }.each { |param| parse_param(param) }
    end

    def parse_param(param)
      param_split = param.split("=", 2).reject { |s| s.empty? }
      if param_split[0].casecmp("id")==0
        @id = param_split[1].strip
      else
        if param_split[0].casecmp("lang")==0
          @lang = param_split[1].strip
        else
          if param_split[0].casecmp("javadoc")==0
            @javadoc = param_split[1].strip
          else
            if param_split[0].casecmp("url")==0
              @url = param_split[1].strip
            else
              @url = param.strip
            end
          end
        end
      end
    end

    def absolute_url(url)
      slashIndex = url.index('/')
      unless slashIndex
        url = url.strip.gsub!('.','/')
        url = 'https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=core/src/main/java/' + url
        url = url + '.java;hb=HEAD'
      else
        baseUrl = url[0..slashIndex]
        url = url[slashIndex+1..-1]
        if baseUrl.casecmp("struts2-tags/") == 0
          url = "core/src/site/resources/tags/" + url
        end
        url = 'https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=' + url
        url = url + ';hb=HEAD'
      end
    end

    def escape_brackets(content)
      content.gsub(/{/,'&#x7b;').gsub(/}/, '&#x7d;')
    end

    def unescape_brackets(content)
      content.gsub!(/&(amp;)?#x7b;/, '{')
      content.gsub!(/&(amp;)?#x7d;/, '}')
      content
    end

    def escape(content)

      # Escape markdown style code blocks

        # Escape four tab or space indented code blocks
        content = content.gsub /^((\t| {4})[^\n].+?)\n($|\S)/m do
          "#{escape_brackets $1}\n#{$3}"
        end

        # Escape in-line code backticks
        content = content.gsub /(`[^`\n]+?`)/ do
          "#{escape_brackets $1}"
        end

        # Escape in-line code double backticks
        content = content.gsub /(``[^\n]+?``)/ do
          escape_brackets $1
        end

      # Escape highlight and codeblock tag contents
      content = content.gsub /^({%\s*(codeblock|highlight).+?%})(.+?){%\s*end(codeblock|highlight)\s*%}/m do
        "#{$1}{% raw %}#{unescape_brackets $3}{% endraw %}{% end#{$4} %}"
      end

      # Escape codefenced codeblocks
      content = content.gsub /^(`{3}.+?`{3})/m do

        # Replace any raw/endraw tags inside of codefence block
        # as some of the regex above may have escaped contents
        # of the codefence block
        #
        code = unescape_brackets($1).gsub(/{% (end)?raw %}/, '')

        # Wrap codefence content in raw tags
        "{% raw %}\n#{code}\n{% endraw %}"
      end

      content
    end

  end
end

Liquid::Template.register_tag('snippet', Jekyll::Snippet)