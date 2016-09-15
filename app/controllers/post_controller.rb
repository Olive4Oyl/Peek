class PostController < ApplicationController
  get '/new' do
    erb :'/posts/new'
  end

  post '/new' do
    if params[:post][:content] == nil || params[:post][:content] == ""
      #insert flash message
      redirect to '/posts/new'
    else
      @post = Post.create(content: params[:post][:content])

  end

end
