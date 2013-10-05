class NinjaImage
  NINJA_FLICKR_IDS = %w(3122923308 4776677575 125929042 58378384 4916051207 3786387681 3390437212 4632018125
2633790667 2634020489 4424331850 526686758 5793119118 5793118774 7373786908 7188549545 8400985717 4695131161
3327627931 47252061 4909224171 2574495312 5682592461)

  BEST_WIDTH=300

  def initialize ninja_name
    FlickRaw.api_key = ENV['FLICKR_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']

    photo_id = get_photo_id(ninja_name)

    @photo_credits = get_photo(photo_id)
    @photo_size = extract_best_size(photo_id)
  end


  def url
    @photo_size.source
  end

  def height
    @photo_size.height.to_i
  end

  def width
    @photo_size.width.to_i
  end

  def author
    @photo_credits.owner.username
  end

  def photo_page
    @photo_credits.urls.find{|u| u.type == 'photopage'}._content
  end


  private
  def get_photo_id(ninja_name)
    idx = ninja_name.hash % NINJA_FLICKR_IDS.size
    NINJA_FLICKR_IDS[idx]
  end

  def extract_best_size(photo_id)
    sizes = flickr.photos.getSizes(:photo_id => photo_id)
    sorted = sizes.sort { |s1, s2| s1.width.to_i <=> s2.width.to_i }
    best_index = sorted.find_index { |s| s.width.to_i > BEST_WIDTH }

    sorted[best_index]
  end

  def get_photo(photo_id)
    flickr.photos.getInfo(:photo_id => photo_id)
  end
end