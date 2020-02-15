<p align="center">
  <img src="git-cop.png" alt="Git Cop Icon"/>
</p>

# Git Cop

[![Gem Version](https://badge.fury.io/rb/git-cop.svg)](https://badge.fury.io/rb/git-cop)
[![Code Climate Maintainability](https://api.codeclimate.com/v1/badges/d312f4724004dc691afc/maintainability)](https://codeclimate.com/github/bkuhlmann/git-cop/maintainability)
[![Code Climate Test Coverage](https://api.codeclimate.com/v1/badges/d312f4724004dc691afc/test_coverage)](https://codeclimate.com/github/bkuhlmann/git-cop/test_coverage)

[![Circle CI Status](https://circleci.com/gh/bkuhlmann/git-cop.svg?style=svg)](https://circleci.com/gh/bkuhlmann/git-cop)
[![Travis CI Status](https://travis-ci.org/bkuhlmann/git-cop.svg?branch=master)](https://travis-ci.org/bkuhlmann/git-cop)
[![Netlify CI Status](https://api.netlify.com/api/v1/badges/d4a15c9c-46ba-49db-9f31-33f389ee3259/deploy-status)](https://app.netlify.com/sites/git-cop/deploys)

A command line interface for linting Git commits. Ensures you maintain a clean, easy to read, and
debuggable project history.

<!-- Tocer[start]: Auto-generated, don't remove. -->

## Table of Contents

  - [Features](#features)
  - [Screencasts](#screencasts)
  - [Requirements](#requirements)
  - [Setup](#setup)
    - [Install](#install)
    - [Configuration](#configuration)
      - [Enablement](#enablement)
      - [Severity Levels](#severity-levels)
      - [Regular Expressions](#regular-expressions)
    - [Rake](#rake)
  - [Usage](#usage)
    - [Command Line Interface (CLI)](#command-line-interface-cli)
    - [Git Hooks](#git-hooks)
      - [Commit Message](#commit-message)
      - [Post Commit](#post-commit)
    - [Continuous Integration (CI)](#continuous-integration-ci)
      - [Circle CI](#circle-ci)
      - [Netlify CI](#netlify-ci)
      - [Travis CI](#travis-ci)
  - [Cops](#cops)
    - [Commit Author Capitalization](#commit-author-capitalization)
    - [Commit Author Email](#commit-author-email)
    - [Commit Author Name](#commit-author-name)
    - [Commit Body Bullet](#commit-body-bullet)
    - [Commit Body Bullet Capitalization](#commit-body-bullet-capitalization)
    - [Commit Body Bullet Delimiter](#commit-body-bullet-delimiter)
    - [Commit Body Issue Tracker Link](#commit-body-issue-tracker-link)
    - [Commit Body Leading Line](#commit-body-leading-line)
    - [Commit Body Line Length](#commit-body-line-length)
    - [Commit Body Paragraph Capitalization](#commit-body-paragraph-capitalization)
    - [Commit Body Phrase](#commit-body-phrase)
    - [Commit Body Presence](#commit-body-presence)
    - [Commit Body Single Bullet](#commit-body-single-bullet)
    - [Commit Subject Length](#commit-subject-length)
    - [Commit Subject Prefix](#commit-subject-prefix)
    - [Commit Subject Suffix](#commit-subject-suffix)
    - [Commit Trailer Collaborator Capitalization](#commit-trailer-collaborator-capitalization)
    - [Commit Trailer Collaborator Duplication](#commit-trailer-collaborator-duplication)
    - [Commit Trailer Collaborator Email](#commit-trailer-collaborator-email)
    - [Commit Trailer Collaborator Key](#commit-trailer-collaborator-key)
    - [Commit Trailer Collaborator Name](#commit-trailer-collaborator-name)
  - [Style Guide](#style-guide)
    - [General](#general)
    - [Commits](#commits)
    - [Branches](#branches)
    - [Tags](#tags)
    - [Rebases](#rebases)
    - [Hooks](#hooks)
    - [Code Reviews](#code-reviews)
    - [GitHub](#github)
  - [Tests](#tests)
  - [Versioning](#versioning)
  - [Code of Conduct](#code-of-conduct)
  - [Contributions](#contributions)
  - [License](#license)
  - [History](#history)
  - [Credits](#credits)

<!-- Tocer[finish]: Auto-generated, don't remove. -->

## Features

- Enforces a [Git Rebase Workflow](http://www.bitsnbites.eu/a-tidy-linear-git-history).
- Enforces a clean and consistent Git commit history.
- Provides Continuous Integration (CI) build server support.
- Provides Git Hook support for local use.
- Provides a customizable suite of style cops.

## Screencasts

[![asciicast](https://asciinema.org/a/277713.svg)](https://asciinema.org/a/277713)

## Requirements

1. [Ruby 2.7.x](https://www.ruby-lang.org) (or higher)

## Setup

### Install

Type the following to install:

    gem install git-cop

### Configuration

This gem can be configured via a global configuration:

    ~/.config/git-cop/configuration.yml

It can also be configured via [XDG](https://github.com/bkuhlmann/xdg) environment variables.

The default configuration is:

    :commit_author_capitalization:
      :enabled: true
      :severity: :error
    :commit_author_email:
      :enabled: true
      :severity: :error
    :commit_author_name:
      :enabled: true
      :severity: :error
      :minimum: 2
    :commit_body_bullet:
      :enabled: true
      :severity: :error
      :excludes:
        - "\\*"
        - "•"
    :commit_body_bullet_capitalization:
      :enabled: true
      :severity: :error
      :includes: "\\-"
    :commit_body_bullet_delimiter:
      :enabled: true
      :severity: :error
      :includes: "\\-"
    :commit_body_issue_tracker_link:
      :enabled: true,
      :severity: :error
      :excludes:
        - "(f|F)ix(es|ed)?\\s\\#\\d+"
        - "(c|C)lose(s|d)?\\s\\#\\d+"
        - "(r|R)esolve(s|d)?\\s\\#\\d+"
        - "github\\.com\\/.+\\/issues\\/\\d+"
    :commit_body_leading_line:
      :enabled: false
      :severity: :warn
    :commit_body_line_length:
      :enabled: true
      :severity: :error
      :length: 72
    :commit_body_paragraph_capitalization:
      :enabled: true
      :severity: :error
    :commit_body_phrase:
      :enabled: true
      :severity: :error
      :excludes:
        - "absolutely"
        - "actually"
        - "all intents and purposes"
        - "along the lines"
        - "at this moment in time"
        - "basically"
        - "each and every one"
        - "everyone knows"
        - "fact of the matter"
        - "furthermore"
        - "however"
        - "in due course"
        - "in the end"
        - "last but not least"
        - "matter of fact"
        - "obviously"
        - "of course"
        - "really"
        - "simply"
        - "things being equal"
        - "would like to"
        - "/\\beasy\\b/"
        - "/\\bjust\\b/"
        - "/\\bquite\\b/"
        - "/as\\sfar\\sas\\s.+\\sconcerned/"
        - "/of\\sthe\\s(fact|opinion)\\sthat/"
    :commit_body_presence:
      :enabled: false
      :severity: :warn
      :minimum: 1
    :commit_body_single_bullet:
      :enabled: true
      :severity: :error
      :includes: "\\-"
    :commit_subject_length:
      :enabled: true
      :severity: :error
      :length: 72
    :commit_subject_prefix:
      :enabled: true
      :severity: :error
      :includes:
        - Fixed
        - Added
        - Updated
        - Removed
        - Refactored
    :commit_subject_suffix:
      :enabled: true
      :severity: :error
      :excludes:
        - "\\."
        - "\\?"
        - "\\!"
    :commit_trailer_collaborator_capitalization:
      :enabled: true
      :severity: :error
    :commit_trailer_collaborator_duplication:
      :enabled: true
      :severity: :error
    :commit_trailer_collaborator_email:
      :enabled: true
      :severity: :error
    :commit_trailer_collaborator_key:
      :enabled: true
      :severity: :error
      :includes:
        - "Co-Authored-By"
    :commit_trailer_collaborator_name:
      :enabled: true
      :severity: :error
      :minimum: 2

Feel free to take this default configuration, modify, and save as your own custom
`configuration.yml`.

#### Enablement

By default, most cops are enabled. Accepted values are `true` or `false`. If you wish to disable a
cop, set it to `false`.

#### Severity Levels

By default, most cops are set to `error` severity. If you wish to reduce the severity level of a
cop, you can set it to `warn` instead. Here are the accepted values and what each means:

- `warn`: Will count as an issue and display a warning but will not cause the program/build to
  fail. Use this if you want to display issues as reminders or cautionary warnings.
- `error`: Will count as an issue, display error output, and cause the program/build to fail. Use
  this setting if you want to ensure bad commits are prevented.

#### Regular Expressions

Some cops support *include* or *exclude* lists. These lists can consist of strings, regular
expressions, or a combination thereof. Regardless of your choice, all lists are automatically
converted to regular expression for use by the cops. This means a string like `"example"` becomes
`/example/` and a regular expression of `"\\AExample.+"` becomes `/\AExample.+/`.

If you need help constructing complex regular expressions for these lists, try launching an IRB
session and using `Regexp.new` or `Regexp.escape` to experiment with the types of words/phrases you
want to turn into regular expressions. *For purposes of the YAML configuration, these need to be
expressed as strings with special characters escaped properly for internal conversion to a regular
expression.*

### Rake

This gem provides optional Rake tasks. They can be added to your project by adding the following
requirement to the top of your `Rakefile`:

    require "git/cop/rake/setup"

Now, when running `bundle exec rake -T`, you'll see `git_cop` included in the list.

If you need a concrete example, check out the [Rakefile](Rakefile) of this project for details.

## Usage

### Command Line Interface (CLI)

From the command line, type: `git-cop --help`

    git-cop --hook                # Add Git Hook support.
    git-cop -c, [--config]        # Manage gem configuration.
    git-cop -h, [--help=COMMAND]  # Show this message or get help for a command.
    git-cop -p, [--police]        # Check feature branch for issues.
    git-cop -v, [--version]       # Show gem version.

To check if your Git commit history is clean, run: `git-cop --police`. It will exit with a failure
if at least one issue, with error severity, is detected.

This gem does not check commits on `master`. This is intentional as you would, generally, not want
to rewrite or fix commits on `master`. This gem is best used on feature branches as it automatically
detects all commits made since `master` on the feature branch.

Here is an example workflow, using gem defaults with issues detected:

    cd example
    git checkout -b test
    touch text.txt
    git add --all .
    git commit --message "This is a bogus commit message that is also terribly long and will word wrap"
    git-cop --police

    # Output:
    Running Git Cop...

    83dbad531d84a184e55cbb38c5b2a4e5fa5bcaee (Brooke Kuhlmann, 0 seconds ago): This is a bogus commit message that is also terribly long and will word wrap.
      Commit Body Presence Warning. Use minimum of 1 line (non-empty).
      Commit Subject Length Error. Use 72 characters or less.
      Commit Subject Prefix Error. Use: /Fixed/, /Added/, /Updated/, /Removed/, /Refactored/.
      Commit Subject Suffix Error. Avoid: /\./, /\?/, /\!/.

    1 commit inspected. 4 issues detected (1 warning, 3 errors).

### Git Hooks

This gem supports
[Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks).

It is *highly recommended* you manage Git Hooks as global scripts as it'll reduce project
maintenance costs for you. To configure global Git Hooks, add the following to your `~/.gitconfig`:

    [core]
      hooksPath = ~/.git_template/hooks

Then you can customize Git Hooks for all of your projects.
[Check out these examples](https://github.com/bkuhlmann/dotfiles/tree/master/home_files/.config/git/hooks).

If using a global configuration is not desired, you can add Git Hooks at a per project level by
editing any of the scripts within the `.git/hooks` directory of the repository.

#### Commit Message

The *commit-msg* hook, which is the best way to use this gem as a Git Hook, is provided as a
`--hook` option. Run `git-cop --help --hook` for usage:

    Usage:
      git-cop --hook

    Options:
      [--commit-message=PATH]  # Check commit message.

    Add Git Hook support.

As shown above, the `--commit-message` option accepts a file path (i.e. `.git/COMMIT_EDITMSG`) which
is provided to you by Git within the `.git/hooks/commit-msg` script. Here is a working example of
what that script might look like:

    #! /usr/bin/env bash

    set -o nounset
    set -o errexit
    set -o pipefail
    IFS=$'\n\t'

    if ! command -v git-cop > /dev/null; then
       printf "%s\n" "[git]: Git Cop not found. To install, run: gem install git-cop."
       exit 1
    fi

    git-cop --hook --commit-message "${BASH_ARGV[0]}"

Whenever you attempt to add a commit, Git Cop will check your commit for issues prior to saving it.

#### Post Commit

The *post-commit* hook is possible via the `--police --commits` option. Usage:

    Usage:
      git-cop -p, [--police]

    Options:
      -c, [--commits=one two three]  # Check specific commit SHA(s).

    Check feature branch for issues.

The *post-commit* hook can be used multiple ways but, if you want it to check each commit after it
has been made, here is a working example which can be used as a `.git/hooks/post-commit` script:

    #! /usr/bin/env bash

    set -o nounset
    set -o errexit
    set -o pipefail
    IFS=$'\n\t'

    if ! command -v git-cop > /dev/null; then
       printf "%s\n" "[git]: Git Cop not found. To install, run: gem install git-cop."
       exit 1
    fi

    git-cop --police --commits $(git log --pretty=format:%H -1)

Whenever a commit has been saved, this script will run Git Cop to check for issues.

### Continuous Integration (CI)

This gem automatically configures itself for known CI build servers (see below for details). If you
have a build server that is not listed, please log an issue or provide an implementation with
support.

Calculation of commits is done by reviewing all commits made on the feature branch since branching
from `master`.

#### Circle CI

This gem automatically detects and configures itself for [Circle CI](https://circleci.com) builds by
checking the `CIRCLECI` environment variable. No additional setup required!

#### Netlify CI

This gem automatically detects and configures itself for [Netlify CI](https://www.netlify.com)
builds by checking the Netlify `NETLIFY` environment variable. No additional setup required!

#### Travis CI

This gem automatically detects and configures itself for [Travis CI](https://travis-ci.org) builds
by checking the `TRAVIS` environment variable. No additional setup required!

## Cops

The following details the various cops provided by this gem to ensure a high standard of commits for
your project.

### Commit Author Capitalization

| Enabled | Severity | Defaults |
|---------|----------|----------|
| true    | error    | none     |

Ensures author name is properly capitalized. Example:

    # Disallowed
    jayne cobb
    dr. simon tam

    # Allowed
    Jayne Cobb
    Dr. Simon Tam

### Commit Author Email

| Enabled | Severity | Defaults |
|---------|----------|----------|
| true    | error    | none     |

Ensures author email address exists. Git requires an author email when you use it for the first time
too. This takes it a step further to ensure the email address loosely resembles an email address.

    # Disallowed
    mudder_man

    # Allowed
    jayne@serenity.com

### Commit Author Name

| Enabled | Severity |  Defaults  |
|---------|----------|------------|
| true    | error    | minimum: 2 |

Ensures author name consists of, at least, a first and last name. Example:

    # Disallowed
    Kaylee

    # Allowed
    Kaywinnet Lee Frye

### Commit Body Bullet

| Enabled | Severity |          Defaults        |
|---------|----------|--------------------------|
| true    | error    | excludes: `["\\*", "•"]` |

Ensures commit message bodies use a standard Markdown syntax for bullet points. Markdown supports
the following syntax for bullets:

    *
    -

It's best to use `-` for bullet point syntax as `*` are easier to read when used for *emphasis*.
This makes parsing the Markdown syntax easier when reviewing a Git commit as the syntax used for
bullet points and *emphasis* are now, distinctly, unique.

### Commit Body Bullet Capitalization

| Enabled | Severity |       Defaults      |
|---------|----------|---------------------|
| true    | error    | includes: `["\\-"]` |

Ensures commit body bullet lines are capitalized. Example:

    # Disallowed

    - an example bullet.

    # Allowed

    - An example bullet.

### Commit Body Bullet Delimiter

| Enabled | Severity |       Defaults      |
|---------|----------|---------------------|
| true    | error    | includes: `["\\-"]` |

Ensures commit body bullets are delimited by a space. Example:

    # Disallowed

    -An example bullet.

    # Allowed

    - An example bullet.

### Commit Body Issue Tracker Link

| Enabled | Severity |                       Defaults                      |
|---------|----------|-----------------------------------------------------|
| true    | error    | excludes: (see configuration list, mentioned above) |

Ensures commit body doesn't contain a link to an issue tracker. The exclude list defaults to GitHub
Issue links but can be customized for any issue tracker.

There are several reasons for excluding issue tracker links from commit bodies:

1. Not all issue trackers preserve issues (meaning they can be deleted). This makes make reading
   historic commits much harder to understand why the change was made when the link no longer works.
1. When not connected to the internet or working on a laggy connection, it's hard to understand why
   a commit was made when all you have is a link to an issue with no other supporting context.
1. During the course of a repository's life, issue trackers can be replaced (rare but it does
   happen). If the old issue tracker service is no longer paid for, none of the links within the
   commit will be of any relevance.
1. An issue might span several commits in order to resolve it. Including a link in each commit is
   tedious and can create noise within the issue's history which is distracting.

Instead of linking to issues, take the time to write a short summary as to *why* the commit was
made. Doing this will make it easier to understand *why* the commit was made, keeps the commit self-
contained, and makes learning about/debugging the commit faster.

Issue tracker links are best used at the code review level due to an issue usually spanning multiple
commits in order to complete the work. When reading a code review, this is a great opportunity to
link to an issue in order to provide a high level overview and reason why the code review was
initiated in the first place.

### Commit Body Leading Line

| Enabled | Severity | Defaults |
|---------|----------|----------|
| true    | error    | none     |

Ensures there is a leading, empty line, between the commit subject and body. Generally, this isn't
an issue but sometimes the Git CLI can be misused or a misconfigured Git editor will smash the
subject line and start of the body as one run-on paragraph. Example:

    # Disallowed

    Curabitur eleifend wisi iaculis ipsum.
    Pellentque morbi-trist sentus et netus et malesuada fames ac turpis egestas. Vestibulum tortor
    quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu_libero sit amet quam
    egestas semper. Aenean ultricies mi vitae est. Mauris placerat's eleifend leo. Quisque et sapien
    ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, orn si amt wit.

    # Allowed

    Curabitur eleifend wisi iaculis ipsum.

    Pellentque morbi-trist sentus et netus et malesuada fames ac turpis egestas. Vestibulum tortor
    quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu_libero sit amet quam
    egestas semper. Aenean ultricies mi vitae est. Mauris placerat's eleifend leo. Quisque et sapien
    ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, orn si amt wit.

### Commit Body Line Length

| Enabled | Severity |  Defaults  |
|---------|----------|------------|
| true    | error    | length: 72 |

Ensures each line of the commit body is no longer than 72 characters in length for consistent
readability and word-wrap prevention on smaller screen sizes. For further details, read Tim Pope's
original [article](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) on the
subject.

### Commit Body Paragraph Capitalization

| Enabled | Severity | Defaults |
|---------|----------|----------|
| true    | error    | none     |

Ensures each paragraph of the commit body is capitalized. Example:

    # Disallowed

    curabitur eleifend wisi iaculis ipsum.

    # Allowed

    Curabitur eleifend wisi iaculis ipsum.

### Commit Body Phrase

| Enabled | Severity |                       Defaults                      |
|---------|----------|-----------------------------------------------------|
| true    | error    | excludes: (see configuration list, mentioned above) |

Ensures non-descriptive words/phrases are avoided in order to keep commit message bodies informative
and specific. The exclude list is case insensitive. Detection of excluded words/phrases is case
insensitive as well. Example:

    # Disallowed

    Obviously, the existing implementation was too simple for my tastes. Of course, this couldn't be
    allowed. Everyone knows the correct way to implement this code is to do just what I've added in
    this commit. Easy!

    # Allowed

    Necessary to fix due to a bug detected in production. The included implementation fixes the bug
    and provides the missing spec to ensure this doesn't happen again.

### Commit Body Presence

| Enabled | Severity |  Defaults  |
|---------|----------|------------|
| false   | warn     | minimum: 1 |

Ensures a minimum number of lines are present within the commit body. Lines with empty characters
(i.e. whitespace, carriage returns, etc.) are considered to be empty.

Automatically ignores *fixup!* commits as they are not meant to have bodies.

### Commit Body Single Bullet

| Enabled | Severity |      Defaults    |
|---------|----------|------------------|
| true    | error    | includes: `"\\-"` |

Ensures a single bullet is never used when a paragraph could be used instead. Example:

    # Disallowed

    - Pellentque morbi-trist sentus et netus et malesuada fames ac turpis egestas. Vestibulum tortor
      quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu_libero sit amet quam.

    # Allowed

    Pellentque morbi-trist sentus et netus et malesuada fames ac turpis egestas. Vestibulum tortor
    quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu_libero sit amet quam.

### Commit Subject Length

| Enabled | Severity |  Defaults  |
|---------|----------|------------|
| true    | error    | length: 72 |

Ensures the commit subject length is no more than 72 characters in length. This default is more
lenient than the [50/72 rule](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
as it gives one the ability to formulate a more descriptive subject line without being too wordy or
suffer being word wrapped.

Automatically ignores *fixup!* or *squash!* commit prefixes when calculating subject length.

### Commit Subject Prefix

| Enabled | Severity |        Defaults       |
|---------|----------|-----------------------|
| true    | error    | includes: (see below) |

Ensures the commit subject uses consistent prefixes that explain *what* is being committed. The
`includes` are *case sensitive* and default to the following prefixes:

- **Fixed** - Identifies what was fixed. The commit should be as small as possible and consist of
  changes to implementation and spec only. In some cases this might be a single line or file change.
  The important point is the change is applied to existing code which corrects behavior that wasn't
  properly implemented earlier.
- **Removed** - Identifies what was removed. The commit should be as small as possible and consist
  only of removed lines/files from the existing implementation. This might also mean breaking
  changes requiring the publishing of a *major* version release in the future.
- **Added** - Identifies what was added. The commit should be as small as possible and consist of
  implementation and spec. Otherwise, it might be a change to an existing file which adds new
  behavior.
- **Updated** - Identifies what was updated. The commit should be as small as possible and *not add
  or fix* existing behavior. This can sometimes be a grey area but is typically reserved for updates
  to documentation, code comments, dependencies, etc.
- **Refactored** - Identifies what was refactored. The commit should be as small as possible and only
  improve existing functionality while avoiding changes in behavior (especially to public API
  that might effect downstream dependencies). Refactored code should never break existing specs.

In practice, using a prefix other than what has been detailed above to explain *what* is being
committed is never needed. These prefixes are not only short and easy to remember but also have the
added benefit of categorizing the commits for building release notes, change logs, etc. This becomes
handy when coupled with another tool, [Milestoner](https://github.com/bkuhlmann/milestoner), for
producing consistent project milestones and Git tag histories.

Automatically ignores *fixup!* or *squash!* commit prefixes when used as a Git Hook in order to not
disturb interactive rebase workflows.

### Commit Subject Suffix

| Enabled | Severity |             Defaults              |
|---------|----------|-----------------------------------|
| true    | error    | excludes: `["\\.", "\\?", "\\!"]` |

Ensures commit subjects are suffixed consistently. The exclude list *is* case sensitive and prevents
the use of punctuation. This is handy when coupled with a tool, like
[Milestoner](https://github.com/bkuhlmann/milestoner), which automates project milestone releases.

### Commit Trailer Collaborator Capitalization

| Enabled | Severity | Defaults |
|---------|----------|----------|
| false   | error    | none     |

Ensures collaborator name is properly capitalized. Example:

    # Disallowed
    shepherd derrial book

    # Allowed
    Shepherd Derrial Book

### Commit Trailer Collaborator Duplication

| Enabled | Severity | Defaults |
|---------|----------|----------|
| false   | error    | none     |

Ensures collaborator trailers are not duplicated. Example:

    # Disallowed
    Co-Authored-By: Shepherd Derrial Book <shepherd@firefly.com>
    Co-Authored-By: Shepherd Derrial Book <shepherd@firefly.com>

    # Allowed
    Co-Authored-By: Malcolm Reynolds <malcolm@firefly.com>
    Co-Authored-By: Shepherd Derrial Book <shepherd@firefly.com>

### Commit Trailer Collaborator Email

| Enabled | Severity |       Defaults      |
|---------|----------|---------------------|
| false   | error    | none                |

Ensures collaborator email address is valid for commit trailer.

    # Disallowed
    Co-Authored-By: River Tam <invalid>

    # Allowed
    Co-Authored-By: River Tam <river@firefly.com>

### Commit Trailer Collaborator Key

| Enabled | Severity |            Defaults            |
|---------|----------|--------------------------------|
| false   | error    | includes: `["Co-Authored-By"]` |

Ensures collaborator trailer key is correct format.

    # Disallowed
    Co-authored-by: River Tam <river@firefly.com>

    # Allowed
    Co-Authored-By: River Tam <river@firefly.com>

### Commit Trailer Collaborator Name

| Enabled | Severity |  Defaults  |
|---------|----------|------------|
| false   | error    | minimum: 2 |

Ensures collaborator name consists of, at least, a first and last name. Example:

    # Disallowed
    Co-Authored-By: River <river@firefly.com>

    # Allowed
    Co-Authored-By: River Tam <river@firefly.com>

## Style Guide

In addition to what is described above and automated for you, the following style guide is also
worth considering:

### General

- Use a [Git rebase workflow](http://www.bitsnbites.eu/a-tidy-linear-git-history) instead of a Git
  merge workflow.
- Use `git commit --fixup` when fixing a previous commit, addressing code review feedback, etc.,
  and don't need to modify the original commit message.
- Use `git commit --squash` when fixing a previous commit, addressing code review feedback, etc.,
  and want to combine multiple commit messages into a single commit message. *Avoid using squash to
  blindly combine multiple commit messages without editing them into a single, coherent message.*
- Use `git rebase --interactive` when cleaning up commit history, order, messages, etc. This should
  be done prior to submitting a code review or when code review feedback has been addressed and
  you are ready to rebase onto `master`.
- Use `git push --force-with-lease` instead of `git push --force` when pushing changes after an
  interactive rebasing session.
- Avoid checking in development-specific configuration files (add to `.gitignore` instead).
- Avoid checking in sensitive information (i.e. security keys, passphrases, etc).
- Avoid "WIP" (a.k.a. "Work in Progress") commits and/or code review labels. Be confident with your
  code and colleagues' time. Use branches, stashes, etc. instead -- share a link to a feature branch
  diff if you have questions/concerns during development.
- Avoid using [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). This practice
  leads to complicated project cloning, deployments, maintenance, etc. Use separate repositories to
  better organize and split out this work. Sophisticated package managers, like
  [Bundler](https://bundler.io) for example, exist to manage these dependencies better than what
  multiple Git Submodules can accomplish.
- Avoid using [Git LFS](https://git-lfs.github.com) for tracking binary artifacts/resources. These
  files are not meant for version control and lead to large repositories that are time consuming to
  clone/deploy. Use storage managers, like [Amazon S3](https://aws.amazon.com/s3) for example, that
  are better suited for binary assets that don't change often.

### Commits

- Use small, atomic commits:
  - Easier to review and provide feedback.
  - Easier to review implementation and corresponding tests.
  - Easier to document with detailed subject messages (especially when grouped together in a pull
    request).
  - Easier to reword, edit, squash, fix, or drop when interactively rebasing.
  - Easier to combine together versus tearing apart a larger commit into smaller commits.
- Use commits in a logical order:
  - Each commit should tell a story and be a logical building block to the next commit.
  - Each commit, when reviewed in order, should be able to explain *how* the feature or bug fix was
    completed and implemented properly.
- Use a commit subject that explains *what* is being committed.
- Use a commit message body that explains *why* the commit is necessary. Additional considerations:
  - If the commit has a dependency to the previous commit or is a precursor to the commit that will
    follow, make sure to explain that.
  - Include links to dependent projects, stories, etc. if available.

### Branches

- Use feature branches for new work.
- Maintain branches by rebasing upon `master` on a regular basis.

### Tags

- Use tags to denote milestones/releases:
  - Makes it easier to record milestones and capture associated release notes.
  - Makes it easier to compare differences between versions.
  - Provides a starting point for debugging production issues (if any).

### Rebases

- Avoid rebasing a shared branch. If you must do this, clear communication should be used to warn
  those ahead of time, ensure that all of their work is checked in, and that their local branch is
  deleted first.

### Hooks

- Use hooks to augment and automate your personal workflow such as checking code quality, detecting
  forgotten debug statements, etc.
- Use hooks globally rather than locally per project. Doing this applies the same functionality
  across all projects automatically, reduces maintenance per project, and provides consistency
  across all projects. This can best be managed via your
  [Dotfiles](https://github.com/bkuhlmann/dotfiles/tree/master/home_files/.config/git/hooks).
- Avoid forcing global or local project hooks as a team-wide mandate. Hooks are a personal tool much
  like editors or other tools one choose to do their work. For team consistency, use a continuous
  integration build server instead.

### Code Reviews

There are two objectives each code review should achieve:

1. **Quality**: Ensures changes are of highest quality that adhere to team standards while enhancing
   the customer experience and not disrupting their workflow.
1. **Education**: Provides a chance for everyone on the team to learn more about the architecture,
   product/service, and how each member of the team implements a solution. This is your chance to
   ask questions and learn how to be a better engineer so take advantage of it.

In addition to the objectives above, the following guidelines are worth following:

- Keep code reviews short and easy to review:
  - Provide a high level overview that answers *why* the code review is necessary.
  - Provide a link to the issue/task that prompted the code review (if any).
  - Provide screenshots/screencasts if possible.
  - Ensure commits within the code review are related to the purpose of the code review.
  - Prefer code reviews of ~250 lines in order to keep the quality of the code review and defect
    detection high.
  - Avoid working on a large issue without getting feedback first in order to not overwhelm/surprise
    the maintainers. More discussion up front will help ensure your work has a faster chance of
    acceptance.
- Review and rebase code reviews quickly:
  - Maintain a consistent but reasonable pace -- Review morning, noon, and night.
  - Avoid letting code reviews linger more than a day. Otherwise, you risk hampering moral and
    diminishing the productivity of the team.
- Use emojis, with a format of `<emoji> <feedback>`, to identify the kinds of feedback used during
  the review process:
  - :tea: (`:tea:`) - Signifies you are starting the code review. This is *non-blocking* and
    informational. Useful when reading over a code review with a large number of commits, complex
    code, requires additional testing by the reviewer, etc.
  - :star: (`:star:`) - Signifies code that is liked, favorited, remarkable, etc. This feedback is
    *non-blocking* and is always meant to be positive/uplifting.
  - :information_source: (`:information_source:`) - Signifies informational feedback that is
    *non-blocking*. Can also be used to let one know you are done reviewing but haven't approved yet
    (due to feedback that needs addressing), rebasing a code review and then merging, waiting for a
    blocking code review to be resolved, status updates to the code review, etc.
  - :thought_balloon: (`:thought_balloon:`) - Signifies inquisitive intent that is *non-blocking*.
    Useful when asking questions and/or probing deeper into implementation details to learn more.
  - :abc: (`:abc:`) - Signifies detection of a misspelling with suggested correction. This is
    *blocking* feedback that is easy to correct.
  - :art: (`:art:`) - Signifies an issue with code style and/or code quality. This can be *blocking*
    or *non-blocking* feedback. It is up to the discretion of the author on how to address the
    feedback but encouraged that the feedback is incorporated or at least discussed. Generally,
    these situations are automatically detected via code linters but there are occasions where
    there is ambiguity in which linters can't catch.
  - :classical_building: (`:classical_building:`) - Signifies an issue with the architecture of the
    implementation. This is *blocking* and requires immediate correction. The reviewer should
    provide a suggested solution and/or links to patterns, articles, etc. that might help the author
    fix the implementation. Pairing is encouraged if feedback is vast and/or complex.
  - :closed_lock_with_key: (`:closed_lock_with_key:`) - Signifies a security violation that would
    damage us and/or our customers. This is *blocking* feedback and must be addressed immediately.
  - :bulb: (`:bulb:`) - Indicates a helpful tip or trick for improving the code. This can be
    *blocking* or *non-blocking* feedback and is left up to the author to decide. Generally, it is a
    good idea to address and resolve the feedback.
  - :bow: (`:bow:`) - Indicates thankfulness of the feedback received. This is *non-blocking* and
    always meant as a response to helpful feedback.
  - :white_check_mark: (`:white_check_mark:`) - Signifies code review approval. The author can
    rebase onto `master` and delete the feature branch at this point.
- Use face-to-face communication if a code review's written discussion gets lengthy/noisy.
- Create new tasks/actions if additional features are discovered during a code review to avoid
  delaying code review acceptance. Return to the code review once tasks have been logged.
- The author, not the reviewer, should rebase the feature branch onto `master` upon approval.
- Avoid reviewing your own code review before rebasing onto `master`. Have another pair of eyes
  review your code first.
- Ensure the following criteria is met before rebasing your feature branch to `master`:
  - Ensure all `fixup!` and `squash!` commits are interactively rebased. *Avoid rebasing these onto
    the `master` branch!*
  - Ensure your feature branch is rebased upon `master`.
  - Ensure all tests and code quality checks are passing.
  - Ensure the feature branch is deleted after being successfully rebased.

### GitHub

When using GitHub, enforce a rebase workflow for all of your GitHub projects (*highly recommended*).
You can do this via your project options (i.e.
`https://github.com/<username/organization>/<project>/settings`) and editing your merge options for
code reviews as follows:

![GitHub Merge Options](doc/github-settings-options.png)

Doing this will help maintain a clean Git history.

## Tests

To test, run:

    bundle exec rake

## Versioning

Read [Semantic Versioning](https://semver.org) for details. Briefly, it means:

- Major (X.y.z) - Incremented for any backwards incompatible public API changes.
- Minor (x.Y.z) - Incremented for new, backwards compatible, public API enhancements/fixes.
- Patch (x.y.Z) - Incremented for small, backwards compatible, bug fixes.

## Code of Conduct

Please note that this project is released with a [CODE OF CONDUCT](CODE_OF_CONDUCT.md). By
participating in this project you agree to abide by its terms.

## Contributions

Read [CONTRIBUTING](CONTRIBUTING.md) for details.

## License

Copyright 2017 [Alchemists](https://www.alchemists.io).
Read [LICENSE](LICENSE.md) for details.

## History

Read [CHANGES](CHANGES.md) for details.
Built with [Gemsmith](https://github.com/bkuhlmann/gemsmith).

## Credits

Developed by [Brooke Kuhlmann](https://www.alchemists.io) at
[Alchemists](https://www.alchemists.io).
