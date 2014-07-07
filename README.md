Stanley-Jekyll
----

This is my try at a Jekyll port of the free bootstrap theme Stanley, that [BlackTie.co](http://www.blacktie.co/) created. 

License
----

It is licensed under the same terms as the original work; [Creative Commons Attribution 3.0](http://creativecommons.org/licenses/by/3.0/). This means you can:
 *  Use it for personal stuff
 *  Use it for commercial stuff
 *  Change it however you like

All for free. In exchange, just give BlackTie.co credit for the design.

Dribbble shots used in this theme are from the awesome designer [David Creighton-Pester](https://dribbble.com/wanderingbert). I am unsure wether the license of his art is the same or not, please consult him if you want to use them.

Usage
----

Update the base-url in `_config.yml` to either `""` if it's your personal github io page, or to `"/project-name"` if it is a project of yours. In  `post-commit.sh`, change the branches as appropriate. Also update the branch name in the if-clause, depending on from which branch you want to publish things. 

To set up the git hook, run: `ln -s ../../post-commit.sh .git/hooks/post-commit`.
You might need to update permissions for the hook to run, in that case do `chmod +x .git/hooks/post-commit`.

If you want to publish/update your webpage, just commit in the appropriate branch and the git hook will do the rest and publish the site to github.

Note:
This solution uses a temporary branch `tmp`, so if you already have a branch that is called so, this will probably not work.


Old Usage Instructions
----

It is currently not a seamless experience to use this theme with GitHub Pages, despite the 'v1.0'-tag. GitHub Pages uses Jekyll version 1.5.1, whereas this project was developed for version 2.0.3 and newer. It is possible to host your site anyways, but it's a bit tedious effort required. 

1. Build the project locally with `jekyll build`
2. Delete all files from your master branch in *username.github.io*
3. Copy the all contents from the `_site`-folder to your master branch
4. Commit and push


I might look at a simpler solution further ahead (or use some kind of script for the deployment).

