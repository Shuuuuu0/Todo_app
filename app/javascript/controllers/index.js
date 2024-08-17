// app/javascript/controllers/index.js

import { Application } from "@hotwired/stimulus";
import TodoController from "./todo_controller";

const application = Application.start();
application.register("todo", TodoController);
