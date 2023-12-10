# Neobis_ios_auth

## Table of contents
* [Description](#description)
* [Getting started](#getting-started)
* [Usage](#usage)
* [Running the Tests](#running-the-tests)
* [Workflow](#workflow)
* [Design](#design)
  
## Description 

This is the seventh project in Neobis Club. This project was special one, because I didn't do it alone, it was made with backend developer. So, the main logic of this project is authorization: save users' email and password, and when user will try to log in, check password to correctness.

## Getting started 

- Make sure you have the XCode version 14.0 or above installed on your computer
- Download the project files from the repository
- Install CocoaPods
- Run pod install so you can install dependencies in your project (SnapKit is used in the project)
- Open the project files in Xcode
- Run the active scheme by using any emulator

## Usage

On first screen, User have two choice: first is to login by filling in login and password text fields, if user already has an account. The second choice, is to create accout, if user does not have account. In register screen, user have to fill in his email, username(login) and password, which follow some rules. And after register, user will take confirm link into email.

## Running the Tests

Tested all possible scenarios and POST requests, like trying to create account on one email or username. Or writing wrong password. Everything works correct.

## Workflow

- Reporting Bugs:
    If you come across any bugs while using this project, please report us by creating an issue on the Github repository
- Submitting pull requests:
    If you have a bug fix or a new feature for project, feel free to submit a pull request. Make sure that your changes are well-tested.
- Improving documentation:
    If you notice any errors or mistakes in the documentation, you can submit pull request with your changes
- Providing feedback:
    If you have any feedback, you can send an email to project maintainer

## Design

Below is a screenshot of how application looks like on iphone 14:

<img src="https://github.com/KryaKa57/neobis_ios_auth/assets/132449744/8e6b1a16-0867-4668-b899-ee25980789d2" width="200" />
<img src="https://github.com/KryaKa57/neobis_ios_auth/assets/132449744/d49fe980-5d4b-49dc-b31a-41f29fd51119" width="200" />

<img src="https://github.com/KryaKa57/neobis_ios_auth/assets/132449744/8c5c6892-28e1-4473-b2b5-8b9a529f0cee" width="200" />
<img src="https://github.com/KryaKa57/neobis_ios_auth/assets/132449744/4fa6431c-c929-4772-9200-7cec2f5d55f2" width="200" />


