crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :logout do
  link 'ログアウト',logout_path
  parent :mypage
end

crumb :conform_user do
  link '本人情報の確認',conform_user_path
  parent :mypage
end

crumb :conform_card do
  link 'クレジットカード情報入力',conform_card_path
  parent :mypage
end

crumb :edit_profile do
  link 'プロフィール',edit_profile_path
  parent :mypage
end
