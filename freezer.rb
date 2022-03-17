require_relative "FUNCTIONS.rb"
include Func

ACTIONS = [:ADD_ITEM,:ADD_ITEMS_LIST,:REMOVE_ITEM,:REMOVE_ITEMS_LIST,:PURGE,:DEVTOOLS, :HELP, :LIST, :QUIT, :SAVE] #this is all the actions you can use

CONTAINERS = [:NONE, :CAN, :BAG, :CARTON, :JUG, :GALLON, :PLASTIC_CONTAINER, :PC, :STYROFOAM_CONTAINER, :SC, :BOX, :JAR, :UNDEFINED]

$buffer = {
    :test => {
	:amount => 
	    0,
	:container => 
	    :NONE, 
	:description =>  
	    "this is a test item that isnt in your freezer, if you are seeing this, you have probs just installed this app, and if that is true, you can probably just use :PURGE and then add the items you have in your freezer."}}

$to_write = []

begin
    deep_freezer = File.open("contents.store", "r+")
    $contents = decrypt(deep_freezer.readlines)
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
	when :LIST
	when :HELP
	    help_prompt
	when :DEVTOOLS
	    dev_tools
	when :PURGE
	    purge_start(deep_freezer)
	when :REMOVE_ITEMS_LIST
	when :REMOVE_ITEM
	when :ADD_ITEMS_LIST
	when :ADD_ITEM
	    add_item
	when :QUIT, :EXIT
	    save
	    exit
	when :SAVE
	    save
    end
end
