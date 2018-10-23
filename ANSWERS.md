# Q0: Why are these two errors being thrown?

It says "uninitialized constant HomeController::Pokemon" because we haven't created the model for pokemon yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear?

A random pokemon is chosen from a small list which is written in seeds.rb. The common factor is that the pokemon that appear are wild and
don't have a trainer.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

It creates a button that when pressed, will make a patch request, and thus call the capture function and giving the pokemon's id as an argument. 

# Question 3: What would you name your own Pokemon?

I would name it spicyboi

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

I passed '/trainers/' + params[:trainer_id]. The path needed to trainer's id in order to get back to the page it just came from.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

According the online ruby on rails guide, render creates a full response to send back to the browser. Basically, flash is a way to pass temporary primitive-types between actions. So we set the flash variable to create an alert, the message is stored at'layouts/messages', then render in application.html.erb actually renders it on the next page.

# Give us feedback on the project and decal below!

The project could have been more clear that the Pokemon controller name was supposed to be plural, because that caused issues for me later on and I had to backtrack. 

# Extra credit: Link your Heroku deployed app
