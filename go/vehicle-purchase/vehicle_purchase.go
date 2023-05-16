package purchase

import "fmt"

// NeedsLicense determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
func NeedsLicense(kind string) bool {
	return kind == "car" || kind == "truck"
}

// ChooseVehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
func ChooseVehicle(option1, option2 string) string {
	targetCar := option2
	if option1 < option2 {
		targetCar = option1
	} 

	return fmt.Sprintf("%s is clearly the better choice.", targetCar)
}

// CalculateResellPrice calculates how much a vehicle can resell for at a certain age.
func CalculateResellPrice(originalPrice, age float64) float64 {
	var valueRetained float64
	if age < 3 {
		valueRetained = 0.8
	} else if age < 10 {
		valueRetained = 0.7
	} else {
		valueRetained = 0.5
	}
	return originalPrice * valueRetained
}
