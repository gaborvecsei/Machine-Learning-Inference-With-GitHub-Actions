#!/bin/sh -l

echo "Hello $1"
python_version=$(python --version)
echo ::set-output name=python-version::$python_version

