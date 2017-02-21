---
title: "EHA Modeling and Analytics Best Practices"
output:
  html_document:
    toc: TRUE
    toc_depth: 2
    keep_md: TRUE
    self_contained: FALSE
---

*Edit this document
[here](https://github.com/ecohealthalliance/eha-reproducibility/edit/gh-pages/reproducibility-collaboration-eha-tools.md)*.

Introduction
============

*What madness is this?*

This document is to provide an outline of the best practices for project
organization and programming we aim for our on the EHA Modeling &
Analytics team. In each topic below you'll find a general outline,
instructions for how to get set up on our various systems, and links to
more resources.

In general, we aim to produce sound analyses that are:

-   Self-contained
-   Well-documented and communicated
-   Easily reproducible
-   Sharable
-   Version controlled

Together, these attributes help assure that our work is correct, can be
built off of and extended, meets requirements for sharing and
publication, and can be continued through staff turnover.

The tools we use to accomplish this are mostly, but not exclusively,
based around the R programming language and git version control. Other
teams at EHA use other tools (e.g., the technology team mostly uses
Python and Javascript, much of our work with partners is MS Office
based).

The guidelines in the document represent an ideal we aim for but to not
always attain. Remember:

-   Best practices are always evolving.
-   Don't let the perfect be the enemy of the good.
-   Other teams and external partners have different workflows and we
    adjust as neccessary to collaborate.
-   Our goal is to do good science to advance conservation and human
    health, not be slick programmers.

You can find some slides from a previous presentation on this topic
[here](selfish-reproducibility-NR-2016-01-26.pdf).

The philosophy and guidelines in this document owe an enormous amount to
the work of the [Software and Data
Carpentry](http://software-carpentry.org/) and
[rOpenSci](http://ropensci.org/) organizations, and the work of [Hadley
Wickham](http://hadley.nz/) and [Jenny
Bryan](http://www.stat.ubc.ca/~jenny/). You'll find many links to their
work below.

R and Reproducible Analysis
===========================

*Can everything be re-done easily if I change one data point in the
inputs?*

At EHA **R** is our primary, though not exclusive, tool for analysis and
modeling work. R is not just a piece of software for statistics and data
manipulation but a computer language, meaning that analsyes are
*scripted* and thus can be automated, run again, built upon and
extended.

### Install

-   [R itself](https://cran.r-project.org/)
-   [RStudio](https://www.rstudio.com/), the leading R
    development environment.

### Learn

Learning R is beyond the scope of this document, and you likely already
have some experience in it, but some good starting points are:

-   [The Software Carpentry
    Lessons](http://swcarpentry.github.io/r-novice-gapminder/)
-   [Swirl](http://swirlstats.com/), a set of interactive lessons run
    right in R.
-   [The JHU Courera
    Series](https://www.coursera.org/specializations/jhu-data-science)

-   [R for Data Science by Hadley Wickam](http://r4ds.had.co.nz/) is a
    beginner/intermediate text that we highly recommend for getting up
    to speed with the particular workflows we recommend and the most
    recent packages that support them.

-   [Advanced R (Wickham)](http://adv-r.had.co.nz/) is very good for
    understanding how the language works.
-   [Efficient R by Colin Gillespie and Robin
    Lovelace](https://csgillespie.github.io/efficientR/) is helpful for
    imporving workflows and speeding up code.
-   [R Packages (Wickham)](http://r-pkgs.had.co.nz/) is good for
    package development.
-   [Cheatsheets](https://www.rstudio.com/resources/cheatsheets/) from
    RStudio are a useful references for a number of things.

Project/Folder Organization
===========================

-   *If I copied this whole folder onto someone else's computer, could
    they pick up the project?*
-   *Are the folder organization and file naming clear?*

We aim to organize projects in a self-contained way, with clear
separation between raw data, processed data, exploratory analyses, and
final products.

-   Some exceptions for large data sets or rapidly changing data sets.
    In these cases, data can be organized as a separate folder
    or poject.
    -   In many cases it is actually best for data to be organized as a
        *separate project* from analysis. This allows multiple analysis
        projects to rely on the same upstream data project, avoiding
        multiple versions of data. In these cases the "data" project
        should include raw data, aggregation and cleaning, and its
        output will be cleaned but complete (not summarized data).
        Analysis projects can import this data as a first step.

### Learn

-   Here is [a nice blog post about project
    structure](http://nicercode.github.io/blog/2013-05-17-organising-my-project/)
    and a few more
    [alternatives](https://discuss.ropensci.org/t/resources-on-project-directory-organization/340).
-   For anything using R, [RStudio
    projects](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects)
    are a good idea for project organization. Here's a [Software
    Carpentry Lesson on RStudio
    projects](http://swcarpentry.github.io/r-novice-gapminder/02-project-intro/).

Communication
=============

*How do we work together and keep a useful record of our interactions?*

-   [Slack](https://eha.slack.com/) is our office chat tool and is good
    for day-to-day communication. Slack does not have to be an instant
    communication tool - some people prefer to check it a few times
    a day. Check with your supervisor about your
    project/team preferences. Slack's main purpose is to organize our
    communication by *channels* specific to a topic or project. It is
    good for keeping information from one project together in a way that
    can be referenced later by new team members, rather than being lost
    in various e-mail inboxes. A channel can be linked to many other
    tools (Dropbox/Google Drive Folder, GitHub Repository), so as to
    have a central hub for project management. E-mails can be forwarded
    to a channel.

-   GitHub ([see below](#version-control-and-collaboration)) has a good
    issue-tracking system that accompanies each project and can be used
    for task management and general communication. This ties messages to
    a specific project and keeps a good long-term record, and can be
    connected to a slack channel or integrated with e-mail
-   Remember that your Slack and GitHub communications are part of the
    project and are likely to be seen by internal and
    external collaborators.
-   [ScreenHero](https://eha.slack.com/screenhero) is a screen-sharing
    tool that enables dual control of computer and is part of Slack. It
    is great for walking through a project with someone remotely or
    across the office, and also debugging.

### Install

-   Download and install [Slack](https://slack.com/downloads) and
    [ScreenHero](https://eha.slack.com/screenhero). Contact
    [Toph](mailto:allen@ecohealthalliance.org) (Tech), or
    [Noam](mailto:ross@ecohealthalliance.org) (Modeling & Analytics) to get
    an account. Join any appropriate channels.
-   There's also a mobile Slack app for
    [iOS](https://itunes.apple.com/us/app/slack-team-communication/id618783545?mt=8)
    and
    [Android](https://play.google.com/store/apps/details?id=com.Slack&hl=en),
    which may be helpful if you are traveling.

Documentation
=============

*Will someone understand this thing when I hand it over?*

Documentation is essential to collaboration and continuity for our work.
Your project should contain documentation to allow a project to be
picked up by another user. Documentation includes the following:

-   A **README** document in the top level of the project folder with a
    high-level explanation of project organization, purpose, and and
    contact info.
-   **Metadata** for your data set showing its origin and the type of
    data in each field in a table.
-   **Comments** in your computer code
-   **Written descriptions** of your analyses. The primary medium for
    this should be **R Markdown** documents, which allow you to combine
    code, results, and descriptive text in an easy to update and
    modify form. Shorter ephermal results can be posted as plots to
    your project Slack rooms.

### Learn

-   R Markdown is pretty straightforward to learn. You can create your
    first document and get the basics by going to File &gt; New
    File &gt; R Markdown in the RStudio menu. When you have time, dive
    in a bit more with [this great lesson on
    it](http://rpubs.com/marschmi/RMarkdown) with accompanying
    [video](https://www.youtube.com/watch?v=WFAHJ0NHOEQ&feature=youtu.be).
    Here's an [RStudio Reference
    Sheet](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)
    for R Markdown.

### Install

-   (Very optional unless you are asked): [**ehastyle**](https://github.com/ecohealthalliance/ehastyle) is our
    internal EHA R package with R Markdown templates for some reports we produce.

Data Management
===============

*Can the data be shared and published, and easily re-used in other
analyses*?

-   Store data in simple, cross-compatible formats such as CSV files.
-   Microsoft Excel can be a useful tool for data entry and
    organization, but limit its use to that, and organize your data in a
    way that can be easily exported.
-   Metadata! Metadata! Document your data.
-   For data sets that cross multiple projects, create data-only project
    folders for the master version. When these data sets are finalized,
    they can be deposited in public or private data repositories such as
    [figshare](https://figshare.com/) and [zenodo](https://zenodo.org/).
    In some cases it makes sense for us to create data-only R packages
    for easily distributing data internally and externally.

We aim to generally work in a **tidy data** framework. This approach to
structuring data makes iteroperability between tools easier.

### Learn

-   Read Hadley Wickham's [tidy data
    paper](http://vita.had.co.nz/papers/tidy-data.pdf) for the
    general concept.  Note the *packages* in this paper are out of date,
    but the structures and concepts apply.
-   [R For Data Science](http://r4ds.had.co.nz/tidy-data.html) is a
    great online book to read and reference for working in
    this framework, and gives guidance for the most up-to-date packages
    (**tidyr** being the latest analogue of **reshape** and **reshape2**).
-   Data Carpentry has [a Lesson on spreadsheet
    organization](http://www.datacarpentry.org/spreadsheet-ecology-lesson/)
    for when you need to do some work in Excel but make it compatible
    with R.
-   [Nine simple ways to make it easier to (re)use your
    data](http://ojs.library.queensu.ca/index.php/IEE/article/view/4608/4898)
    rounds some things out in terms of data sharing.  [This post](https://dynamicecology.wordpress.com/2016/08/22/ten-commandments-for-good-data-management/) is nice, too.

### Install

Get the
[**tidyverse**](https://cran.r-project.org/web/packages/tidyverse/index.html)
package for R using `install.packages("tidyverse")`. This will install
several other relevant packages.

Version Control and Collaboration
=================================

-   *Can I go back to before I made that mistake?*
-   *Can others see changes others have made to the project and can I
    see theirs?*

**Version control** is essential to long-term project management
and collaboration. We primarily use git for this - we recommend it
for any project with more than one file of code. It has a steep learning curve
but is very powerful.

-   [GitHub](http://github.com) is a web service for sharing
    git-versioned projects that has many great tools for collaboration.
    We have an organizational GitHub account so we can have private repositories
    and work in teams with shared projects.

-   For projects with little code-based work, there are other options,
    as well:
    -   Google Docs/Word Track Changes are limited to *single documents*
    -   Dropbox can track all files in a shared project/folder
        -   Allows one to view/revert to any previous version of a file
            in the folder
        -   Easily sharable
        -   Does not travel well - history is lost when project moves
            elsewhere
        -   File histories are independent - does not track
            interrelated changes.
            
-   Avoid filename-based version control: 

    ![](http://www.phdcomics.com/comics/archive/phd052810s.gif)

### Learn

Git has a steep learning curve and we recommend you spend some time
learning rather than only trying to pick it up as you go along.

-   Here is a good video course
    ([Part1](https://www.youtube.com/watch?v=IpUDlhh8I2E) /
    [Part2](https://www.youtube.com/watch?v=S8TLL05qVFg)), based on
    the [Software Carpentry
    curriculum](http://software-carpentry.org/lessons/).  (Links to the syllabus
    are in the notes below the videos.)
-   [Happy Git with R](http://happygitwithr.com/) is a great reference
    for the nuts and bolts of connecting your git, GitHub and R
    workflows

### Install

-   Go through the installation steps [Happy Git with
    R](http://happygitwithr.com/)'s "Installation" and "Connect"
    chapters and Appendix B
-   Note when setting up your GitHub account that one account can have multiple
    e-mail addresses associated with it, so you can split your work and personal
    stuff without needing multiple accounts (see [here](https://help.github.com/articles/managing-notification-emails-for-organizations/)).
-   Give [Noam](ross@ecohealthalliance.org) (Modeling & Analytics) or
    [Toph](allen@ecohealthalliance.org) (Tech), your GitHub username so
    they can make you a member of the [organizational EHA
    account](https://github.com/ecohealthalliance) and be given access
    to the appropriate teams.
-   If you are using a GitHub account you previously created with another
    e-mail, be sure to add your EHA e-mail under [Email Settings](https://github.com/settings/notifications)
    and set "Custom Routing" under [your notification settings](https://github.com/settings/notifications)
    so that notifications related to the EHA organization go to your EHA
    e-mail.
-   Install Dropbox on your computer with your EHA account (note you can
    have separate personal and EHA Dropbox folders)
-   Check that your EHA email gives you access to Google Drive. If you
    prefer it, or your supervisor specifies it, [install it locally on
    your computer](https://tools.google.com/dlpage/drive)

Reviewing Analyses and Code
===========================

-   *Has my work recieved feedback? Has a second set of eyes checked it
    for correctness?*
-   *Have I learned from my colleagues' work?*

Just like any piece of writing that you do, your analysis code should be
reviewed by a peer or supervisor. There are generally two types of code
reviews we engage in:

-   **Unit reviews** are reviews of discrete, small parts of a project.
    This might be an analysis that you took a few days or a couple of
    weeks to complete, and consists of 1-2 files or a few dozen to
    hundred lines of code. When you complete such a discrete unit, you
    should solicit feedback.
-   **Project reviews** are reviews of a whole project as it wraps up,
    such as prior to the submission of a manuscript. These reviews aim
    to check that the project is complete, understandable
    and reproducible.

Reviews can be either

-   **In person reviews** where you go over your code with your team or
    at our informal science meetings. ScreenHero can also be used
    for this.
-   **Written reviews** where a peers place comments in your code or use
    the commenting and reviewing features on GitHub.

or both.

### Learn

-   Check out Fernando Perez's [tips for code review in the
    lab](http://fperez.org/py4science/code_reviews.html).
-   Read the [Mozilla Guide to Code Review in the
    Lab](https://mozillascience.github.io/codeReview/intro.html)
-   Check out some [rOpenSci package review
    examples](https://github.com/ropensci/onboarding/issues?q=is%3Aissue+is%3Aclosed)
    to look at one kind of code review in action.
-   Best practices for this are evolving. Check out [a recent conversation
    among scientists on Twitter on the topic](https://twitter.com/noamross/status/776087608468307970)

Testing
=======

*Is this code doing what I think its doing? Is this data correct*

Most code should be accompanied by some form of testing. This scales
with the size and type of project. Your work should generally
accompanied with testing code or outputs that show that your models
behave appropriately, are statisically sound, that your code is running
as you expect and your data is checked for quality.

### Learn

-   [Test driven data
    analysis](http://www.tdda.info/pages/table-of-contents.html#table-of-contents)
    is a neat blog on this subject.
-   There's a [testing chapter in the R Packages
    book](http://r-pkgs.had.co.nz/tests.html).
-   The vingettes and README files of the packages below are useful.

### Install

-   R packages: [**assertr**](https://github.com/ropenscilabs/assertr/)
    or
    [**validate**](http://www.markvanderloo.eu/yaRb/2016/03/25/easy-data-validation-with-the-validate-package/)
    for testing that data meets criteria
    [**visdat**](https://github.com/njtierney/visdat) for visually
    inspecting tabular data. (though there are many ways to plot your data for inspection). [**testthat**]() for functions and
    R packages.

Running Big Analyses
====================

*How can I make this giant beast of a model run faster?*

-   Our Aegypti server has 40 cores and
    250G of RAM, and can be accessed from anywhere, and has and
    easy-to-use RStudio interface. It's a good go-to for most biggish
    analyses you might do.
-   The server is generally most useful if you can parallelize your R
    code across many processors . It's also useful if you have jobs that
    need a large amount of memory (often big geospatial analyses), or
    just something that needs to run all weekend while your computer
    does other things.
-   We have an #eha-servers Slack room, for coordinating use of this and other
    servers check in there if you have questions or before running a big
    job.
-   We also have accounts for Amazon Web Services for
    appropriate projects.

### Install

-   Contact [Noam](mailto:ross@ecohealthalliance.org) for access to this
    machine and he will create an account and password for you and give
    you further instructions.
-   Log on to the RStudio server interface by pointing your browser at http://aegypti.ecohealthalliance.org:8787/.
    For SSH-based access just use `aegypti.ecohealthalliace.org` from the terminal.
-   You will use GitHub to move project work back and forth from your
    local machine. You will need to setup GitHub access from this
    machine using SSH keys as described in [Happy Git with R Chapter
    12](http://happygitwithr.com/ssh-keys.html). You'll also have to set
    up your tokens [Appendix
    B](http://happygitwithr.com/github-pat.html) again.

### Learn

-   [Chapter 7.4 of *Efficient
    R*](https://csgillespie.github.io/efficientR/performance.html#performance-parallel)
    provides a brief introduction to parallelization.
-   Not everything can be done from the RStudio server interface on
    the server. If you are not familiar with the shell interface, brush
    up via [this Software Carpentry
    lesson](http://swcarpentry.github.io/shell-novice/). Look at this
    [chapter](http://v4.software-carpentry.org/shell/ssh.html) from an
    old version of the lesson for instructions on using the Secure
    Shell (SSH) to login to the server remotely and setting up keys so
    you don't have to enter your password every time.
-   Other helpful things you might look into are [tmux](https://tmux.github.io/)
    for keeping shell processes running when you log off (already installed), and
    [SSH config files](http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/) for simplifying shell logon.

Dependency Management
=====================

*How do I make sure that all my software and configurations needed for a
project are portable?*

-   [Packrat](https://rstudio.github.io/packrat/) or [checkpoint](https://CRAN.R-project.org/package=checkpoint) to fix R package versions.
-   [Docker](https://www.docker.com/) for everything
    -   [A lesson in user Docker for an R
        project](http://ropenscilabs.github.io/r-docker-tutorial/)
-   Makefiles can automate a complex, multipart project. Here's [a
    lesson on them from Software
    Carpentry](http://swcarpentry.github.io/make-novice/)

-   R packages can be a useful project output. We have some in-house R
    packages to provide access to internal data and generate reports,
    and may be developing more for external audiences. Hadley Wickham's
    [R Packages Book](http://r-pkgs.had.co.nz/) provides guidance for
    these, and we expect our packages to be up to [rOpenSci
    standards](https://github.com/ropensci/onboarding).

Ongoing Help and Training
=========================

*How do I solve this problem? How do I get my skills up to snuff?*

We have an **\#r-discuss** channel on Slack to ask questions and also
news about useful resources and packages. (There's also
**\#python-discuss** and **\#stats-chat**.) We prefer that you ask
question on this channel rather than privately. This way you draw on the
group's knowledge, and everyone can learn from the conversation. In general, if
you spend 20 minutes banging your head against your screen trying to
figure something out, it's time to ask someone.

Some good questions for the Slack room:

-   Which package should I use for [something]?
-   Anyone have a good reference or tutorial for [package, method]?
-   What does this error mean?
-   W.

    T.

    actual

    F.

Our technology team are a tremendous resource for a number of computing
topics (especially web technologies and development operations), but
remember that they are our collaborators, not IT support. (We do have
straight IT support, mostly for office network issues, through [Profound
Cloud](https://support.profoundcloud.com/home))

Also, outside EHA:

-   Stack Overflow is a popular Q&A site for computer programming that a
    lot of [discussions about
    R](https://stackoverflow.com/questions/tagged/r?sort=newest&pagesize=50).
-   The [\#rstats hashtag](https://twitter.com/hashtag/rstats) on
    Twitter is a good place for news and short questions, and general ranting.

If there's a course, workshop, or conference you want to attend to
improve these skills, speak with your supervisor, we can often support
this.
