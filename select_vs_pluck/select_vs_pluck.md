I was recently working on a client's app when I found a small mistake I've been making when it comes to using more non-trivial SQL queries with ActiveRecord.

The distinction came down to using [pluck](http://apidock.com/rails/ActiveRecord/Calculations/pluck) vs [select](http://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html#method-i-select).

I was recently working on a client's app that needed a little more finely-tuned SQL than using just plain ActiveRecord methods could provide (or at least provide nicely). So I broke into ~tEh RaW sQLz~ and ended up with a query that basically found a specific set of IDs from an associated model, and then joined those IDs to another table to produce the final result:

```
result = SomeModel.joins("crazy sql things here with joins and wheres and groups and such") 
```

The query part got a little crazy, so I decided to break a piece of it out into another variable for readability—since the query 

```
# Broke this into a variable for clarity of what the method is doing, since it isn't executed until the end
thing_ids = Thing.joins("do crazy sql things here with joins and wheres and groups and such")

result = SomeOtherThing.joins("more crazy things").where(thing_id: thing_ids)
```