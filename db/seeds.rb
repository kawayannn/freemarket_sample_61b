# 一層目
lady = Category.create(:name=>"レディース")
men = Category.create(name: "メンズ")
kid = Category.create(name: "ベビー・キッズ")


# 二層目
lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

men_suit = men.children.create(name: "スーツ")
men_jacket = men.children.create(name: "ジャケット/アウター")

toy = kid.children.create(name: "おもちゃ")
kid_shoes = kid.children.create(name: "キッズ靴")


# 三層目
lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"},{name: "その他"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "その他"}])

men_suit.children.create([{name: "スーツジャケット"}, {name: "スーツベスト"},{name: "その他"}])
men_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "その他"}])

toy.children.create([{name: "おふろのおもちゃ"}, {name: "ガラガラ"},{name: "その他"}])
kid_shoes.children.create([{name: "サンダル"}, {name: "スニーカー"}, {name: "ブーツ"},{name: "その他"}])