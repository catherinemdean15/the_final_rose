# The Final Rose

This Rails application is intended to be used as a practice challenge for Mod 2.

The Final Rose is an application that displays past Bachelorette's, their contestants, and the outings (dates) that the contestants went on while on the show. Bachelorettes have many contestants, contestants belong to a bachelorette (that feels not great to type), contestants can have many outings that they go on and an outing can have more than one contestant on it (this is a real thing that happens on the show). Before getting started, think about what this relationship will look like between Bachelors, Contestants, and Outings.


## User Stories

```
User Story 1 of 6

As a visitor,
When I visit '/bachelorettes/:id',
I see that bachelorette's:
-Name
-Season Number
-Description of Season that they were on
(e.g.             
                  Hannah Brown
    Season 15 - The Most Dramatic Season Yet!
  )
I also see a link to see that bachelorette's contestants
When I click on that link
I'm taken to "/bachelorettes/:bachelorette_id/contestants"
and I can see only that bachelorette's contestants
```

```
User Story 2 of 6

As a visitor,
When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',
I see the names of that bachelorette's contestants along with the following information:
-Age
-Hometown
(e.g. "Name: Pilot Pete, Age: 34, Hometown: Irving, TX")
And I can click on any contestants name (as a link) to go to that contestants show page "/contestants/:id"
```

```
User Story 3 of 6

As a visitor,
When I visit a contestants show page,
I see that contestants name as well as the season number and season description that this contestant was on.
I also see a list of names of the outings that this contestant has been on while on the show.
(e.g.
                        Ben Higgins
Season 20 - No wait, THIS is the most dramatic season yet

Outings: Kickball
        Hot Springs
        Helicopter Ride
)
When I click on an outing name, I'm taken to that outings show page
```

```
User Story 4 of 6
As a visitor,
When I visit an outings show pages,
I see that outings name, location, and date
And I see a total count of contestants that were on this outing
And I see a list of all names of the contestants that went on this outing

(e.g.       Helicopter Ride
            Location: Bali
            Date: 09/12/19
          Count of Contestants: 3
Contestants: JoJo Fletcher, Kaitlyn Bristowe, Hannah Brown)
```

```
User Story 5 of 6

As a visitor,
When I visit a bachelorette show page
I see the average age of all of that bachelorette's contestants

(e.g. "Average Age of Contestants: 29.5")
```

```
User Story 6 of 6

As a visitor,
When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',

I see a UNIQUE list of all of the hometowns that these contestants are from.

(e.g. "These Contestants are from these hometowns: Denver, Aurora, San Diego, Boston")
```
