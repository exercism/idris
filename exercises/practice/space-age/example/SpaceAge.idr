module SpaceAge

public export
data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

orbitalPeriod : Planet -> Double
orbitalPeriod Mercury = 0.2408467
orbitalPeriod Venus   = 0.61519726
orbitalPeriod Earth   = 1.0
orbitalPeriod Mars    = 1.8808158
orbitalPeriod Jupiter = 11.862615
orbitalPeriod Saturn  = 29.447498
orbitalPeriod Uranus  = 84.016846
orbitalPeriod Neptune = 164.79132

secondsInEarthYear = 31557600.0

export
age : Planet -> Integer -> Double
age planet seconds = (cast seconds) / (secondsInEarthYear * orbitalPeriod planet)
