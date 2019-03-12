#Main Branches

----- 
$ git init
$ echo 'Hello World!' >> README
$ git add README
$ git commit -m 'Initial Commit'

----- 
$ git branch develop


#Feature Branches

----- 0. 
$ git checkout -b feature-foobar develop

----- 1. 
$ echo "FOOBAR Feature 1" >> README
$ git commit -a -m "foobar feature 1"
$ echo "FOOBAR Feature 2" >> README
$ git commit -a -m "foobar feature 2"

----- 2.1 
$ git checkout develop

----- 2.2 
$ git merge --no-ff feature-foobar

----- 2.3 
$ git branch -d feature-foobar

----- 2.4 
$ git push origin develop

#Release Branches

----- 1. 
$ git checkout -b release-1.2 develop
$ ./bump-version.sh 1.2
$ git commit -a -m "Bumped version number to 1.2"

----- 2. 
$ git checkout master
$ git merge --no-ff release-1.2
$ git tag -a 1.2

----- 3. 
$ git checkout develop
$ git merge --no-ff release-1.2
$ git branch -d release-1.2

#Hotfix Branches

----- 1. 
$ git checkout -b hotfix-1.2.1 master
$ ./bump-version.sh 1.2.1
$ git commit -a -m "Bumped version number to 1.2.1"

----- 2. 
$ git commit -m "Fixed severe production problem"

----- 3. 
$ git checkout master
$ git merge --no-ff hotfix-1.2.1
$ git tag -a 1.2.1

----- 4. 
$ git checkout develop
$ git merge --no-ff hotfix-1.2.1

----- 5. 
$ git branch -d hotfix-1.2.1