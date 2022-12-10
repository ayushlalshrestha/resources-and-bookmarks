[Git cheat sheet](https://education.github.com/git-cheat-sheet-education.pdf)

## STAGE & SNAPSHOT
Working with snapshots and the Git staging area
1. `git status` - show modified files in working directory, staged for your next commit
2. `git add [file]` - add a file as it looks now to your next commit (stage)
3. `git reset [file]` - unstage a file while retaining the changes in working directory
4. `git diff` - diff of what is changed but not staged
5. `git diff --staged` -  diff of what is staged but not yet commited
6. `git commit -m “[descriptive message]”` - commit your staged content as a new commit snapshot

## BRANCH & MERGE
Isolating work in branches, changing context, and integrating changes
1. `git branch` - list your branches. a * will appear next to the currently active branch
2. `git branch [branch-name]` - create a new branch at the current commit
3. `git checkout` - switch to another branch and check it out into your working directory
4. `git merge [branch]` - merge the specified branch’s history into the current one
5. `git log` - show all commits in the current branch’s history

## INSPECT & COMPARE
Examining logs, diffs and object information
1. `git log` - show the commit history for the currently active branch
2. `git log branchB..branchA` - show the commits on branchA that are not on branchB
3. `git log --follow [file]` - show the commits that changed file, even across renames
4. `git diff branchB...branchA` - show the diff of what is in branchA that is not in branchB
5. `git show [SHA]` - show any object in Git in human-readable format

## SHARE & UPDATE
Retrieving updates from another repository and updating local repos
1. `git remote add [alias] [url]` - add a git URL as an alias
2. `git fetch [alias]` - fetch down all the branches from that Git remote
3. `git merge [alias]/[branch]` - merge a remote branch into your current branch to bring it up to date
4. `git push [alias] [branch]` - Transmit local branch commits to the remote repository branch
5. `git pull` - fetch and merge any commits from the tracking remote branch

## REWRITE HISTORY
Rewriting branches, updating commits and clearing history
1. `git rebase [branch]` - apply any commits of current branch ahead of specified one
2. `git reset --hard [commit]` - clear staging area, rewrite working tree from specified commit

## TEMPORARY COMMITS
Temporarily store modified, tracked files in order to change branches
1. `git stash` - Save modified and staged changes
2. `git stash list` - list stack-order of stashed file changes
3. `git stash pop` - write working from top of stash stack
4. `git stash drop` - discard the changes from top of stash stack



## GIT Commands:

git init    //Initialize local git repository
git clone <url> <where to clone>    //Clone repository into a new directory
git add <file>    //Add file(s) to index, staging
git reset <file>  //Remove file(s) from index
git status or git diff    //Check status of working tree 
git commit    //Commit changes in index
git fetch <branch name> // download the remote branch but remain in the current working branch, without any changes
git merge <branch name> //bring the changes of the <branch name> to the current working branch
git pull    //Pull latest from remote repository (if any changes have been made by fellow colleagues), is like doing <git fetch and then git merge>
git push    //Push to remote repository
eg. git push <repository name> <branch name>
eg. git push origin master
eg. git push webserver release/flexpatch-5.6.0
git branch    //Shows which branch in git the file is located at

git branch <branch name>  // create a new branch
git checkout <branch name>  // start working on that branch
git stash save “this is state <something>”  //Now you’re in the origin state
git stash list
git stash apply <stash code>

Cheat Sheet: github: git commands cheat sheet

Merge a Branch:
git checkout master
git pull origin master
git branch --merged
git merge <branch name>
git push origin master

#Example of how you create a new branch and then merge and push it to the origin
git branch <branch name>
git checkout <branch name>
git status  // After making changes
git add -A
git commit -m “This is a comment”
git push -u origin <branch name>
git checkout master
git pull origin master
git merge <branch name>
git push origin master




#Note
When there was a conflict in the ‘Pull Request’ because the same file was changed by me and other, we had to do the following to first bring my code base to the other changed state and then commit my changes.
  Step 1: cd /development/ptf/disk/installed/webserver/
  Step 2: git branch
  Step 3: git checkout release/patch-5.6.0
  Step 4: 

# The conflict generated message as follow:
Merge Conflict
This pull request has conflicts. You must resolve the conflicts before you can merge:
Step 1: Fetch the changes (saving the target branch as FETCH_HEAD).
git fetch origin release/flexpatch-5.6.0
Step 2: Checkout the source branch and merge in the changes from the target branch. Resolve conflicts.
git checkout feature/LP-15958-aditya-development-remove-dead-code-from
git merge FETCH_HEAD
Step 3: After the merge conflicts are resolved, stage the changes accordingly, commit the changes and push.
git commit
git push origin HEAD
Step 4: Merge the updated pull request.


