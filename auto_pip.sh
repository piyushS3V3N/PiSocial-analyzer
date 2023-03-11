#!/bin/bash
echo "Auto pip Package Creator - Piyush"
echo "[x] Deleting pip-pisocial-analyzer"
[[ -d pip-pisocial-analyzer ]] && rm -r pip-pisocial-analyzer
echo "[x] Making pip-pisocial-analyzer"
mkdir -p pip-pisocial-analyzer/pisocial-analyzer
echo "[x] Copying app.py, setup.py, README.rst & README.rst"
cp app.py pip-pisocial-analyzer/pisocial-analyzer/__main__.py
cat >>pip-pisocial-analyzer/pisocial-analyzer/__init__.py <<EOL
#!/usr/bin/env python
from .__main__ import main_logic
from .__main__ import SocialAnalyzer
EOL
cat >>pip-pisocial-analyzer/pisocial-analyzer/pisocial-analyzer <<EOL
#!/usr/bin/env python
from importlib import import_module
if __name__ == '__main__':
	module = import_module("pisocial-analyzer")
	module.main_logic()
EOL
cp setup.py pip-pisocial-analyzer/setup.py
cp README.rst pip-pisocial-analyzer/README.rst
echo "[x] Copying data folder"
cp -r data pip-pisocial-analyzer/pisocial-analyzer/
cd pip-pisocial-analyzer/
echo "[x] Checking setup.py"
python3 setup.py check -r -s
echo "[x] Creating pypi Package"

python3 setup.py sdist bdist_wheel 2>stderr.log 1>stdout.log

 if grep -q "error:" stderr.log
	then
		echo "[x] Creating pypi failed.."
		cat stderr.log
	else
		echo "[x] pypi Package was created successfully"
		read -p "Do you want to upload? (y/n)?" USER_INPUT
		if [ "$USER_INPUT" = "y" ]; then
			echo "[x] Uploading pypi Package"
			twine upload dist/*
		fi
 fi

echo "[x] Cleaning.."
[[ -d pip-pisocial-analyzer ]] && rm -r pip-pisocial-analyzer
echo "[x] Done"
