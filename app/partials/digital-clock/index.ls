require! {
  '../../modules/aktos-dcs': {
    RactivePartial,
    IoActor,
  }
}

RactivePartial! .register ->
  $ '.digital-clock' .each !->
    elem = $ this
    actor = IoActor elem

    monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
    dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    new-date = new Date!
    new-date.set-date new-date.get-date!
    $ \#digital-date .html dayNames[new-date.get-day!] + ' ' + new-date.get-date! + ' ' + monthNames[new-date.getMonth!] + ' ' + new-date.get-full-year!

    set-interval ->
      seconds = new Date!.get-seconds!
      $ \#digital-sec .html((if seconds < 10 then "0" else "") + seconds)
    , 1000
    set-interval ->
      minutes = new Date!.get-minutes!
      $ \#digital-min .html((if minutes < 10 then "0" else "") + minutes)
    , 1000

    set-interval ->
      hours = new Date!.get-hours!
      $ \#digital-hours .html((if hours < 10 then "0" else "") + hours)
    , 1000
