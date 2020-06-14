Rails.application.routes.draw do
  root 'main#entry'
  match '*path', to: 'main#entry', via: :all
end
