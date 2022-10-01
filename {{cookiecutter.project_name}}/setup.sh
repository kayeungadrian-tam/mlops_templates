#!/usr/bin/env bash

# Git init
git init

# Pre-commit
if ! command -v pre-commit --version &>/dev/null; then
    pip install pre-commit
fi
pre-commit install
pre-commit run --all-files

# DVC
if ! command -v dvc --version &>/dev/null; then
    pip install dvc
fi
dvc init

gh repo create {{cookiecutter.repository_name}} --{{cookiecutter.repository_visiability}}
git add .
git commit -m "init commit"
git branch -M main
git remote add origin {{cookiecutter.repository_url}}
git push -u origin main
