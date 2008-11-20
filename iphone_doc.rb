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

helpers do

  def make_link(dir,file)
    relative = file.gsub(dir,"")
    "<a href='#{relative}'>#{relative}</a><br/><br/>"
  end
  
end

