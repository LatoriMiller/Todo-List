#
def ask (question)
  puts question
  answer = gets.chomp
  return answer
end
#
# mood = ask ("How are you today?")
#
# puts mood

def createTodoList()
  todo_List = {:name => "", :todo_items => []}
  todo_List[:name] = ask("What is the name of your todo list")
  return todo_List
  # because ask() returns the answer it's value is stored in :name
end

def createTodoItem()
  todo_item = {:name => "", :complete => false}
  todo_item[:name] = ask("What do you want to add to the list?")
  return todo_item
  # because ask() returns the answer it's value is stored in :name
end

def printTodoList(todo_list)
  puts todo_list[:name]
  puts "-" * 20
  todo_list[:todo_items].each do |item|
    print item[:name]
    if item[:complete]
      print "[c]\n"
    else
      print "[i]\n"
    end
  end
end

def markComplete(todo_list)
  # ask user waht to complete
  answer = ask("Which item do you want to complete")
  # set flag to check if we found the item given
  found = false

  # loop through items and see if we can find the item
  todo_list[:todo_items].each do |item|
    if item.has_value? (answer)
      item[:complete]= true
      found = true
    end
  end
  if !found
    puts "Could not find the item"
  end
end

# create the todo List
myTodoList = createTodoList

# ask the user to add items until they say no
answer = ""
while answer != "n"
  myTodoList[:todo_items].push(createTodoItem())
  answer = ask("Add another item? (y/n)")
end

answer = ""
while answer != "n"
  printTodoList(myTodoList)
  markComplete(myTodoList)
  found_incomplete = false
  myTodoList[:todo_items].each do |item|
    if (item[:complete] == false)
      found_incomplete = true;
    end
  end
  if (found_incomplete)
    answer = ask("would you like to complete another item?(y/n?)")
  else
    puts "all items completed"
    exit
  end
end

printTodoList(myTodoList)
