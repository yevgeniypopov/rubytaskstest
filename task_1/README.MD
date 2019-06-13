# Message truncator

The goal of this task is to implement module which can be used to truncate string attributes in any class, just by extending its functionality.

## Rules
1. All work should be done in `truncate.rb` file
2. Ruby version doesn't matter
3. You can't use anything except Ruby standard library. No gems allowed

## Example usage
```ruby
$ ruby task_1/test.rb
Given message body: The fact that so many people make so much effort on the internet to make other random people from around the world laugh/feel better is a great achievement of the human race.
--------------------------------------------------------------------------------
Processed message: The fact that so many people make so much effort on the internet to make other random people from around the world laugh...

```