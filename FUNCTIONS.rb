module Func
def add_item
    puts "What item would you like to add? Please use format 'add {food*container*description}'"
    print ">>"
    $devmode ? item_add="apple*bag" : item_add = gets.chomp
    item, container, desc = item_add.split("*")
    item = item.upcase.to_sym
    container = container.upcase.to_sym
    
end

def dev_tools
    $devmode = true
    help_prompt
    #tests
    $devmode = false
end

def help_devtool
    $iter += 1
    m = "#{if $iter-1 < ACTIONS.size; "help" ;else "quit" end} #{if $iter - 1 <= ACTIONS.size; ACTIONS[$iter-1]; else "" end}"
    puts "#{m}"
    m
end

def help_prompt
    $iter = 0
    puts "what command would you like help with? Please use format 'help {command}'"
    loop do
	print ">>"
	$devmode ? help_input=help_devtool : help_input = gets.chomp
	help_quit, command_modifier = help_input.split(" ")
	if help_quit == "help"
	    command_modifier = command_modifier.upcase.to_sym if command_modifier != nil
	    case command_modifier
		when :SAVE
		    puts "allows you to save the changes to the file, your changes are also saved when using the quit command"
		when :QUIT
		    puts "quits the current task you are doing right now, if you arent doing a task it exits the program"
		when :LIST
		    puts "lists out the type of items you have in your freezer, and the amount of those items"
		when :HELP
		    puts "displays this prompt"
		when :DEVTOOLS
		    puts "performs various tests to see if the program is functional"
		when :PURGE
		    puts "deletes all the information bout wha is in your freezer, DONT USE IF YOU DONT WANT TO DELETE EVERYTHING"
		when :REMOVE_ITEMS_LIST
		    puts "removes multiple items from your freezer"
		when :REMOVE_ITEM
		    puts "removes a single item from your freezer"
		when :ADD_ITEMS_LIST
		    puts "adds multiple items to your freezer"
		when :ADD_ITEM
		    puts "adds a single item to your freezer"
		else
		    puts "unknown command"
	    end
	elsif help_quit == "quit"
	    break
	else
	    puts "unknown command \"#{help_quit}\""
	end
    end
end

#done
def purge_start(file)
    puts "WARNING: purging will delete all info you could have possibly added, are you sure?"
    print "[y/N]:"
    purge = gets.chomp
    if purge == "" or purge.downcase == "n"
	puts "purge canceled"
    elsif purge.downcase == "y"
	file.truncate(0)
	puts "contents purged"
    else
	puts "purge canceled, unknown option entered"
    end
end

def encrypt(buffer)
    item = buffer.keys[0].to_s
    value = buffer.values[0].values[0].to_s
    container = buffer.values[0].values[1].to_s
    desc = buffer.values[0].values[2]
    "@#{item}*#{value}*{#{container}}*[#{desc}]"
end

def decrypt(freeze)
    for thing in freeze
	item, value, container, desc = thing.split("*")
	item = item.sub("@","").to_sym
	value = value.to_i
	container = container.sub(/"{}"/)
    end
end

def save
    
end

end
