module Slugifiable

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

module ClassSlugifiable
  def find_by_slug(slug)
    self.all.find do |instance|
      instance.slug == slug
    end
  end

end
