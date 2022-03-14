module Func
def add_item
    puts "What item would you like to add? Please use format 'add {food.container.description}'"
    print ">>"
    item_add = gets.chomp
    
end

def add_item_convert( item, amount = 1, container = "undefined", desc = nil)
    item.upcase.to_sym
end

def help_prompt
    puts "what command would you like help with? Please use format 'help {command}'"
    loop do
	print ">>"
	help_input = gets.chomp
	help_quit, command_modifier = help_input.split(" ")
	if help_quit == "help"
	    command_modifier = command_modifier.upcase.to_sym if command_modifier != nil
	    case command_modifier
		when ACTIONS[8]
		    puts "quits the current task you are doing right now, if you arent doing a task it exits the program"
		when ACTIONS[7]
		    puts "lists out the type of items you have in your freezer, and the amount of those items"
		end
	elsif help_quit == "quit"
	    break
	else
	    puts "unknown command \"#{help_quit}\""
	end
    end
end

def encrypt()

end

def decrypt()

end

def read(file)

end

end
