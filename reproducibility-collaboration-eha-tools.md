---
title: Tools and Best Practtices for Reproducible and Collaborative Analysis at EHA (DRAFT)
output:
  html_document: 
    toc: TRUE
---

# Overall Philosophy

The purpose of this document is to provide an outline of some of the best practices
we aim for in analytical projects at EHA and the tools we can use to achieve
them.  At a high-level, we aim for our work to be:

-  Self-contained
-  Well-documented and communicated
-  Easily reproducible
-  Sharable
-  Version controlled

Together, these attributes help assure that our work is correct, can be built 
off of and extended, meets requirements for sharing and publication, and can
be continued through staff turnover.  

You can find some slides from a previous presentation on this topic
[here](selfish-reproducibility-NR-2016-01-26.pdf)

*Feel free to edit this document [here](https://github.com/ecohealthalliance/eha-reproducibility/reproducibility-collaboration-eha-tools.Rmd)*

# Project/Folder Organization

-   *If I copied this whole folder onto someone else's computer, could they pick up the project?*
-   *Are the folder organization and file naming clear?*

Organize projects in a self-contained way, with clear separation between raw
data, processed data, exploratory analyses, and final products.

-   Some exceptions for large data sets or rapidly changing data sets.  In
    these cases, data can be organized as a separte folder/rpoject.
-   [A nice blog post about this](http://nicercode.github.io/blog/2013-05-17-organising-my-project/)
    -   [And a few more](https://discuss.ropensci.org/t/resources-on-project-directory-organization/340)
-   For anything using R (see below), [RStudio projects](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects) are a good idea for project organization.
    - [Software Carpentry Lesson on RStudio projects](http://swcarpentry.github.io/r-novice-gapminder/02-project-intro.html)

# Documentation

*Will someone understand this thing when I hand it over?*

Documentation is essential to collaboration and continuity for our work. Your
project should contain documentation to allow a project to be picked up by
another user. Documentation includes the following:

-   A **README** document in the top level of the project folder
    with a high-level explanation of project organization, purpose, and and contact info.
-   **Metadata** for your data set showing its origin and the type of data in
   each field in a table.
-   **Comments** in your computer code
-   **Written descriptions** of your analyses, in comments, additional files or
    literate code formats such as R Markdown

# Computational Tools and Scripted Analysis

*Can everything be re-done easily if I change one data point in the inputs?*

At EHA **R** is our primary, though not exclusive, tool for analysis and
modeling work.  R is not just a piece of software for statistics and data
manipulation but a computer language, meaning that analsyes are *scripted*
and thus can be automated, run again, built upon and extended.  

Some R resources:

-   [R itself](https://cran.r-project.org/)
-   [RStudio](https://www.rstudio.com/) is the leading development environment for
    R and highly recommended.
-   Learning R is beyond the scope of this document, but some good starting points
    are:
-  [The Software Carpentry Lessons](http://swcarpentry.github.io/r-novice-gapminder/) are a good introduction.
-  [The JHU Courera Series](https://www.coursera.org/specializations/jhu-data-science) is a good set of online courses.

#   Data Management

*Can the data be shared and published, and easily re-used in other analyses*?

-   Store data in simple, cross-compatible formats such as CSV files.
-   Microsoft Excel can be a useful tool for data entry and organization, but limit
    its use to that, and organize your data in a way that can be easily exported.
    -   [A Lesson on spreadsheet organization](http://www.datacarpentry.org/spreadsheet-ecology-lesson/)
-   Separate the data and the analysis.  (A separate data folder within the project)
-   Metadata! Metadata!  Document your data.
-   For data sets that cross multiple projects, create data-only project folders
    for the mater version.
     - Use version control and repositories for your data (git/GitHub)
     - Use specialized data repositories
    - [figshare](https://figshare.com/)
    - [zenodo](https://zenodo.org/)
    
## Version Control and Collaboration

-   *Can I go back to before I made that mistake?*
-   *Can others see changes others have made to the project and can I see theirs?*

**Version control** is essential to long-term project management and collaboration.

-   Google Docs/Word Track Changes are limited to *single documents*
-   Dropbox can track all files in a shared project/folder
    -   Allows one to view/revert to any previous version of a file in the folder
    -   Easily sharable
    -   Does not travel well - history is lost when project moves elsewhere
    -   File histories are independent - does not track interrelated changes.
-   git version control should be used for any project that contains more than
    one file of computer code.  It has a steep learning curve but is very powerful.
    -   A good video course: ([Part1](https://www.youtube.com/watch?v=IpUDlhh8I2E) / [Part2]([https://www.youtube.com/watch?v=S8TLL05qVFg))
    -   An interactive tutorial](https://try.github.io)
    -   [Getting git connected to RStudio](http://r-pkgs.had.co.nz/git.html)
-   [GitHub](http://github.com) is a web service for sharing git-versioned projects
    that has many great tools for collaboration.  We have an organizational account
    Setup GitHub account and ask **@toph** to add you and to it and the [M&A Team](https://github.com/orgs/ecohealthalliance/teams/modeling-analytics/repositories).
-   Avoid filename-based versioning (e.g., "data_set_v11_final_final_NR")

# Communication

*How do we work together and keep a useful record of our interactions?*

-   [Slack](https://eha.slack.com/) is our office chat tool and is good for
    day-to-day communication.  Since it is organized by topical _channels_,
    it is good for keeping information from one project together in a way
    that can be referenced later by new team members.
    -   We have an [#r-discuss channel](https://eha.slack.com/messages/r-discuss/)
    -   Surrounding text by triple backticks ( ` ``` `) makes it easy to share code.
    
-   [ScreenHero](https://eha.slack.com/screenhero), is a screen-sharing tool that
enables dual control of computer and is part of Slack.  Great for walking through a project with someone remotely or across the office, and also debugging.

-   GitHub has a good issue-tracking system that accompanies each project and
    can be used for task management and general communication.  This ties
    messages to a specific project and keeps a good long-term record, and can
    be integrated with e-mail.

# Computational Power

*How can I make this giant beast of a model run faster?*

-   Our Aegypti server has 40 cores and 250G of RAM, and can be accessed from
    anywhere, and has and easy-to-use RStudio interface. Let me know if you need
    to use it.

# Dependency Management

*How do I make sure that all my software and configurations needed for a project are portable?*

-   [Packrat](https://rstudio.github.io/packrat/) for R packages
-   [Docker](https://www.docker.com/) for everything
    -   [A lesson in user Docker for an R project](http://ropenscilabs.github.io/r-docker-tutorial/)

# Testing

*Is this code doing what I think its doing? Is this data correct*

-   R packages
    -   `assertr`, `visdat` for checking that data manipulations do what you think they do
    -   `testthat` for R packages
    -   Also `ensurer`, `testthat`, `validate`.




