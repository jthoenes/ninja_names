require 'singleton'
require 'sinatra'
require_relative 'lib/ninjify'

get '/ninja/:normal_name' do
  @normal_name = params[:normal_name]
  @ninja_name = Ninjify.instance.ninjify(@normal_name)

  haml :ninja
end

__END__

@@ ninja
!!! 5
%html
  %head
    %title
      The Ninja Name of
      = @normal_name
      is
      = @ninja_name
    %link{:rel=>"stylesheet",:type=>"text/css",:href=>"//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"}

  %body
    .container
      .entry.well.well-large{:style => 'margin-top: 250px;'}
        %p.lead
          %span Hello
          %span.normal-name
            %strong&= @normal_name
          %span your Ninja name is:
        %h1.ninja-name{:style => 'color: #b94a48;'}&= @ninja_name

      %script{:type => "text/javascript", :src  => "//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"}



