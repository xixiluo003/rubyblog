rails generate model User fname:string lname:string email:string username:string password:string
rails generate model Post user_id:integer title:string content:text
rails generate model Comment user_id:integer post_id:integer content:text


<%= form_tag("/user/" + session[:user_id].to_s + "/posts", method: "post") do %>

    <%= link_to 'All Users', users_path %>

    <%= form_for [@post.user, @post], :url => {:action => "create", :id => @post}, method: :post do |f| %>
          <p><%= f.text_field :title %><%= f.label(:title, "title") %></p>
          <p><%= f.text_field :content %><%= f.label(:content, "content") %></p>
          <%= f.submit "Save" %>
    <% end %>





user: fname lname email username password
Post: user_id title content
Comment: user_id post_id content

Prefix Verb   URI Pattern                             Controller#Action
user_posts GET    /user/:user_id/posts(.:format)          posts#index
       POST   /user/:user_id/posts(.:format)          posts#create
new_user_post GET    /user/:user_id/posts/new(.:format)      posts#new
edit_user_post GET    /user/:user_id/posts/:id/edit(.:format) posts#edit
user_post GET    /user/:user_id/posts/:id(.:format)      posts#show
       PATCH  /user/:user_id/posts/:id(.:format)      posts#update
       PUT    /user/:user_id/posts/:id(.:format)      posts#update
       DELETE /user/:user_id/posts/:id(.:format)      posts#destroy
user_index GET    /user(.:format)                         user#index
       POST   /user(.:format)                         user#create
new_user GET    /user/new(.:format)                     user#new
edit_user GET    /user/:id/edit(.:format)                user#edit
  user GET    /user/:id(.:format)                     user#show
       PATCH  /user/:id(.:format)                     user#update
       PUT    /user/:id(.:format)                     user#update
       DELETE /user/:id(.:format)                     user#destroy
comments GET    /comments(.:format)                     comments#index
       POST   /comments(.:format)                     comments#create
new_comment GET    /comments/new(.:format)                 comments#new
edit_comment GET    /comments/:id/edit(.:format)            comments#edit
comment GET    /comments/:id(.:format)                 comments#show
       PATCH  /comments/:id(.:format)                 comments#update
       PUT    /comments/:id(.:format)                 comments#update
       DELETE /comments/:id(.:format)                 comments#destroy
