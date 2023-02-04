from setuptools import setup, find_packages

import pathlib

here = pathlib.Path(__file__).parent.resolve()

long_description = (here / "README.md").read_text(encoding="utf-8")

setup(
    name="python-boilerplate",
    version="0.0.1",
    description="A sample Python project with tests and tooling setup",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/robchrob/python-boilerplate",
    author="Robert Chrobociński",
    author_email="robert.chrobocinski@gmail.com",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Programming Language :: Python :: 3 :: Only",
    ],
    keywords="sample, setuptools, development",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    python_requires=">=3.7, <4",
    project_urls={
        "Bug Reports": "https://github.com/robchrob/python-boilerplate/issues",
        "Source": "https://github.com/robchrob/python-boilerplate",
    },
)
