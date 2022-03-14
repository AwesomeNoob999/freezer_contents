require_relative "FUNCTIONS.rb"
include Func
ACTIONS = [:ADD_ITEM,:ADD_ITEMS_LIST,:REMOVE_ITEM,:REMOVE_ITEMS_LIST,:PURGE,:UPDATE_TEST, :HELP, :LIST, :QUIT] #this is all the actions you can use
CONTAINERS = [:NONE, :CAN, :BAG, :CARTON, :JUG, :GALLON, :PLASTIC_CONTAINER, :PC, 
:STYROFOAM_CONTAINER, :SC, :BOX, :JAR, :UNDEFINED]
$buffer = {:test => {:amount => 0, :description => 
"this is a test item that isnt in your freezer, 
if you are seeing this, you have probs just installed this app, 
and if that is true, you can probably just use :PURGE 
and then add the items you have in your freezer.", :container => :NONE }}

begin
    deep_freezer = File.open("contents.store", "r+")
    contents = deep_freezer.read
rescue Errno::ENOENT
    deep_freezer = File.new("contents.store", "w+")
end

loop do
puts "what action do you want to perform?"
p ACTIONS
print ">"
user_input = gets.chomp
user_in = user_input.upcase.gsub(" ", "_").to_sym
case user_in
    when ACTIONS[7]
    when ACTIONS[6]
	help_prompt
    when ACTIONS[5]
    when ACTIONS[4]
    when ACTIONS[3]
    when ACTIONS[2]
    when ACTIONS[1]
    when ACTIONS[0]
    add_item
    when ACTIONS[8], :EXIT
    #do saving stuff
    exit
end
end
