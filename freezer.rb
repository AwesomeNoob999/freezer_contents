#require_relative "FUNCTIONS.rb"
#include Func

#todo: less global vars, expandability, make faster, possibly allow ability to read in scripts, add :DEVTOOLS back

ACTIONS = [:ADD_ITEM,:ADD_ITEMS_LIST,:REMOVE_ITEM,:REMOVE_ITEMS_LIST,:PURGE, :HELP, :LIST, :QUIT, :SAVE] #this is all the actions you can use

CONTAINERS = [:NONE, :CAN, :BAG, :CARTON, :JUG, :GALLON, :PLASTIC_CONTAINER, :PC, :STYROFOAM_CONTAINER, :SC, :BOX, :JAR, :UNDEFINED]

$contents = [] 

begin
    deep_freezer = File.open("contents.store", "a+")
    decrypt(deep_freezer.readlines)
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
	    p $contents
	when :HELP
	    help_prompt
	#when :DEVTOOLS
	#    dev_tools
	when :PURGE
	    purge_start(deep_freezer)
	when :REMOVE_ITEMS_LIST
	when :REMOVE_ITEM
	when :ADD_ITEMS_LIST
	    add_items_list
	when :ADD_ITEM
	    add_item
	when :QUIT, :EXIT
	    save(deep_freezer)
	    deep_freezer.close
	    break
	when :SAVE
	    save(deep_freezer)
    end
end
