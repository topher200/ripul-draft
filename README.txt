## Quickstart
  `sudo gem install rails 3.2.22` (or latest 3.2.x)
  `git clone github.com:topher200/ripul-draft`
  `cd ripul-draft`
  `bundle install`
  `rake db:setup`
  `rails server`
  access site from `localhost:3000`

## Become admin

Become admin to be able to draft players. Simply go to `<site>/admin` to log
yourself in (no credentials required).

## Set next draft pick When we need to make draft picks out of order (baggage
picks, for example), we manually set what the next draft pick for a given gender
will be. Go to `<site>/next_pick_number` to set the variable for the next pick.
