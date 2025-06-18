module Jekyll
  class TagPage < Page
    def initialize(site, base, tag)
      @site = site
      @base = base
      @dir = 'tags'
      @name = "#{tag}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')
      self.data['layout'] = 'tag'
      self.data['tag'] = tag
      self.data['title'] = "Posts tagged \"#{tag}\""
    end
  end

  class TagPageGenerator < Generator
    safe true
    priority :normal

    def generate(site)
      if site.layouts.key? 'tag'
        site.tags.keys.each do |tag|
          site.pages << TagPage.new(site, site.source, tag)
        end
      end
    end
  end
end 