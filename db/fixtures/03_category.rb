lady = Category.create(name:"レディース")
men = Category.create(name: "メンズ")
kid = Category.create(name: "ベビー・キッズ")

lady_tops = lady.children.create(name:"トップス")
lady_jacket = lady.children.create(name:"ジャケット/アウター")

men_suit = men.children.create(name: "スーツ")
men_jacket = men.children.create(name: "ジャケット/アウター")

toy = kid.children.create(name: "おもちゃ")
kid_shoes = kid.children.create(name: "キッズ靴")

clothes_size_group = Size.find_by(name: "洋服のサイズ")
kid_shoes_size_group = Size.find_by(name: "ベビー・キッズの靴サイズ")

lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)", size_id: clothes_size_group.id}, {name: "Tシャツ/カットソー(七分/長袖)", size_id: clothes_size_group.id},{name: "その他", size_id: clothes_size_group.id}])
lady_jacket.children.create([{name: "テーラードジャケット", size_id: clothes_size_group.id}, {name: "ノーカラージャケット", size_id: clothes_size_group.id}, {name: "Gジャン/デニムジャケット", size_id: clothes_size_group.id},{name: "その他", size_id: clothes_size_group.id}])

men_suit.children.create([{name: "スーツジャケット", size_id: clothes_size_group.id}, {name: "スーツベスト", size_id: clothes_size_group.id},{name: "その他", size_id: clothes_size_group.id}])
men_jacket.children.create([{name: "テーラードジャケット", size_id: clothes_size_group.id}, {name: "ノーカラージャケット", size_id: clothes_size_group.id}, {name: "Gジャン/デニムジャケット", size_id: clothes_size_group.id},{name: "その他", size_id: clothes_size_group.id}])

toy.children.create([{name: "おふろのおもちゃ"}, {name: "ガラガラ"},{name: "その他"}])
kid_shoes.children.create([{name: "サンダル", size_id: kid_shoes_size_group.id}, {name: "スニーカー", size_id: kid_shoes_size_group.id}, {name: "ブーツ", size_id: kid_shoes_size_group.id},{name: "その他", size_id: kid_shoes_size_group.id}])
