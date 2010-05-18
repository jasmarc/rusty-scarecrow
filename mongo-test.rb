require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'mongo'
require 'pp'

configure do
  DB = Mongo::Connection.new("flame.mongohq.com", 27036).db("jasontest")
  DB.authenticate("jason", "xxxx")
  Coll = DB.collection("todo items")
end

helpers do
  def title
    "Todo List"
  end

  def items
    Coll.find()
  end
end

post '/' do
  todo=Coll.insert({"name" => params[:title]})
  redirect '/'
end

get '/' do
  haml :items
end

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

__END__

@@layout
!!! XML
!!!
%html
  %head
    %link{:rel => 'stylesheet', :href => '/stylesheet.css', :type => 'text/css'}
    %meta{'http-equiv' => "Content-Type", :content => "text/html; charset=utf-8"}/

  %body
    #container= yield
    #footer
      Messing around with Sinatra, HAML, Mongo, Sass, etc.

@@items
%h1= title
%form{:method => "post"}
  %input{:type=>'text', :size=>40, :name=>'title', :id=>'todo-title'}
  %input{:type=>'submit', :value=>'New Todo'}
%ul
  - items.each do |item|
    %li= item['name']

@@stylesheet
body
  :font-family "Lucida Grande", sans-serif
  :color #2D5E32
  :font-size 12px
  :background #6DB874
h1,h2,h3,h4,h5,h6
  :font-family "Helvetica", sans-serif
#container
  :width 520px
  :margin 30px auto 3px
  :padding 20px
  :background #D3EAD6
  :border 5px solid #2D5E32
  :-moz-border-radius 10px
  :-webkit-border-radius 10px
#footer
  :text-align center
  :color #2D5E32
  a
    :color #2D5E32