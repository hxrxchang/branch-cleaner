#!/bin/bash
protected_branches_str=""

for line in `cat ~/branch-cleaner/.protected_branches`
do
    if [ -z "$protected_branches_str" ]
    then
        protected_branches_str=$line
    else
        protected_branches_str="${protected_branches_str}\|${line}"
    fi
done

git branch | grep -v $protected_branches_str | xargs git branch -D
