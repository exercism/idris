module Meetup

import Data.Nat

public export
data Month = January | February | March | April | May | June | July | August | September | October | November | December

public export
data Week = First | Second | Third | Fourth | Teenth | Last

public export
data DayOfWeek = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday


daysInMonth : Nat -> Month -> Nat
daysInMonth _ January = 31
daysInMonth year February = if isLeap year then 29
                            else 28
  where isLeap : Nat -> Bool
        isLeap year =
          (divBy 4 && not (divBy 100)) || divBy 400
          where divBy : Nat -> Bool
                divBy n = (year `mod` n) == 0
daysInMonth _ March = 31
daysInMonth _ April = 30
daysInMonth _ May = 31
daysInMonth _ June = 30
daysInMonth _ July = 31
daysInMonth _ August = 31
daysInMonth _ September = 30
daysInMonth _ October = 31
daysInMonth _ November = 30
daysInMonth _ December = 31

weekConcludes : Nat -> Month -> Week -> Nat
weekConcludes _ _ First = 7
weekConcludes _ _ Second = 14
weekConcludes _ _ Third = 21
weekConcludes _ _ Fourth = 28
weekConcludes _ _ Teenth = 19
weekConcludes year month Last = daysInMonth year month

dayOfWeekIndex : DayOfWeek -> Nat
dayOfWeekIndex Monday = 1
dayOfWeekIndex Tuesday = 2
dayOfWeekIndex Wednesday = 3
dayOfWeekIndex Thursday = 4
dayOfWeekIndex Friday = 5
dayOfWeekIndex Saturday = 6
dayOfWeekIndex Sunday = 7

dayOfWeekIndexCalculated : Nat -> Month -> Nat -> Nat
dayOfWeekIndexCalculated year month dayInMonth = ((year1 + (year1 `div` 400) + (year1 `div` 4) `minus` (year1 `div` 100)) + (monthOffset month) + dayInMonth) `mod` 7 + 1
  where isBeforeMarch : Month -> Bool
        isBeforeMarch January = True
        isBeforeMarch February = True
        isBeforeMarch _ = False
        year1 = if isBeforeMarch month then pred year
                else year
        monthOffset : Month -> Nat
        monthOffset January = 307  -- offset from the end of February year1
        monthOffset February = 338
        monthOffset March = 1
        monthOffset April = 32
        monthOffset May = 62
        monthOffset June = 93
        monthOffset July = 123
        monthOffset August = 154
        monthOffset September = 185
        monthOffset October = 215
        monthOffset November = 246
        monthOffset December = 276

meetupDay : Nat -> Month -> Week -> DayOfWeek -> Nat
meetupDay year month week dayofweek = (dayWeekConcludes + requiredDayIndex) `minus` (concludingDayIndex + adjustment)
  where dayWeekConcludes = weekConcludes year month week
        concludingDayIndex = dayOfWeekIndexCalculated year month dayWeekConcludes
        requiredDayIndex = dayOfWeekIndex dayofweek
        adjustment : Nat
        adjustment = if concludingDayIndex < requiredDayIndex then 7
                     else 0

export
meetup : Nat -> Month -> Week -> DayOfWeek -> String
meetup year month week dayofweek = (fourDigit year) ++ "-" ++ (twoDigit $ monthIndex month) ++ "-" ++ (twoDigit $ meetupDay year month week dayofweek)
  where fourDigit : Nat -> String
        fourDigit n = if n >= 1000 then show n
                      else if n >= 100 then  "0" ++ (show n)
                      else if n >= 10 then  "00" ++ (show n)
                      else "000" ++ (show n)
        twoDigit : Nat -> String
        twoDigit n = if n >= 10 then show n
                     else "0" ++ (show n)
        monthIndex : Month -> Nat
        monthIndex January = 1
        monthIndex February = 2
        monthIndex March = 3
        monthIndex April = 4
        monthIndex May = 5
        monthIndex June = 6
        monthIndex July = 7
        monthIndex August = 8
        monthIndex September = 9
        monthIndex October = 10
        monthIndex November = 11
        monthIndex December = 12
