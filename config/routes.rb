Rails.application.routes.draw do
  # ログイン用ルーティング(パスワード再設定用ルーティン削除)
  devise_for :users, skip: [:password]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ログイン後の遷移先ルーティング
  root 'mitumori_forms#new'

  # 確認画面遷移先ルーティング
  post 'mitumori_forms/confirm'

  # 送信完了画面遷移先ルーティング
  post 'mitumori_forms/complete'
end
