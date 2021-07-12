package dao;

import java.util.ArrayList;

import dto.Vehicle;

public class VehicleRepository {
	private ArrayList<Vehicle> listOfVehicles = new ArrayList<Vehicle>();
	private ArrayList<Vehicle> listOfPanameras = new ArrayList<Vehicle>();
	private ArrayList<Vehicle> listOf718s = new ArrayList<Vehicle>();
	private ArrayList<Vehicle> listOf911s = new ArrayList<Vehicle>();

	private static VehicleRepository instance = new VehicleRepository();

	public static VehicleRepository getInstance() {
		return instance;
	}

	public VehicleRepository() {
		Vehicle panamera4S = new Vehicle("Models1", "Panamera 4S", 170900);
		panamera4S.setDescription("Top speed: 289km/h\r\n" + "Acceleration from 0 - 100 km/h: 4.4s");
		panamera4S.setCategory("Panamera");
		panamera4S.setUnitsInStock(20);
		panamera4S.setCondition("New");
		panamera4S.setFilename("Models1.jpg");
		panamera4S.setReleaseDate("2018.09.10");

		Vehicle panameraTurbo = new Vehicle("Models2", "Panamera Turbo", 246000);
		panameraTurbo.setDescription("Top speed: 306 km/h\r\n" + "Acceleration from 0 - 100 km/h: 3.8s");
		panameraTurbo.setCategory("Panamera");
		panameraTurbo.setUnitsInStock(10);
		panameraTurbo.setCondition("New");
		panameraTurbo.setFilename("Models2.jpg");
		panameraTurbo.setReleaseDate("2019.04.20");

		Vehicle panameraGTS = new Vehicle("Models3", "Panamera GTS", 201500);
		panameraGTS.setDescription("Top speed: 292 km/h\r\n" + "Acceleration from 0 - 100 km/h: 4.1s");
		panameraGTS.setCategory("Panamera");
		panameraGTS.setUnitsInStock(5);
		panameraGTS.setCondition("New");
		panameraGTS.setFilename("Models3.jpg");
		panameraGTS.setReleaseDate("2019.01.12");

		Vehicle Boxter718S = new Vehicle("Models4", "718 Boxter S", 99400);
		Boxter718S.setDescription("Top speed: 285 km/h\r\n" + "Acceleration from 0 - 100 km/h: 4.4s");
		Boxter718S.setCategory("718");
		Boxter718S.setUnitsInStock(50);
		Boxter718S.setCondition("New");
		Boxter718S.setFilename("Models4.jpg");
		Boxter718S.setReleaseDate("2018.04.23");

		Vehicle Cayman718 = new Vehicle("Models5", "718 Cayman", 83800);
		Cayman718.setDescription("Top speed: 275 km/h\r\n" + "Acceleration from 0 - 100 km/h: 4.9s");
		Cayman718.setCategory("718");
		Cayman718.setUnitsInStock(45);
		Cayman718.setCondition("New");
		Cayman718.setFilename("Models5.jpg");
		Cayman718.setReleaseDate("2018.11.08");

		Vehicle CaymanGTS = new Vehicle("Models6", "Cayman GTS", 109100);
		CaymanGTS.setDescription("Top speed: 290 km/h\r\n" + "Acceleration from 0 - 100 km/h: 4.3s");
		CaymanGTS.setCategory("718");
		CaymanGTS.setUnitsInStock(40);
		CaymanGTS.setCondition("New");
		CaymanGTS.setFilename("Models6.jpg");
		CaymanGTS.setReleaseDate("2019.07.01");

		Vehicle Carrera911S = new Vehicle("Models7", "911 Carrera S", 158400);
		Carrera911S.setDescription("Top speed: 308 km/h\r\n" + "Acceleration from 0 - 100 km/h: 3.7 s");
		Carrera911S.setCategory("911");
		Carrera911S.setUnitsInStock(100);
		Carrera911S.setCondition("New");
		Carrera911S.setFilename("Models7.jpg");
		Carrera911S.setReleaseDate("2019.10.23");

		Vehicle Cabriolet911S = new Vehicle("Models8", "911 Carrera S Cabriolet", 174700);
		Cabriolet911S.setDescription("Top speed: 306 km/h\r\n" + "Acceleration from 0 - 100 km/h: 3.9 s");
		Cabriolet911S.setCategory("911");
		Cabriolet911S.setUnitsInStock(100);
		Cabriolet911S.setCondition("New");
		Cabriolet911S.setFilename("Models8.jpg");
		Cabriolet911S.setReleaseDate("2020.05.20");

		Vehicle Cabriolet9114S = new Vehicle("Models9", "911 Carrera 4S Cabriolet", 183900);
		Cabriolet9114S.setDescription("Top speed: 304 km/h\r\n" + "Acceleration from 0 - 100 km/h: 3.8 s");
		Cabriolet9114S.setCategory("911");
		Cabriolet9114S.setUnitsInStock(70);
		Cabriolet9114S.setCondition("New");
		Cabriolet9114S.setFilename("Models9.jpg");
		Cabriolet9114S.setReleaseDate("2018.8.10");

		listOfPanameras.add(panamera4S);
		listOfPanameras.add(panameraTurbo);
		listOfPanameras.add(panameraGTS);
		listOf718s.add(Boxter718S);
		listOf718s.add(Cayman718);
		listOf718s.add(CaymanGTS);
		listOf911s.add(Carrera911S);
		listOf911s.add(Cabriolet911S);
		listOf911s.add(Cabriolet9114S);

		joinAllList();
	}

	public void joinAllList() {
		listOfVehicles.addAll(listOfPanameras);
		listOfVehicles.addAll(listOf718s);
		listOfVehicles.addAll(listOf911s);
	}

	public ArrayList<Vehicle> getAllVehicles() {
		return listOfVehicles;
	}

	public ArrayList<Vehicle> getAllPanameras() {
		return listOfPanameras;
	}

	public ArrayList<Vehicle> getAll718s() {
		return listOf718s;
	}

	public ArrayList<Vehicle> getAll911s() {
		return listOf911s;
	}

	public Vehicle getVehicleById(String vehicleId) {
		Vehicle vehicleById = null;

		for (int i = 0; i < listOfVehicles.size(); i++) {
			Vehicle vehicle = listOfVehicles.get(i);
			if (vehicle != null && vehicle.getVehicleId() != null && vehicle.getVehicleId().equals(vehicleId)) {
				vehicleById = vehicle;
				break;
			}
		}
		return vehicleById;
	}

	public void addVehicle(Vehicle vehicle) {
		if (vehicle.getCategory().contains("Panamera")) {
			listOfPanameras.add(vehicle);
		} else if (vehicle.getCategory().contains("718")) {
			listOf718s.add(vehicle);
		} else if (vehicle.getCategory().contains("911")) {
			listOf911s.add(vehicle);
		}
		System.out.print(listOfPanameras.size());
		listOfVehicles.clear();
		joinAllList();
	}
}
