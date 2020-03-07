#!/bin/sh -l

python3 main.py --issue_comment_body "$1" --issue_number "$2" --issue_user "$3"
