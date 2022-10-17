# Objectives

This technical test is designed for you to show off your skills, and to highlight:

* Your architectural decisions. How you design the solution.
* Ability to write tests.
* Clean coding practices.

It is a frame of reference, from which you could go wherever you like. It is a starting point for our discussions in the technical interview

## SaaS Products Import

We update our inventory of SaaS products from several sources. Each source provides its content to us in a different format. Write a command line script to import the products.

Input/output should be as similar to this as possible:

````bash
$ getapp_import capterra feed-products/capterra.yaml

importing: Name: "GitHub";  Categories: Bugs & Issue Tracking, Development Tools; Twitter: @github
importing: Name: "Slack"; Categories: Instant Messaging & Chat, Web Collaboration, Productivity; Twitter: @slackhq
...

Final state:
[
  %{name: "Github", categories: "Bugs & Issue Tracking, Development Tools",  twitter: @github},
  %{name: "Slack", categories: "Instant Messaging & Chat, Web Collaboration, Productivity",  twitter: @slackhq},
  ...
]
````

Considerations:

* Currently, we are importing products from 2 sites: capterra and softwareadvice.  They send us their weekly feed via email. This week's files are in /feed-products.
* We plan to add a third provider soon who will make its feed available via csv output online via url (you don't need to implement this, just keep it in mind).
* The focus here should be on design, more than implementation. We are less interested in seeing that this works than in seeing how you approach the problem.
* Do not implement any data persistence code, but do use some kind of in memory store that hosts the imported data, and can be dumped at the end of the process. Keep in mind that the company is planning to switch from this implementation to Postgresql in 3 months.
* Please provide at least some unit tests (it is not required to write them for every module). Functional tests are also a plus.
* Please provide a short summary detailing anything you think is relevant, for example:
  * Installation steps
  * How to run your code / tests
  * Where to find your code
  * Was it your first time writing a unit test, using a particular framework, etc
  * What would you have done differently if you had had more time
  * Etc.

## Code Submission

As a result of this assignment we expect to receive a link to your **private** git repository (i.e. Github, Bitbucket or Gitlab). Having full commit history is optional but would be considered a plus.
