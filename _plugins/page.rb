module Jekyll
  class PageTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip.downcase
    end

    def render(context)
      site = context.registers[:site]
      page = site.collections['pages'].docs.select{|p|p.data['title'].gsub(/\"/,'').downcase == @text}.first
      if page.present?
        "<a href='#{site.baseurl}#{page.url}'>#{page.data['title']}</a>"
      end
    end
  end
end

Liquid::Template.register_tag('page', Jekyll::PageTag)