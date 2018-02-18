# Tools

### add subtree to project
```
$ git remote add tools https://github.com/kozyilmaz/tools.git
$ git subtree add --prefix=tools/ --squash tools master
```

### check subtree after clean clone
```
$ git fetch https://github.com/kozyilmaz/tools.git master
$ ./contrib/devtools/git-subtree-check.sh tools
```

### sync subtree repositories
```
$ git remote add tools-remote https://github.com/kozyilmaz/tools.git
$ git subtree pull --prefix=tools/ --squash tools-remote master
```

### two ways of checking subtrees
```
$ git log | grep git-subtree-dir | tr -d ' ' | cut -d ":" -f2 | sort | uniq
$ git log | grep git-subtree-dir | tr -d ' ' | cut -d ":" -f2 | sort | uniq | xargs -I {} bash -c 'if [ -d $(git rev-parse --show-toplevel)/{} ] ; then echo {}; fi'
```

### working with forks
```
$ git clone https://github.com/<your_username>/<forked_repo>.git
$ git remote add upstream https://github.com/<forked_username>/<forked_repo>.git
$ git fetch upstream
$ git merge upstream/master
```

### working with branches
```
$ git branch <branch>
$ git checkout <branch>
$ git push -u origin <branch>
```

### revert a single commit
```
$ git checkout <branch>
$ git revert <commit>
$ git push origin <branch>
```

### tag tree
```
$ git tag <tagname>
$ git push origin --tags
```

### reference GitHub issue or pull request
```
https://github.com/<user>/<repo>/issues/<number>
```

### add subtree libmakefile
```
# add
$ git remote add libmakefile https://github.com/kozyilmaz/libmakefile.git
$ git subtree add --prefix=libmakefile/ --squash libmakefile buildsystem
# check
$ git fetch https://github.com/kozyilmaz/libmakefile.git buildsystem
$ ./contrib/devtools/git-subtree-check.sh libmakefile
# sync
$ git remote add libmakefile-remote https://github.com/kozyilmaz/libmakefile.git
$ git subtree pull --prefix=libmakefile/ --squash libmakefile-remote buildsystem
```
