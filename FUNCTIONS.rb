#module Func
def add_item
    puts "What item would you like to add? Please use format 'add {food*container*description}', leave the description field blank if there is none"
    print ">>"
    item_add = gets.chomp # $devmode ? item_add="apple*bag" : 
    command,item_add = item_add.sub(" ","!")
    command = command.upcase.to_sym
    case command
    when :ADD
    item, container, desc = item_add.split("*")
    item = item.upcase.to_sym
    container = container.upcase.to_sym
    pushed = []
    pushed.push(item).push(1).push(container).push(desc)
    for thing in $contents
	if thing[0] == pushed[0] and thing[2] == pushed[2] and thing[3] == pushed[3]
	    thing[1] += pushed[1]
	    within = true
	    break
	end
    end
    $contents << pushed if !within
    within = false
    when :QUIT
    break
    end
end

def remove_items_list
    puts "What items would you like to remove? Please use format 'remove {food*amount*container*description}', leave the description field blank if there is none"
    loop do
	break
    end
end

#def dev_tools
#    $devmode = true
#    help_prompt
#    #tests
#    $devmode = false
#end

#def help_devtool
#    $iter += 1
#    m = "#{if $iter-1 < ACTIONS.size; "help" ;else "quit" end} #{if $iter - 1 <= ACTIONS.size; ACTIONS[$iter-1]; else "" end}"
#    puts "#{m}"
#    m
#end

def help_prompt
#    $iter = 0
    puts "what command would you like help with? Please use format 'help {command}'"
    loop do
	print ">>"
	help_input = gets.chomp #	$devmode ? help_input=help_devtool : 
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
	$contents = []
	puts "contents purged"
    else
	puts "purge canceled, unknown option entered"
    end
end

def encrypt(buffer)
    buff = []
    for i in buffer
	item = i[0].to_s
	value = i[1].to_s
	container = i[2].to_s
	desc = i[3]
	buff << "@#{item}*#{value}*{#{container}}*[#{desc}]"
    end
    buff
end

def decrypt(freeze)
    for thing in freeze
	item, value, container, desc = thing.split("*")
	item = item.sub("@","").to_sym
	value = value.to_i
	container = container.delete("{}").to_sym
	desc = desc.delete("[]\n")
	desc = nil if desc == "" or desc == "\n"
	p [item,value,container,desc]
	$contents << [item,value,container,desc]
    end
end

def add_items_list
    puts "What item would you like to add? Please use format 'add {food*value*container*description}', leave the description field blank if there is none"
    loop do
	print ">>"
	item_add = gets.chomp #$devmode ? item_add="add apple*7*bag" : 
	item_add = item_add.sub(" ","!")
	command, item_add = item_add.split("!")
	command = command.upcase.to_sym
	if command == :ADD
	    item, value, container, desc = item_add.split("*")
	    item = item.upcase.to_sym
	    value = value.to_i
	    container = container.upcase.to_sym
	    pushed = []
	    pushed.push(item).push(value).push(container).push(desc)
	    for thing in $contents
		if thing[0] == pushed[0] and thing[2] == pushed[2] and thing[3] == pushed[3]
		    thing[1] += pushed[1]
		    within = true
		    break
		end
	    end
	    $contents << pushed if !within
	    within = false
	elsif command == :QUIT
	    break
	end
    end
end

def save(file)
    file.truncate(0)
    buffer = encrypt($contents)
    for i in buffer
	file.write(i+ "\n")
    end
end

#end
