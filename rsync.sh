#!/bin/bash
rsync -e ssh -avz --delete public ssoo:/var/www/linkless.org
