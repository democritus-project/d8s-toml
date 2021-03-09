#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_toml/ tests/

black democritus_toml/ tests/

mypy democritus_toml/ tests/

pylint --fail-under 9 democritus_toml/*.py

flake8 democritus_toml/ tests/

bandit -r democritus_toml/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_toml/ tests/
