# New York Times Cooking Recipes

## About

This repository assesses the New York Times cooking recipes and help users to filter out the recipes that matches with their input ingredients.


## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START -->

|                                                Contributions | Name                                          |
|-----------------------------------------------------:|:-----------------|
| [🖋](# "Content") [💻](# "Code") [🤔](# "Ideas and Planning") | [Alison Gu](https://github.com/AlisonGu)      |
| [🖋](# "Content") [💻](# "Code") [🔣](# "Data")[📆](# "Project Management") | [Tint Tha Ra Wun](https://github.com/ttharawun)  |
| [🖋](# "Content") [💻](# "Code")[🔣](# "Data") [🚇](# "Infrastructure") | [Zhen Nie](https://github.com/Znie98)      |
| [🖋](# "Content") [💻](# "Code") [📆](# "Project Management") | [Teddy Martin](https://github.com/tkmartin25) |


<!-- ALL-CONTRIBUTORS-LIST:END -->

## Dependencies

To run all code in the qmd files throughout this repository the dependencies are listed within each file. The full list of dependencies are provided below:

`here`, `rvest`, `devtools`, `rio`and `dplyr`.

## How to Access

This repository may be accessed through the package website. 

## Definitions and Acronym

#### NYTcooking
NYTcooking is the acronym of [the New York Times Cooking](https://cooking.nytimes.com/). It is a website providing users with all kinds of rated recipes by the New York Times.


## Data Sources
#### Sources
Our source of recipes are from [the New York Times] (https://www.nytimes.com/subscription/cooking.html?campaignId=8F8HX&ds_c=71700000067126147&gclid=CjwKCAjwov6hBhBsEiwAvrvN6E9jfipI7h6OxEeZR4Au6IqlkOB1Vue6pQ6oDs5HxaLKFHPZ9jzsLhoCs-gQAvD_BwE&gclsrc=aw.ds) and was collected using `get_recipe.R` script in the `R` folder.

The source was last accessed on April. 15 2023


#### Data cleaning

We have the data collected from the New York Times cooking website and the cooking time column of the data was cleaned. 

## Data Collection and Update Process

The data process is not automated, however to access updated data one must simply run the scripts in the'get_recipe.R' script in the `R` folder.

## Architecture and Where to Start

We organized our repository with the name and categories of them. Starting with the `R` folder is recommended as this is where we organized our code for the package.
 

## License

MIT License

Copyright (c) [2023] [Alison Gu, Zhen Nie, Tint Tha Ra Wun, and Teddy Martin]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## How to Provide Feedback

Questions, bug reports, and feature requests can be submitted to this repo's [issue queue](https://github.com/Adv-R-Programming/final-project-nycooking/issues).

## Have Questions?

If you have questions please submit them in this repo's [issue queue](https://github.com/Adv-R-Programming/final-project-nycooking/issues). 
