categories = ["computers","rihanna", "programming", "food"]

100.times do
  categories.each do |cat|
    gif = Giphy.random(cat)
    c = Category.find_or_create_by(name: cat)
    Jif.find_or_create_by(category_id: c.id, jif_path: gif.image_url.to_s, static_path: gif.image_url.to_s, width: gif.image_width, height: gif.image_height)
  end
end
