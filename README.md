# Excelsior Mobile Project

## Introduction:
You are recently hired by Excelsior Mobile to be their new business analyst. Excelsior Mobile is a very small mobile company and is looking to expand so they want you to run some analysis on their customer database and figure out where they should put their marketing efforts and some other important analytical questions.

## Data Description:
There are some terms you need to understand in order to use this DB:

MIN: Mobile Identification Number: unique number assigned by the wireless service provider. (account #)
MDN: The phone number
IMEI: International Mobile Equipment Identity: unique number for identifying a device on a mobile network. (like your vehicles VIN)
There are 6 tables in the sample of Excelsior Mobile's DB.

Subscriber: Subscriber information including address, MDN and MIN.
Device: information about the devices used at Excelsior Mobile and has IMEI
DirNums: identifys the city and state of each MDN and connects it with an IMEI
MPlan: table of the plans used at Excelsior Mobile. Has data, throttle and cost
Bill: table of the current bills for each MIN, includes bill costs
LastMonthUsage: table of the last month of usage for each MIN, includes minutes, data in MB and texts
