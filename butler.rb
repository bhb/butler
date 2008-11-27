#! /usr/bin/env ruby
require 'sinatra'
require 'pathname'

get "/" do
  dir = "./files/"
  @links = Dir[dir+"*"].map { |file| 
    file_link(file)
  }.join
  erb :index
end

helpers do

  def file_link(file)
    filename = Pathname.new(file).basename
    "<li><a href='#{file}' target='_self'>#{filename}</a></li>"
  end
  
end

use_in_file_templates!

__END__

@@ index
<html>
  <head>
    <meta name="viewport" content="width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
    <style type="text/css" media="screen">@import "/stylesheets/iui.css";</style>
    <script type="application/x-javascript" src="/javascripts/iui.js"></script>
  </head>

  <body>
    <div class="toolbar">
    <h1 id="pageTitle"></h1>
    </div>
    <ul id="home" title="Your files, sir." selected="true">
       <%= @links %>
    </ul>
  </body>

</html>
