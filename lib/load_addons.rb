module Main
def change_addon_path
Addonpath[0] = "../#{gets(chomp: true).gsub(" ","_")}/"
end
end
Addonpath = ["../addons/"]
Dir.each_child(Addonpath[0]) {|child| if child.split(".")[1] == "rb" or child.split(".")[1] == "ruby"; require_relative "#{Addonpath[0] + child}" end and p child}


