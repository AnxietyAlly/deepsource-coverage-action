#!/bin/sh -l

echo "Hello $1"
time=$(date)

echo "Building frontend has begun"
ls
apk add --update npm
# npm ci
npm install
npm run build --if-present
echo "Building frontend has finished"

echo "time=$time" >> $GITHUB_OUTPUT

#   steps:
#     - run: echo "Building frontend has begun"
#     - uses: actions/checkout@v4
#     - run: npm ci
#     - run: npm run build --if-present
#     - run: echo "Building frontend has finished"