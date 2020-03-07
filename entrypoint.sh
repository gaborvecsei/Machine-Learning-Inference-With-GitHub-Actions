#!/bin/sh -l

echo "Hello $1"
python_version=$(python --version)
echo ::set-output name=python_version::$python_version

