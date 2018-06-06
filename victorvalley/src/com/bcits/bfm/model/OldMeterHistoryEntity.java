package com.bcits.bfm.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity
@Table(name="PREPAID_METER_HISTORY")
@NamedQueries({
	@NamedQuery(name="OldMeterHistoryEntity.readMeterData",query="SELECT om FROM OldMeterHistoryEntity om ORDER BY om.hid DESC"),
	@NamedQuery(name="OldMeterHistoryEntity.testUniqueCaNo",query="SELECT mh FROM OldMeterHistoryEntity mh"),
	@NamedQuery(name="OldMeterHistoryEntity.getSingleData",query="SELECT mh FROM OldMeterHistoryEntity mh where ca_no=:ca_No"),
	@NamedQuery(name="OldMeterHistoryEntity.getOldMeterData",query="select om.hid,om.ca_no,om.propertyNo,om.personName,om.meterNumber,nvl(om.balance,0),nvl(om.initailReading,0),nvl(om.dgReading,0),om.serviceStartDate,om.serviceEndDate FROM OldMeterHistoryEntity om ORDER BY om.hid DESC")
})

public class OldMeterHistoryEntity {

	@Id
	@SequenceGenerator(name="PREPAID_METER_HISTORY_SEQ",sequenceName="PREPAID_METER_HISTORY_SEQ" )
	@GeneratedValue(generator="PREPAID_METER_HISTORY_SEQ")
	@Column(name="MID")
	private int hid;
	
	@Column(name="CA_NO")
	private String ca_no;
	
	@Column(name="PROPERTY_NO")
	private String propertyNo;
	
	@Column(name="PERSON_NAME")
	private String personName;
	
	@Column(name="METER_NUMBER")
	private String meterNumber;
	
	@Column(name="SERVICE_START_DATE")
	private Date serviceStartDate;
	
	@Column(name="BALANCE")
	private double balance;
	
	@Column(name="SERVICE_END_DATE")
	private Date serviceEndDate;
	
	@Column(name="INITIAL_READING")
	private double initailReading;
	
	public double getInitailReading() {
		return initailReading;
	}

	public void setInitailReading(double initailReading) {
		this.initailReading = initailReading;
	}

	public double getDgReading() {
		return dgReading;
	}

	public void setDgReading(double dgReading) {
		this.dgReading = dgReading;
	}

	@Column(name="FINAL_READING")
	private double dgReading;
	
	

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getCa_no() {
		return ca_no;
	}

	public void setCa_no(String ca_no) {
		this.ca_no = ca_no;
	}
	
	public String getPropertyNo() {
		return propertyNo;
	}

	public void setPropertyNo(String propertyNo) {
		this.propertyNo = propertyNo;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getMeterNumber() {
		return meterNumber;
	}

	public void setMeterNumber(String meterNumber) {
		this.meterNumber = meterNumber;
	}


	public Date getServiceStartDate() {
		return serviceStartDate;
	}

	public void setServiceStartDate(Date serviceStartDate) {
		this.serviceStartDate = serviceStartDate;
	}

	
	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	public Date getServiceEndDate() {
		return serviceEndDate;
	}

	public void setServiceEndDate(Date serviceEndDate) {
		this.serviceEndDate = serviceEndDate;
	}
	
	

	
}
