#!/usr/bin/python
# -*- coding: utf-8 -*-

from setuptools import setup

with open('README.rst', 'r') as fh:
    long_description = fh.read()

setup(
    name='pisocial-analyzer',
    author='Piyush',
    author_email='piyushparashar2k@gmail.com@gmail.com',
    description="API, CLI & Web App for analyzing & finding a person's profile across 300+ social media websites (Detections are updated regularly)",
    long_description=long_description,
    version='0.1',
    license='AGPL-3.0',
    url='',
    packages=['pisocial-analyzer'],
    include_package_data=True,
    scripts=['pisocial-analyzer/pisocial-analyzer'],
    install_requires=['BeautifulSoup4', 'tld', 'termcolor', 'langdetect', 'requests', 'lxml', 'galeodes'],
    package_data={'pisocial-analyzer': ['data/*']},
    python_requires='>=3',
)
