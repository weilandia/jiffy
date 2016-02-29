categories = ["8-bit",
 "Godard",
 "VHS",
 "YOLO",
 "actually",
 "aesthetic",
 "asymmetrical",
 "banjo",
 "brooklyn",
 "bushwick",
 "cardigan",
 "celiac",
 "chia",
 "cleanse",
 "cliche",
 "cray",
 "crucifix",
 "dream",
 "drinking",
 "echo",
 "ethical",
 "everyday",
 "gluten",
 "goth",
 "hammock",
 "hella",
 "hoodie",
 "leggings",
 "lo-fi",
 "locavore",
 "loko",
 "migas",
 "mixtape",
 "occupy",
 "organic",
 "pinterest",
 "plaid",
 "polaroid",
 "post-ironic",
 "coffee",
 "quinoa",
 "ramps",
 "roof",
 "selfies",
 "sustainable",
 "tattooed",
 "typewriter",
 "ugh",
 "vegan",
 "vice",
 "vinegar",
 "vinyl",
 "wolf"]


100.times do
  categories.each do |cat|
    gif = Giphy.random(cat)
    c = Category.find_or_create_by(name: cat)
    Jif.find_or_create_by(category_id: c.id, jif_path: gif.image_url.to_s, static_path: gif.image_url.to_s, width: gif.image_width, height: gif.image_height)
  end
end

User.create(username: "admin", email:"admin", password:"password",role:1)
