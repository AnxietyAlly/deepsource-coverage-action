#!/bin/sh -l

echo "Reporting test code coverage has begun"
apk add --update npm
apk add --update curl
apk add --update gcompat
apk add --update libstdc++
apk add --update git

git init
git config --global --add safe.directory /github/workspace

npm run coverage

curl https://deepsource.io/cli | sh
./bin/deepsource report --analyzer test-coverage --key javascript --value-file ./coverage/cobertura-coverage.xml

echo "Reporting test code coverage has finished"


# steps:
#     - name: Checkout Code
#       uses: actions/checkout@v4

#     - name: Setup Node.js
#       uses: actions/setup-node@v3
#       with:
#         node-version: '20'

#     - name: Install Dependencies
#       run: npm ci

#     # Run your tests and generate coverage file here
#     - name: Run Tests and Generate Coverage
#       run: npm run coverage

#     # Report test-coverage to DeepSource using CLI
#     - name: Report test-coverage to DeepSource
#       run: |
#         # Install the CLI
#         curl https://deepsource.io/cli | sh

#         # Send the report to DeepSource
#         ./bin/deepsource report --analyzer test-coverage --key javascript --value-file ./coverage/cobertura-coverage.xml