package org.arthur.case_study.model;

public class Contract {
    private int id;
    private String dateStart;
    private String dateEnd;
    private double deposit;
    private double totalMoney;
    private int idEmployee;
    private int idCustomer;
    private int idService;
    private boolean isActive = true;

    public Contract() {
    }

    public Contract(int id, String dateStart, String dateEnd, double deposit, double totalMoney, int idEmployee, int idCustomer, int idService) {
        this.id = id;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.idEmployee = idEmployee;
        this.idCustomer = idCustomer;
        this.idService = idService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }
    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
