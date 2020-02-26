BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーヴェヴェ").id
  s.category_id = Category.find_by(name: "Tシャツ/カットソー(半袖/袖なし)").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーヴェヴェ").id
  s.category_id = Category.find_by(name: "その他").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカー").id
  s.category_id = Category.find_by(name: "Tシャツ/カットソー(七分/長袖)").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカー").id
  s.category_id = Category.find_by(name: "その他").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカイバ").id
  s.category_id = Category.find_by(name: "Tシャツ/カットソー(半袖/袖なし)").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカイバ").id
  s.category_id = Category.find_by(name: "Tシャツ/カットソー(七分/長袖)").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカイバ").id
  s.category_id = Category.find_by(name: "その他").id
end


BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカイブ").id
  s.category_id = Category.find_by(name: "スーツジャケット").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーカイブ").id
  s.category_id = Category.find_by(name: "その他").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーガイルアンドビュート").id
  s.category_id = Category.find_by(name: "その他").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーキテクトメイド").id
  s.category_id = Category.find_by(name: "スーツジャケット").id
end


BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アーキテクトメイド").id
  s.category_id = Category.find_by(name: "その他").id
end



BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "愛情設計").id
  s.category_id = Category.find_by(name: "ガラガラ").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "赤ちゃんの城").id
  s.category_id = Category.find_by(name: "ガラガラ").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "赤ちゃんの城").id
  s.category_id = Category.find_by(name: "おふろのおもちゃ").id
end

BrandCategory.seed(:brand_id, :category_id) do |s|
  s.brand_id = Brand.find_by(name: "アヴァランチ").id
  s.category_id = Category.find_by(name: "おふろのおもちゃ").id
end
