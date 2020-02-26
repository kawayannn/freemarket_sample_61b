clothes_size_group = Size.create(name: "洋服のサイズ")
kid_shoes_size_group = Size.create(name: "ベビー・キッズの靴サイズ")

clothes_size = clothes_size_group.children.create([{name: "S"},{name: "M"},{name: "L"},{name: "FREE SIZE"}])
kid_shoes_size = kid_shoes_size_group.children.create([{name: "14cm・14.5cm"},{name: "15cm・15.5cm"},{name: "16cm・16.5cm"},{name: "17cm以上"}])
