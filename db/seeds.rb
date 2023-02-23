tags = %w(fruit cactus flower conifere)

tags.each do |name|
  Tag.create!(name: name)
end