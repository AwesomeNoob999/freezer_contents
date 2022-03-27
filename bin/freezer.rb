require_relative "../lib/functions"
include Func

#todo: expandability, make faster, possibly allow ability to read in scripts

ACTIONS = [:ADD_ITEM,:ADD_ITEMS_LIST,:REMOVE_ITEM,:REMOVE_ITEMS_LIST,:PURGE, :HELP, :LIST, :QUIT, :SAVE] #this is all the actions you can use

CONTAINERS = [:NONE, :CAN, :BAG, :CARTON, :JUG, :GALLON, :PLASTIC_CONTAINER, :PC, :STYROFOAM_CONTAINER, :SC, :BOX, :JAR, :UNDEFINED]

$contents = [] 

begin
    deep_freezer = File.open("../coolers/contents.store", "a+")
    decrypt(deep_freezer.readlines)
rescue Errno::ENOENT
    deep_freezer = File.new("../coolers/contents.store", "w+")
end

loop do
    puts "what action do you want to perform?"
    p ACTIONS
    print ">"
    user_input = gets(chomp: true)
    user_in = user_input.upcase.gsub(" ", "_").to_sym
    case user_in
	when :LIST
	    for i in $contents do p i end
	when :HELP
	    help_prompt
	when :PURGE
	    purge_start(deep_freezer)
	when :REMOVE_ITEMS_LIST
	    remove_items_list
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
