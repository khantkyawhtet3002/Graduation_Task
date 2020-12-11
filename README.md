# [YGN_outfits]
## Overview
 An app that allows customers and creators to exchange information such as reviews, comments, usage examples, and changes over time from purchasers for the works and goods of individual writers.
 It is a communication tool that enables the self-satisfaction of the creator and the management and utilization of customer information and satisfaction information that tends to be vague.

## Concept<br>
 - Being able to handle a variety of simple work forms<br>
 - Easy to handle for customers

## Version<br>
Ruby 2.6.5<br>
Rails 5.2.4

## Function list<br>
- Login function by devise<br>
  - Customer, maker(seller) certification function<br>
  - Email address, name or maker(seller)'s name, password required<br>
  - Password reset function<br>
- Screen transition that makes it easy for customers to find the product<br>
- List of customers evaluating the maker(seller)'s products
- Image upload function<br>
- Visually evaluate with the 5-star rating function
  - Calculate and display the average evaluation of customers for the same product<br>
- Not only the maker(seller) but also other customers can comment on the evaluation of the product.<br>
- Customer names and comments are not open to the public<br>
- Give customers a score according to their posts<br>
  - Notify the maker(seller) when the score is above a certain level<br>

## Catalogue design<br>
https://docs.google.com/spreadsheets/d/1pavEFOsaAsg2LY86N63ve0eG75B8d1D_ASm4tkDSpd0/edit?usp=sharing

## Table defination<br>
https://docs.google.com/spreadsheets/d/1bJKMnksVAG7osblThfLJs9N3dc839DpaIY0mH8kTiKg/edit?usp=sharing

## Screen transition diagram<br>
![YGN_outfits_UIflow]()

## ER diagram<br>
https://cacoo.com/diagrams/WNfBDckoFLDJOpBg/26D55

![ER図](https://cacoo.com/diagrams/WNfBDckoFLDJOpBg-26D55.png)


## Use Gem<br>
carrierwave<br>
mini_magick<br>
devise<br>
jquery-rails<br>
rspec-rails<br>
slim-rails<br>

## 5 star rating plugin
jQuery Raty
