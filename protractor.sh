#!/bin/bash

xvfb-run --server-args='-screen 0 1280x1024x24' node /protractor/node_modules/.bin/protractor $@

