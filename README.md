# Create Rails Server
--- Terminal ---
1. cd <directory>
2. rails new <name>			# Create new rails project
3. cd <name>
4. code .					      # Open VS Code in current directory
5. rails server				  # Start server

# route root to 'home' page
--- VS Code ---
6. config > routes.rb
|-> Rails.application.routes.draw do
|     root 'pages#home'
|	end
http://localhost:3000: The action 'home' could not be found for ApplicationController

# Generate pages controller
--- Terminal ---
7. rails generate controller pages

# Create new action 'home'
--- VS Code ---
8. app > controllers > pages_controller.rb
|-> class ApplicationController < ActionController::Base
|	  def home
|	  end
|	end
http://localhost:3000: ApplicationController#hello is missing a template for request formats: text/html

9. Create app > views > pages > home.html.erb
10. app > views > pages > home.html.erb
|-> <h1>Hello World</h1>

# Initial commit
--- Terminal ---
11. git add -A                                                            # Begin tracking folder in wd
12. git status                                                            # Show files being tracked
13. git commit -m "Initial commit and add root route"                     # Commit to git
14. git status                                                            # "nothing to commit, working tree clean"

# Create GitHub respository
--- GitHub ---
15. Create repository
|-> Repository name: <name>
-- Terminal ---
16. git remote add origin git@github.com:EndikaPickering/alpha-blog.git   # Connect remote repository
17. git push -u origin main                                               # Push repository
zsh: error: src refspec main does not match any
error: failed to push some refs to 'github.com:EndikaPickering/alpha-blog.git'
18. git branch -M main                                                    # Merge branches to main?
17. git push -u origin main                                               # Push repository

# Route 'about' page
--- VS Code ---
18. config > routes.rb
|-> Rails.application.routes.draw do
|     root 'pages#home'
|     get 'about', to: 'pages#about'
|	end

# Create new action 'about'
--- VS Code ---
19. [STEP 8] home > about
20. [STEP 9] about.html.erb

#  Commit to git and github
--- Terminal ---
11. git add -A                                                            # Begin tracking folder in wd
12. git status                                                            # Show files being tracked
13. git commit -m "Add about page"                                        # Commit to git
18. git branch -M main                                                    # Merge branches to main?
14. git push                                                              # Push to github