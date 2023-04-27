#!/bin/bash
uvicorn --factory {{cookiecutter.package_name}}.api:create_app --reload
