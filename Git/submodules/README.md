This is a tutorial from a medium article that talks about submodules. It can be
found here:
`https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407#.hcoa9ovk3`

The reason I am going through this tutorial is because I am wanting to add
submodules to my dotfiles project for vim plugins. I've done this locally, but
made some mistakes with specifying a "branch" to use with the submodule, and not
installation is going crazy, and I can't remove the submodule sufficiently start
over. Obviously there are some gaps in my knowledges and I am hoping that this
will help fill them.

As I move forward I hope to add notes, thoughts and ideas to this readme.

--------------------------------------------

This blog article provides a project to play with. I've added it to the repo,
but we'll see if the parent dir causes problems. I might end up removing it from
this and just leave my notes.

... 1 minute passes ...

Well not even 2 paragraphs after downloading the provided sample project, it's
completely different from what is being described in the blog article. Oh
well... notes only, I guess.

* When using submodules there is little information provided by `git status`
  around what is happening in submodules. You can get a little more insight into
  this by adding the following to you `~/.gitconfig`

  ```git
  [status]
    submoduleSummary = true
  ```

  Or you can set it globally with `git config --global status.submoduleSummary
  true`.

* Using a file that uses submodules requires you to `init` and `update` the
  submodule in the repo. This is because, when you clone a project, the project
  only has the `.gitmodules` file to describe what submodules to use, and where to
  get them.

  `git submodule init` populates the newly clones projects `.git` directory with
  the information needed from the `.gitmodules` file. After running it is aware of
  submoduels. **This doesn't fetch the submodule from the remote**.

  `git submodule update` will fetch the repo from the remote.

  You can group the `init` and `update` into a single command: `git submodule
  update --init`.

* If your submodules use submodules you would have to init and update in each of
  them. This is really annoying and probably why most people don't use them. Git
  provides an option that will `init` and `update` all submodules in your repo
  when you `clone` a project which is `--recursive`.

  ```
  git clone --recursive [path]
  ```

#### Removing a submodule

The whole reason I'm here...

###### deinit

You can remove a submodule with `git submodule deinit path/to/submodule`. This
removes it from `.git/config` but keeps knowledge of the submodule in
`.gitmodules` of the project. This allows you to `init` and `update` again to
get the submodule.

Deinit does not permanently remove the submodule.

###### remove submodyle permanently

You can run `git rm` to remove the submodule locally.

```
git rm path/to/submodule
```

 When doing this, local git config retains submodule information unlike what
happens when you `deinit`.

###### remaining files

This laves the submodule's repo present in `.git/modules/path/to/submodule`, so
you would need to remove that path after to erase everything from that
submodule.

It's recommended that you do all of this in order to remove a submodule
completely.

```
git submodule deinit path/to/submodule
git rm path/to/submodule
rm -rf .git/modules/path
```
