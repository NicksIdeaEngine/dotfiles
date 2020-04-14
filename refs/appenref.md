# Truckee

## General Notes

* objective: identify ads people want to see on IG and why they want to see them
* 

## Hours Worked

### April 2020

* 2020-04-02: 20 ads, 14:18:54 - 15:15:09, total: 56m 15s
* 2020-04-03: 20 ads, 23:06:15 - 23:48:26, total: 42m 11s
* 2020-04-04: 20 ads, 23:43:09 - 00:27:31, total: 44m 22s
* 2020-04-05: 19 ads, 22:57:09 - 23:28:06, total: 30m 57s
* 2020-04-07: 19 ads, 17:51:06 - 18:55:49, total: 1h 4m 43s
* 2020-04-08: 20 ads, 21:39:52 - 22:51:12, total: 
* 2020-04-09: 20 ads, 22:01:06 - 23:00:49, total: 
* 2020-04-10: 20 ads, 15:16:49 - 16:16:07, total: 
* 2020-04-12: 20 ads, 21:13:20 - 22:13:23, total: 
* 2020-04-13: x ads, start - stop, total: 
* 2020-04-08: x ads, start - stop, total: 
* 2020-04-08: x ads, start - stop, total: 

### May 2020

# Shasta

## General Notes

### Section 1

#### Goals of This Task

* Search 2.0 and Search Relevance (result relevance)
* Search 2.0 only (data accuracy)

#### Notes About Platform

* The "navigational result" question may sometimes be missing
* Queries can generate more than one result
* Grayed out results may sometimes happen and don't require a rating
* Clicking tye yellow bust + star icon gives lat/lon coordinates of user if known
* Clicking on a result/pin gives pop-up box of info (do NOT rate info in this pop-up box)

#### Overall workflow

1. Understand User Intent
2. Establish Relevance (stop after here if only rating Search Relevance)
3. Check Data Accuracy (only needed for Search 2.0)
  a. Name Accuracy
  b. Address Accuracy
  c. Pin Accuracy

#### Result Relevance Rating

* Considers user intent and distance/prominence
* Always rated independently of any data (name, address, or pin) inaccuracies
* If info given for result points to more than one real-world entity, either assume best result or if tie/unclear, rate *Business/POI is closed or does not exist* and rate for relevance as if entity exists
* **Navigational**
  * Most likely result implied by user's query/location/viewport that satisfies user's distinct intent
  * Distinct user intent:
    * extreme prominence (eiffel tower)
    * uniqueness (complete address)
    * proximity (incomplete address that points to unambiguous option that's close)
* **Excellent**
  * high-quality result that satisfies user's intent
  * highest possible initial rating for ambiguous queries or queries that aren't eligible for Navigational rating
* **Good**
  * only partially satisfies user's intent due to relevance/prominence/distance
* **Acceptable**
  * technically satisfies user's intent but does so poorly due to relevance/distance
* **Bad**
  * doesn't satisfy user's intent due to lack of relevance/great distance (when closer satisfying results are available)
* Any rating of Good or below requires indication of reasons:
  * User Intent issue
  * Distance/Prominence Issue
  * Or both!

#### Data Accuracy Rating

* Name/Address/Pin Accuracy

#### Comments
* Comments are mandatory for any result relevance rating of Good or below as well as any data issues not marked Correct. Explain the reasons for all rating demotions. Be sure to:
  * Include what you think the user intent is.
  * Refer to the guidelines, and if demotion is due to guideline instruction, note the section/rule that guided your decision
  * Include sources if you find incorrect info in a result. Comment should include correct info and source. Links should go directly to info provided, or the comment should explain how to get to the information. Use URL shorteners if URLs are long.
  * Be concise.

### Section 2

#### Understanding User Intent

* Determine user intent using your own research, local knowledge, plus info in rating interface (user location, viewport, viewport age)

#### User Query

* Types of queries
  * **Address Queries:** Contain all or part of a complete address, including street number/name/locality/state/country/postal code
    * Ex: { "Ireland", "Stevens Creek Blvd, Cupertino CA", "New York" }
  * **Point of Interest (POI):** location that people find interesting/useful, known either locally or internationally, and can include businesses
    * Ex: { "London Bridge", "Danube River", "Union Square, SF" }
  * **Business:** contain name of specific business
    * Ex: { "Zola Palo alto", "Bookasaurus", "Starbucks, 7 Boulevard Poissonniere, 75002 Paris, France", "Target sunnyvale" }
  * **Category:** Refers to a group of entities that share characteristics
    * Ex: { "fast fod", "bus stop", "coffee", "gym", "gas San Francisco" }

#### Research Expectation

Use:

* search engines to investigate/understand query intent
* official resources (businesses' official website, national postal service websites, gov't websites whenever possible)
* your own local knowledge
* info provided in the rating interface

#### Result Types

* **Business/POI:** shows name in top field, followed by address, then classification
* **Address:** one of multiple address types, including residential address or locality. this type of result will show the first line of the address in the top field, followed by entire address, and won't include classification.
  * Results without classification aren't always Address result types. Do research to verify, as not all POIs will have a classification.
* **Features Without Expected Address:** POIs or features without an expected address (bus stops, bridges, mountains). they may look like address type results. Check to see if classification is included (if yes, result refers to feature or POI, not Address).

#### Location Intent

* **Explicit:** query is made clearly and indicates specific location or area where results are expected
  * ignore user/viewport locations if query states an explicit location
    * Ex: { "bubble tea tully road san jose", "Boston museums", "kfc Philadelphia" }
  * if query contains relative words like "near me" or "nearest", use user's location (not viewport) as explicit location intent
    * Ex: { "food near me", "nearby/nearest starbucks", "my location" }
* **Implicit:** location expectation not as clear, so you'll use context clues (user location/viewport) to discover area in which user is expecting results
  * if user's location intent is not expressly stated in query, use user location/viewport/viewport age to determine area of expected results
    * Fresh Viewport
      * User inside viewport
        * use user location as location intent. results generally expected in/near viewport. results in this area can't be bad because of distance alone
      * User outside viewport
        * results expected in/near viewport area. all relevant results in viewport are eligible for rating of Excellent. if no results can be found in or near the viewport, use user location as secondary location intent
      * User missing
        * when user is missing, viewport is location intent
    * Stale Viewport (more than 15 minutes old)
      * User inside viewport or outside viewport
        * if viewport is stale, consider only user location as location intent
      * User missing
        * Use stale viewport as location intent
    * Viewport Age Missing
      * User present or missing
        * Consider the viewport fresh
    * Viewport Missing Entirely
      * User present
        * user location sets location intent
      * User missing
        * if user location and viewport are missing, test locale becomes the location intent with strong focus on prominent results

### Section 3

#### Rating the Query-Level 'Navigational Result' Question

* After identifying query intent, you'll answer a query-level question. Decide whether the query intent is unique / clear enough to have only a single (navigational) result in the real world.
* If there's a real-world navigational result for the query, answer yes. Otherwise, no.

### Section 4

#### Rating 'Result Level' Issues

### Section 5

#### Types of connection

* general
* abbreviation/alternate
* category
* spell correction
* transit intent
* special character
* associated entity
* address-result
* no connection

# Serene

## General Notes

* from academy

# General Appen Timeline

#### April

###### Thu 2020-04-02

* Set up Payoneer with PayPal. (note: The fee seems to be $4 or 1% but cannot exceed $10 per withdrawal to PayPal)
* Submitted W9 tax form to Payoneer. Good until end of 2023.
* 


