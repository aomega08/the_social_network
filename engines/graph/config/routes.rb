Graph::Engine.routes.draw do
  scope '/v2.0' do
    get 'me'
    post 'me'
    delete 'me'
  end

  match "(*any)", to: 'application#bad_node', via: [:get, :post, :put, :patch, :delete]
end
