require 'sinatra'

get "/" do
  dir = "./public/"
  out = ""
  Dir[dir+"*"].each do |file| 
    out+=make_link(dir,file)
  end
  out
end

helpers do

  def make_link(dir,file)
    relative = file.gsub(dir,"")
    "<a href='#{relative}'>#{relative}</a><br/>"
  end
  
end

