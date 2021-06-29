Rails.application.routes.draw do
　
  # ログイン用ルーティング
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ログイン後の遷移先ルーティング
  root 'mitumori_forms#new'
end
