todo:
- [ ] configure repo securely
  - [x] set up branch protection rules
  - [ ] setup actions to validate code?

- [x] think about core components
  - user panel
  - tasks
  - personal finances
  - habit tracker
  - gym tracker

- [ ] think about features for each component
  - [ ] user panel
  - [x] tasks
    - user can add a new task       - /v1/tasks/create
    - user can delete existing task - /v1/tasks/{task_id}/delete
    - user can modify existing task - /v1/tasks/{task_id}/update
    - user can list tasks           - /v1/tasks
    - user can mark task as completed
    - user can create a due date for the task
    - user can change importance of the task
    - user can categorize tasks
  - [ ] personal finances
  - [ ] habit tracker
  - [ ] gym tracker

- [ ] draw app wireframe

- [ ] fix docker image so it builds without cache
