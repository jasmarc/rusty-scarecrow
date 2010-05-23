require 'rubygems'
require 'dm-core'
require 'sinatra'
require 'haml'
require 'sass'
require 'pp'

class Article
  include DataMapper::Resource
  property :id, Serial
  property :title, Text
  property :text, Text
end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/foo_database")
DataMapper.auto_upgrade!

get '/' do
  @articles = Article.all
  @articles = [] if @articles.nil?
  haml :main
end

get '/ajax/articles' do
  @articles = Article.all
  @articles = [] if @articles.nil?
  @articles.inject("") {|a,b| a + "<li><a href='/article/#{b.id}'>#{b.title}</a></li>"}
end

get '/article/:id' do
  @article = Article.first :id => params[:id]
  haml :article
end

post '/save' do
  article = Article.create(:title => params[:title], :text => params[:text])
  "<li><a href='/article/#{article.id}'>#{article.title}</a></li>"
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
    %link{:rel => 'stylesheet', :href => '/jquery-ui-1.8.1.custom/development-bundle/themes/le-frog/jquery.ui.core.css', :type => 'text/css'}
    %link{:rel => 'stylesheet', :href => '/jquery-ui-1.8.1.custom/development-bundle/themes/le-frog/jquery.ui.theme.css', :type => 'text/css'}
    %link{:rel => 'stylesheet', :href => '/jquery-ui-1.8.1.custom/development-bundle/themes/le-frog/jquery.ui.progressbar.css', :type => 'text/css'}
    %meta{'http-equiv' => "Content-Type", :content => "text/html; charset=utf-8"}
    %script{:src => '/jquery-ui-1.8.1.custom/development-bundle/jquery-1.4.2.js', :type => 'text/javascript'}
    %script{:src => '/jquery-ui-1.8.1.custom/development-bundle/ui/jquery.ui.core.js', :type => 'text/javascript'}
    %script{:src => '/jquery-ui-1.8.1.custom/development-bundle/ui/jquery.ui.widget.js', :type => 'text/javascript'}
    %script{:src => '/jquery-ui-1.8.1.custom/development-bundle/ui/jquery-ui-1.8.1.custom.js', :type => 'text/javascript'}
    %script{:src => '/jquery.jeditable.js', :type => 'text/javascript'}
    %script{:src => '/jquery.form.js', :type => 'text/javascript'}
    %script{:src => '/main.js', :type => 'text/javascript'}
    %script $(document).ready(main);
  %body
    #container
      %div= yield
    #footer
      Messing around with web technologies. Source
      %a{:href => 'http://github.com/jasmarc/rusty-scarecrow'} here
      \.

@@main
%h1 main page
%form{:id => 'myform', :action => '/save', :method => 'post'}
  %input{:type => 'text', :name => 'title'}
  %br
  %textarea{:name => 'text', :cols => '50', :rows => '5'}
  %br
  %input{:type => 'submit'}
%ul{:id => 'output'}
  - @articles.each do |article|
    %li
      %a{:href => "/article/#{article.id}"}= article.title

@@article
%h1= @article.title
%div= @article.text
%br
%a{:href => '/'} back to main

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
#sortable
  :list-style-type none