# ES/CQRS in ELIXIR with commanded

## A simple phoenix application (Todo app) that uses [commanded](https://github.com/commanded/commanded).

### The app only implements 2 api endpoints:
- get '/api/tasks' - returns all the tasks
- post '/api/tasks' - add new task to the app.

## The app has:
- Command - AddTask
- Event - TaskAdded
- Projector - handle _TaskAdded_ event and insert new task to the db.