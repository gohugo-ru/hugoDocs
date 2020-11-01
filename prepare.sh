#!/bin/sh
# if [ "`git status -s`" ]
# then
#     echo "The working directory is dirty. Please commit any pending changes."
#     exit 1;
# fi

echo "Deleting old publication"
rm -rf out
rm -rf _gh_pages
mkdir _gh_pages
git worktree prune
rm -rf .git/worktrees/_gh_pages/

echo "Checking out gh-pages branch into _gh_pages"
git worktree add -B gh-pages _gh_pages origin/gh-pages

echo "Removing existing files"
rm -rf _gh_pages/*

echo "Generating site"
yarn export
cp out/* _gh_pages/ -r
echo tailwindcss.su >> _gh_pages/CNAME
touch _gh_pages/.nojekyll

echo "Updating gh-pages branch"

# echo "Message:"
# read message

# if [$1 = '']
# then
# echo "Enter you message"
# else
# echo "You message: $message"
# fi

cd _gh_pages && git add --all && git commit -m "Добавил .nojekyll" && git push origin gh-pages && cd ..

#echo "Pushing to github"
#git push --all
