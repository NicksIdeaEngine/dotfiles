# WebDev Journey

**Summary:** Notes I took while watching [Traversy Media's "Web Development in 2020" video.](https://www.youtube.com/watch?v=0pThnRneDjw)

## Fundamentals

### HTML & CSS (13 days)

- [Semantic HTML5 elements](): 1 day (DONE!)
  - [article](): Specifies independent, self-contained content.  Should make sense on its own and be possible to distribute independently from the rest of the site.
    - Forum / blog posts, news stories, comments
  - [aside](): Defines some content aside from the content it is placed in.  Should relate to the surrounding content.
    - Sidebar, reference, etc
  - [details](): Specifies additional details that the user can view or hide on demand.  Can be used to create an interactive widget that can be opened or closed.  Content shouldn't be visible unless the open attribute is set.
  - [figcaption](): Defines a caption for a figure element.  Can be placed as the first or last child of the figure element.
  - [figure](): Specifies self-contained content, like illustrations, diagrams, photos, code listings, etc.  While content is related to the main flow, its position is independent of the main flow, and if removed shouldn't affect the flow of the document.
  - [footer](): Defines a footer for a document or section.  Should contain information about its containing element.  You can have several footer elements in a document.
    - Typically contains info on authorship, copyright, contact, sitemap, back to top links, related documents
  - [header](): Represents a container for introductory content or a set of nav links.
    - Typically contains one or more heading elements, logo or icon, authorship information.  You can have several header elements in one document.  Cannot be placed within a footer, address, or another header element.
  - [main](): Specifies the main content of a document.  Content inside should be unique to the document.  Shouldn't contain any content that is repeated across documents such as sidebars, navigation links, copyright info, site logos, and search forms.  No more than one main element in a document.  Must not be a descendant of an article, aside, footer, header, or nav element.
  - [mark](): Defines marked text.  Use if you want to highlight parts of your text.
  - [nav](): Defines a set of navigation links.  Not all links in a document should be inside of a nav element.  The nav element is intended only for major block of navigation links.  Browsers (like screen readers for disabled users) can use this element to determine whether to omit the initial rendering of this content.
  - [section](): Defines sections in a document, such as chapters, headers, footers, or any other sections of a document.
  - [summary](): Defines a visible heading for the details element.  The heading can be clicked to view/hide the details.
  - [time](): Defines a human-readable date/time.  Can be used to encode dates and times in a machine-readable way so that the user agents can offer to add birthday reminders or scheduled events to the user's calendar, and search engines can produce smarter search results.
- Basic CSS (positioning, box model, etc): 3 days
- Flexbox & CSS Grid: 5 days
- CSS Custom Properties (variables): 1 day
- CSS Transitions: 1 day
- Browser Dev Tools: 2 days

### Responsive Layout (7 days)

Responsive layouts are no longer luxury, they are a necessity

- Set viewport: 1 day
- Fluid widths: 2 days
- Media queries: 1 day
- rem over px: 1 day
- Mobile first, stacked columns: 2 days

### Sass Pre-Processor (6 days)

Create your own modular, reusable CSS components to use in your projects. Frameworks are less popular lately.

- Structured CSS: 1 day
- Variables: 1 day
- Conditionals: 1 day
- Nested CSS: 1 day
- Mixins & Functions: 1 day
- Inheritance: 1 day

### HTML / CSS Framework (5 days)

HTML / CSS frameworks are becoming a bit less relevant but you should still learn one.  They can make your life much easier and great for prototyping.

- Bootstrap: 2 days
- Tailwind CSS: 2 days
- Materialize: 1 day
- Bulma

### Vanilla JavaScript (11 days)

Learn JS without any library or framework

- Data types, functions, conditionals, loops, operators: 1 day
- DOM Manipulation & Events: 2 days
- JSON: 2 days
- Fetch API: 2 days
- ES6+ (Arrow functions, promises, async / await, destructuring): 4 days

### Git & Tooling (13 days)

Git is necessary for all web devs

- Git (version control): 1 day (DONE)
- Browser Dev Tools: 2 days
- VSCode Extensions: 1 day (DONE)
- Basic Command Line: 2 days (DONE)
- Emmet: 2 days (DONE)
- NPM or Yarn (installing packages): 1 day (DONE)
- Axios (http library similar to fetch api): 1 day
- Webpack or Parcel (module bundling): 1 day (DONE)
- Gulp or Grunt (task runners): 1 day (DONE)
- Editor Extensions (ESLint, Prettier, Live Server, etc): 1 day (DONE)

### Basic Deployment (5 days)

Learn to deploy static websites

- Register a domain name (Google Domains) (DONE)
- Manage shared hosting or VPS (Inmotion)
- FTP, SFTP File Upload (Filezilla): 1 day (DONE)
- Static Hosting (Need to know Git) (Netlify, Github Pages): 1 day (DONE)
- SSL Certificate: 1 day
- SSH (Secure Shell): 1 day
- CLI & Git: 1 day (DONE)

### Basic Front-End Web Developer

At this point you should be able to...

- Build websites for individuals & small businesses
- Create mobile friendly layouts
- Create CSS animations and effects
- Work with a CSS framework
- Add dynamic page functionality
- Build small client side apps with JavaScript
- Use your browsers dev tools
- Utilize Git for version control
- Deploy and maintain small projects

Make sure projects focus on these types of skills to make them shine.

#### SUB TOTAL TIME ESTIMATE:  60 DAYS

## What To Learn Next

What to do next depends on what you want to do.  You have a few choices.

- Front End JS Framework
- Server Side Language & Database

### Front End JS Framework (5 days)

- Very popular in the industry
- More interactive & interesting UIs
- Components & modular front end code
- Good for teams
- React: Most popular in the industry: 5 days
- Vue: Easy to use and really gaining traction
- Angular: Fading a bit: used in enterprise

### State Mangement (4 days)

For larger apps with a framework, you may need to learn methods to manage app-level state

- React: Redux, Context API with Hooks: 3 days
- Apollo (GraphQL Client)
- Vue: Vuex
- Angular: NGRX, Services
- Concepts: 1 day
  - Immutable State
  - Stores
  - Reducers
  - Mutations
  - Getters
  - Actions
  - Observables

### Full Fledged Front-End Web Developer (6 days)

- Build incredible front-end applications: 3 days
- Smooth & steady front-end workflow: 1 day
- Work well with teams & familiar with Git: 1 day
- Connect to backend APIs & work with data: 1 day
  You should be able to get a front-end job or work for yourself and do pretty well

#### GRAND TOTAL TIME ESTIMATE: 75 days

The rest of the video dives much deeper. Keep taking notes at Server Side Rendering (30:40)

https://www.youtube.com/watch?v=0pThnRneDjw
