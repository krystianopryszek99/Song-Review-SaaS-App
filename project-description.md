# Submission: Brief Project Description & Reflection

## Project Description 
This project is a Song Review SaaS application that uses the Ruby on Rails framework where you can review song details. The application uses the SQLite3 database which stores all the songs. The project contains basic CRUD operations such as create, read, update and delete. Users can filter songs by genre, and sort songs by the release date and title. The project also contains an additional feature that allows users to find songs by the same artist. Users can leave their opinion on a specific song by adding a brief description of it. 

The application includes a set of Cucumber BDD and RSpec tests. 

- Cucumber tests were used to test the additional feature (find songs by the same artist) and the filtering/sorting functionality. The additional feature contains four scenarios, both the happy and sad paths. It tests *"add artist to existing song"*, *"add artist to new song"*, *"find song with same artist"* and sad path *"can't find similar songs if we don't know artist"*. The filtering/sorting features contain two scenarios.

- RSpec tests were used to test the controller and model logic of the additional feature and the CRUD functionality to improve code coverage. 

The development of this project has been a massive learning experience and I truly enjoyed working on this project. I have improved my knowledge by using Ruby and understanding how important testing is. I have gained valuable experience by writing Cucumber and RSpec tests and understanding how they work. I believe that the experience and knowledge I have gained from this project will benefit me in my future career.
