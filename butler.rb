#! /usr/bin/env ruby
require 'sinatra'

get "/" do
  dir = "./public/"
  bigness = 5
  out = "<big>"*bigness
  out += "<h3 style='+3'>your files</h3>"
  Dir[dir+"*"].each do |file| 
    out+=make_link(dir,file)
  end
  out+="</big>"*bigness
end

get "/foo" do
  dir = "./public/files/"
  #bigness = 5
  #out = "<big>"*bigness
  #out += "<h3 style='+3'>your files</h3>"
  @links = Dir[dir+"*"].map { |file| 
    entry(dir,file)
  }
  erb :iphone
  #out+="</big>"*bigness
  
end

helpers do

  def entry(dir,file)
    relative = file.gsub(dir,"")
    "<li><a href='#{"files/"+relative}' target='_self'>#{relative}</a></li>"
  end
  
end

use_in_file_templates!

__END__

@@ index
<html>
  <head>
    <style type="text/css">
      h1 {font-size: 300%}
      p {font-size: 300%}
    </style>
  </head>

<body>
  <h1>Your files, sir. Enjoy.</h1>
  <p>
    <%= @links %>
  </p>
</body>

</html>

@@ iphone
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
