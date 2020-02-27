lady_brand_group = Brand.create(name:"レディース")
men_brand_group = Brand.create(name: "メンズ")
kid_brand_group = Brand.create(name: "ベビー・キッズ")

lady_brand_group.children.create([{name: "アーヴェヴェ"}, {name: "アーカー"}, {name: "アーカイバ"}])
men_brand_group.children.create([{name: "アーカイブ"}, {name: "アーガイルアンドビュート"}, {name: "アーキテクトメイド"}])
kid_brand_group.children.create([{name: "愛情設計"}, {name: "赤ちゃんの城"}, {name: "アヴァランチ"}])
