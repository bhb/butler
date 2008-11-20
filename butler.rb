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
  dir = "./public/"
  #bigness = 5
  #out = "<big>"*bigness
  #out += "<h3 style='+3'>your files</h3>"
  @links = Dir[dir+"*"].map { |file| 
    make_link(dir,file)
  }
  erb :index
  #out+="</big>"*bigness
  
end

helpers do

  def make_link(dir,file)
    relative = file.gsub(dir,"")
    "<a href='#{relative}'>#{relative}</a><br/><br/>"
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
