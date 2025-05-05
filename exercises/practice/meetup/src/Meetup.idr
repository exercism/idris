module Meetup

public export
data Month = January | February | March | April | May | June | July | August | September | October | November | December

public export
data Week = First | Second | Third | Fourth | Teenth | Last

public export
data DayOfWeek = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

export
meetup : Nat -> Month -> Week -> DayOfWeek -> String
meetup year month week dayofweek = ?meetup_rhs
