# Overview

When I first started working out, I was very lost on what to do. There is so much to do at the gym, I was very overwhelmed if I was going an exercise correctly, or if I was looking silly doing the exercises I thought I knew how to do. In this project, my goal is to help beginners in the fitness world understand how to do the exercises they already know as well as learning about new exercises they can implement in their workout.

As mentioned in the YouTube video below, with the help of my professor, I found a GitHub repo of hundreds of workouts that have a bunch of information on each one. In my code, I call the raw .json file and call the information inside the link to display to the user. So when the user types in the exercise, it will give them the according informaiton on the specific exercise they are looking into.

Like I mentioned above, my purpose for writing this software was to guide beginners who are trying to workout a way to feel more comfprtable at the gym. When I began going, I was often very embarassed if I was doing a "bad" exercise or if I was just completely doing it wrong in general. I wish I had a very easy tool where I could look up an exercise and it could tell me how to do it/ information that is helpful to know on what muscle group day I should fit the exercise in.

[Software Demo Video] https://youtu.be/_kY9LpKQBT4

# Cloud Database

I am not necessarily using a specific cloud perse, but I am primarily using GuitHub which acts as a sort of cloud where I am getting my information from to display to the user. The structure of the database I am using is a .json link. I created a variable within my code that looks for the user input, inserts that input into a link that looks at the GitHub repo and proceeds to display the user the information given in that repo.

# Development Environment

The tools I used to develop this software was primarily the Flutter framework (using dart language). I used two external packages/libraries: 
1. flutter/material.dart: This is the Flutter framework for building the UI. It's a part of the Flutter SDK. 
2. http: This is a Dart package for making HTTP requests. This was added into my YAML.

# Useful Websites

- [ChatGPT] https://chat.openai.com
- [Stack Overflow] https://stackoverflow.com/questions/71294190/how-to-read-local-json-file-in-flutter
- [Flutter Website] https://docs.flutter.dev/data-and-backend/serialization/json

# Future Work

- Have a button that will pick a random exercise for the user to look at.
- Make the input case insensitive.
- Display pictures of the specific exercise.