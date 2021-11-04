# my-library

The target of this application is to give the user the possibility of traking her or his library, uploading, visualizing, editing and search for the books they previously created.

This application has been implemented in the [Phoenix](https://www.phoenixframework.org/) Elixir's framework, with the purpose of exploring it's potential for web application building.

## Installation

1. Install docker in your system
2. Install docker-compose:
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


$ sudo chmod +x /usr/local/bin/docker-compose
```
3. execute `$ docker-compose build` in the project root to build the image. Be patient :)
4. execute `$ docker-compose run` to start the container from the created image, executing the phoenix app.
5. access the application in *http://localhost:4001*


## Features:

In this first iteration, **my-library** has the following features:

- **Exploring** the library, searching for books by various of their fields.
- **Creating** new books with an image for the cover.
- **Editing** the information or the cover pic for existing books.
- **Deleting** books.

## TO-DOs

In the current iteration, there are the following important tasks to complete:

1.  **Form validation:** The information sent to the controllers *must* be validated, to avoid undesirable effects as data incoherence or security matters.

2. **Error handling:** Specially in Controllers, an error handling system *must* be implemented in order to redirect to error screens or to show flash instant messages, to inform the user about the error events, avoiding plain application crash.

3. **Unit Testing:** Unit Testing *must* be implemented, and a minimum coverage of 80% *should* be achieved in order to have a robust application and avoid code regressions.

4. **Pagination:** The list of books *must*
be paginated in order to have a more manageable interface and to avoid the previsible performance issues derivated of loading an humongous list of books from backend into the browser.

## Further development:

The following features and improvements are planned for future releases:

### Live Views:

In order to unleash all the power Phoenix has to build moder and reactive web applications, further investigation about Phoenix's [LiveView](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html) should be done. Once implemented, it will give us at least the following points of improvement:

**Completely reusable components**: The phoenix components implemented in *my-library* application, could be genuinelly reusable using an event oriented pattern. 

I.e: in the [BookCard](https://github.com/jologar/my-library/blob/main/lib/mylibrary_web/components/book_card_component.ex) component, when a click over it it's detected, without LiveView, the component itself is responsible of handling the action while it should be done by the controller hosting the view where the component is used.
Implementing Phoenix events there, will decouple reusable code from handling the results of the use of these components.

**Instantaneous form validation**: Right now, the forms are validated agains the changelog of the [Book](https://github.com/jologar/my-library/blob/main/lib/mylibrary/model/book.ex) Schema, thus the user needs to submit the form with all the values filled in to receive feedback about the input information.
The main idea is to make possible to have a live validation on the fields, debouncing the input information change done by the user and obtaining the needed feedback while her/he is filling the form.

**Cathegory search**: The user should have the possibility of managing her or his books easier, giving her or him the possibility of clasifying and, then, searching them by cathegory.
*Cathegory* will be a new schema in the system, related to the *Book* one in a many-to-one relatioship (one cathegory, many books). That should be that way, instead a simple string field in *Book*, to make the search more performant (it will be a foreign key and so, indexed), selectors in search and creation/edition forms more performant also, and it will provide an easier way of creating new cathegories and editing the existing ones.

**User session and authentication**: Although it's not an application that manages critical information, a login system should be provided not only to boost privacy, but also to make possible for the user to handle it's personal library. 
Achieved implementing a new *User* Schema, with username and password, the user then will be able to manage it's own books.

That can be achieved by two ways:

1. a many-to-one relationship between *User* and *Book*, and then returning a list per user, which will create an isolated set of books for each application user.
2. a many-to-many relationship between *User* and *Book*, creating a common and collaborative set of books for all users that could then be added to their respective personal libraries.
