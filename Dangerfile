# frozen_string_literal: true

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example

rubocop.lint({:force_exclusion => true})

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Let's track all our PRs
fail("PR must reference JIRA") unless github.pr_title.match(/\[.*-[0-9]*\]/)

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe spec/ `.length > 1
fail("fit left in tests") if `grep -r fit spec/ `.length > 1
fail("puts left in tests") if `grep -r puts **/*.rb`.length > 1
