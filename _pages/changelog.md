---
title: Changelog
layout: page
---

### April 30th, 2020

Kevin:

- Made minor maintenance changes to fix a failing site build and speed up the build time from ~50 seconds to ~6 seconds.

- Modularized the stylesheet into includes

- Made slight typography spacing and heading hierarchy adjustments for reading flow

### April 26th, 2020

- I installed `jekyll-mentions` that lets you mention other people in the Rickshaw and it'll auto-linkify them. All you have to do is type their username (which is the same as what appears in the URL on their profile page). Mine is @buster, for example.

- Changed the font to Source Sans Pro, since it was better than the default, but if I go down the font rabbit hole I may never come out. If someone else has strong feelings about font-y things, let's hear them. I also made the font a bit bigger and made external links open in a new tab. 

- Added `replying_to_post` as an option you can add to front matter (there's a little menu thing to the right of the post editor in prose.io that lets you add this stuff. It's a bit picky, though... `replying_to_post` must have the part of the URL that looks like this: `/kev_mcg/2020-04-25-potential-patterns-for-shared-websites`. Not the slash in the front, and no slash at the end... I'm just doing a literal comparison with the post's official url according to Jekyll. We can make it smarter if this ends up being a useful pattern.

- If you include `comments_url` in the post's metadata, you will get a button on your post like on [this page](https://busterbenson.github.io/rickshaw/buster/2020-04-26-testing-a-reply).

- If a post is a reply to another, or if a post has replies, there will be links to the related posts. It looks ugly right now. Who wants to make it look nicer?

- Created this changelog.


