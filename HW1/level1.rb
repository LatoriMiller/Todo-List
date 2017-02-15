def question
  puts("can we go to itchy land? yes or no? ")
  answer = gets
  checkAnswer(answer)
end

def checkAnswer(a)
  until a == "yes"
    question()
  end
end

question()

# Second Solution

puts("can we go to itchy land? yes or no? ")
answer = gets

def checkAnswer(a)
  until a == "yes"
    puts("can we go to itchy land? yes or no? ")
    answer = gets
  end
end

checkAnswer(answer)
