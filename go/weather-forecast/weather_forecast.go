// Package weather contains a number of forecasting tools.
package weather

// CurrentCondition stores the current weather condition.
var CurrentCondition string
// CurrentLocation stores the current location.
var CurrentLocation string

// Forecast takes a city and the current condition caches those in CurrentCondition and CurrentLocation,
// and returns a formatted forecast string.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
