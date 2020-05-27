# NOTES

## Start the server:
`bundle exec jekyll serve --incremental`

## Reference links:
- Jekyll cheat sheet https://devhints.io/jekyll

## To add a new person to the rickshaw
- Add them to `_data/person.yml`
- Create a folder in `_data`, `_pages`, and `_posts` that matches their username
- Add an `index.html` file to `_pages/[username]` as their profile page

## To add a post to Rickshaw Draws
- Create a post as normal
- Add `category: rickshaw-draws` to the post metadata
- Add the image to `/assets/[username]/[filename].jpg`
- Add `image: [filename].jpg` to the post metadata
