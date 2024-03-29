
#ifndef SCHEDULESHUTTLETASK_H_
#define SCHEDULESHUTTLETASK_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/planet/PlanetManager.h"
//Infinity: Custom includes
#include "server/zone/managers/city/CityManager.h"

class ScheduleShuttleTask : public Task, public Logger {
	ManagedWeakReference<CreatureObject*> shuttleObject;
	Zone* zone;

public:
	ScheduleShuttleTask(CreatureObject* shuttle, Zone* zon) : Task() {
		shuttleObject = shuttle;
		zone = zon;

		Logger::setLoggingName("ScheduleShuttleTask");
	}

	void run() {
		if (zone == nullptr) {
			error() << " zone has a nullptr.";
			return;
		}

		auto zoneServer = zone->getZoneServer();

		if (zoneServer == nullptr) {
			error() << " zoneServer is nullptr.";
			return;
		}

		if (zoneServer->isServerLoading()) {
			schedule((10 + System::random(10)) * 1000);
			return;
		}

		ManagedReference<CreatureObject*> strongReference = shuttleObject.get();

		if (strongReference == nullptr) {
			error() << " Shuttle strongReference has a nullptr in Zone: " << zone->getZoneName();
			return;
		}

		Locker _lock(strongReference);

		ManagedReference<PlanetManager*> planetManager = zone->getPlanetManager();

		if (planetManager == nullptr) {
			zone->error() << " planetManager has a nullptr in Zone: " << zone->getZoneName();
			return;
		}

		ManagedReference<CityRegion*> cityRegion = strongReference->getCityRegion().get();

		float x = strongReference->getWorldPositionX();
		float y = strongReference->getWorldPositionY();
		float z = strongReference->getWorldPositionZ();
		String zoneName = zone->getZoneName();

		if ((cityRegion != nullptr) && (cityRegion->getMayorID() != 0)) {

			bool isRegistered = cityRegion->isRegistered();

			Vector3 arrivalVector(x, y, z);

			Locker clocker(cityRegion, strongReference);
			cityRegion->setShuttleID(strongReference->getObjectID());
			clocker.release();

			//zone->error() << " cityRegionName = " << cityRegion->getCityRegionName();

			PlanetTravelPoint* planetTravelPoint = new PlanetTravelPoint(zoneName, cityRegion->getCityRegionName(), arrivalVector, arrivalVector, strongReference);
			planetManager->addPlayerCityTravelPoint(planetTravelPoint);
			planetManager->scheduleShuttle(strongReference, PlanetManager::SHUTTLEPORT);

		}
		else {
			Reference<PlanetTravelPoint*> travelPoint = planetManager->getNearestPlanetTravelPoint(strongReference, 128.f);

			if (travelPoint == nullptr) {
				error() << " Planet Travel Point (travelPoint) has a nullptr in Zone: " << zoneName << ".  x=" << x << ", z=" << z << ", y=" << y;
				return;
			}

			auto oldShuttle = travelPoint->getShuttle();

			if (oldShuttle == nullptr) {
				travelPoint->setShuttle(strongReference);

				if (travelPoint->isInterplanetary()) {
					planetManager->scheduleShuttle(strongReference, PlanetManager::STARPORT);
				} else {
					planetManager->scheduleShuttle(strongReference, PlanetManager::SHUTTLEPORT);
				}
			} else if (oldShuttle != strongReference) {
				strongReference->destroyObjectFromWorld(true);
				strongReference->destroyObjectFromDatabase(true);
			}
		}
	}
};

#endif /* SCHEDULESHUTTLETASK_H_ */
