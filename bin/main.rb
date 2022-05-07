require "../lib/load_addons.rb"
command = gets(chomp: true).to_sym
begin
Main.send(command)
rescue
begin
Main.const_get(command).new
rescue NameError
p "seems that command is nonexistant"
end
end

