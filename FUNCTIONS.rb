module Func
def add_item
    puts "What item would you like to add? Please use format 'add {food*container*description}'"
    print ">>"
    $devmode ? p("e") : item_add = gets.chomp
    item, container, desc = item_add.split("*")
    item = item.upcase.to_sym
    container = container.upcase.to_sym
    
end

def dev_tools
    $devmode = true
    
    #tests
    $devmode = false
end


def help_prompt
    puts "what command would you like help with? Please use format 'help {command}'"
    loop do
	print ">>"
	$devmode ? p("egg") : help_input = gets.chomp
	help_quit, command_modifier = help_input.split(" ")
	if help_quit == "help"
	    command_modifier = command_modifier.upcase.to_sym if command_modifier != nil
	    case command_modifier
		when :QUIT
		    puts "quits the current task you are doing right now, if you arent doing a task it exits the program"
		when :LIST
		    puts "lists out the type of items you have in your freezer, and the amount of those items"
		when :HELP
		    puts "displays this prompt"
		when :DEVTOOLS
		    puts "performs various tests to see if the program is functional"
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

def encrypt()

end

def decrypt()

end

def read(file)

end

end
