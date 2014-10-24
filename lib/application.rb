require_relative '..\setup'

def command_help
  puts "new - Create a new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "find - Find a contact"
  puts "help - display command list"
  puts "update - update an existing contact"
end

def command_new
  puts "Enter first name"
    ifirst = $stdin.gets.chomp
  puts "Enter last name"
    ilast = $stdin.gets.chomp
  puts "Enter email address"
    iemail = $stdin.gets.chomp
  puts "Enter phone number"
    iphone = $stdin.gets.chomp

  new_contact = Contact.create(first_name: ifirst, last_name: ilast, email: iemail, phone: iphone)
  puts "#{ifirst} was added to the database!"
end

def command_list
  pp Contact.all
end

def command_show
  puts "Enter ID of contact you wish to show"
    contact_input = $stdin.gets.chomp
  contact_to_show = Contact.find(contact_input)
  puts contact_to_show[:first_name]
end

def command_find
  puts "Enter element of contact you wish to find"
    contact_find = $stdin.gets.chomp
    puts Contact.where("first_name LIKE '#{contact_find}' OR last_name LIKE '#{contact_find}' OR email LIKE '#{contact_find}' OR phone LIKE '#{contact_find}'")
end

def command_update 
  puts "Enter ID of contact you wish to update"
    update_id = $stdin.gets.chomp
  puts "Which field do you wish to update? (firstname, lastname, email, phone)"
    update_field = $stdin.gets.chomp  
  puts "Enter your replacement"
    replacement = $stdin.gets.chomp

  to_update = Contact.find(update_id)
  if update_field == "firstname" then to_update.update(first_name: "#{replacement}") end
  if update_field == "lastname" then to_update.update(last_name: "#{replacement}") end
  if update_field == "email" then to_update.update(email: "#{replacement}") end
  if update_field == "phone" then to_update.update(phone: "#{replacement}") end
end


class Application
  def self.run(args)
    @args = args
    @command = @args[0]
    if @command == "help"    then command_help   end
    if @command == "new"     then command_new    end
    if @command == "list"    then command_list   end
    if @command == "show"    then command_show   end
    if @command == "find"    then command_find   end
    if @command == "update"  then command_update end
  end
end

Application.run(ARGV)