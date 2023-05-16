[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/dyrs3KiQ)
![hex-NYT Cooking](https://user-images.githubusercontent.com/62436248/234152754-277d9cbd-9ea4-4ce6-aa9d-f3d931805104.png)

# New York Times Cooking Recipes

## About

This repository assesses the New York Times Cooking website (https://cooking.nytimes.com/), search recipes and return the ones that matches with user's input ingredients.

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

`dplyr`, `hunspell`, `readr`, `rvest`, and `stringr` 

## How to Access

This repository may be accessed through the package website. 

## Definitions and Acronym

#### NYTCcooking

NYTCooking is the acronym of [the New York Times Cooking](https://cooking.nytimes.com/). It is a cooking website from the New York Times that have over 10,000 recipes for cuisines all over the world. 

## Data Sources

#### Sources

Our recipes are from [the New York Times](https://cooking.nytimes.com/). They were collected by scraping the website using `get_recipe.R` script in the `R` folder.

The source was last accessed on April 15, 2023.

#### Data cleaning

Data was cleaned and processed accordingly to our project's requirements.  

## Data Collection and Update Process

In our project, we did not automate the data collection process (i.e., no new recipe is added even if it might be available on the source website). If you want to get new recipes, you can do so by simply running the scripts in the `get_recipe.R` script in the `R` folder.

## Architecture and Where to Start

To explore our functions, starting with the `R` folder is recommended. 
 
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

If you have questions please submit them in this repo's [issue queue](https://github.com/Adv-R-Programming/final-project-nycooking/issues) or contact Tint (ttharawun@smith.edu) 
