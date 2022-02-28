# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

paths_allowed("https://collections.ed.ac.uk/art)")

library(usethis)
use_git_config(user.name = "John Bennett", 
               user.email = "bennjt20@wfu.edu")

# set url ----------------------------------------------------------------------

first_url <- "https://collections.ed.ac.uk/art/search/*:*/Collection:%22edinburgh+college+of+art%7C%7C%7CEdinburgh+College+of+Art%22?offset=0"

# read first page --------------------------------------------------------------

page <- read_html(first_url)

# scrape titles ----------------------------------------------------------------

page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a")

Extract text:
  page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text()

Get rid of white space:
  page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()

Save data as vector length of 10:
titles <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()

# scrape links -----------------------------------------------------------------

page %>%
  html_nodes(".iteminfo") %>%   # same nodes
  html_node("h3 a") %>%         # as before
  html_attr("href")

Good URL for artwork: https://collections.ed.ac.uk/art/record/21297?highlight=*
Bad URL for artwork: ./record/21297?highlight=*:*
  
  ?str_replace()
  
Test1:
  str_replace(string = "./record/", pattern = "./", replacement = "test")
Test2:
str_replace(string = "*:*", pattern = ":*", replacement = " ")
[NOTE: Test1 and Test 2 appear to have deleted my list of 10 website. This is where things broke down]
Test3:
  str_replace(string = "./record/", pattern = "./record", replacement = "https://collections.ed.ac.uk/art/record")
Test4: 
  str_remove(string = "./record", pattern = ".")

Test5:
  page %>%
  html_nodes(".itemInfo") %>%
  html_text() %>%
  str_remove(string = "./record", pattern = ".")

Test6:
  page %>%
  html_nodes(".itemInfo") %>%
  html_text() %>%
    str_replace(string = "./record/", pattern = "./record", replacement = "https://collections.ed.ac.uk/art/record")

Examples of replace:
str_replace(string = "jello", pattern = "j", replacement = "h")
str_replace("\\.", "___")


# scrape artists ---------------------------------------------------------------

artists <- page %>%
  html_nodes(".iteminfo") %>%
  html_node(".artist") %>%
  ___
  
  
  Template from title:
  artist %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a")

Extract text:
  artist %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text()

Get rid of white space:
  page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()

Save data as vector length of 10:
titles <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()
  

# put together in a data frame -------------------------------------------------

first_ten <- tibble(
  title = ___,
  artist = ___,
  link = ___
)

# scrape second ten paintings --------------------------------------------------

second_url <- "___"

page <- read_html(second_url)
...

second_ten <- tibble(
  ...
)