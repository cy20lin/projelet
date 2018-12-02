#!/bin/sh

echo(){
    "${@}"
}

test -e ./_build/html/.git \
    && rm -rf ./_build/html/.git
test -d ./_build/html \
    && cd ./_build/html \
    && echo git init \
    && echo git checkout -b gh-pages \
    && echo git checkout --orphan gh-pages \
    && echo git commit --allow-empty --allow-empty-message -m "" \
    && echo git add . \
    && echo git commit -m "$(cd .. && git rev-parse HEAD)" \
    && echo git remote add origin "$(cd .. && git remote get-url origin)" \
    && echo git push -f origin gh-pages
