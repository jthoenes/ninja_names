require 'singleton'
require 'sinatra'
require_relative 'lib/ninjify'

get '/ninja/:normal_name' do
  @normal_name = params[:normal_name]
  @ninja_name = Ninjify.instance.ninjify(@normal_name)

  haml :ninja
end

__END__

@@ layout
!!! 5
%html
  %head
    %script{:type => "text/javascript", :src  => "//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"}

  %body
    = yield
    %link{:rel=>"stylesheet",:type=>"text/css",:href=>"//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"}

@@ ninja
.container
  .entry.well.well-large{:style => 'margin-top: 250px;'}
    %p.lead
      %span Hello
      %span.normal-name
        %strong&= @normal_name
      %span your Ninja name is:
    %h1.ninja-name{:style => 'color: #b94a48;'}&= @ninja_name
