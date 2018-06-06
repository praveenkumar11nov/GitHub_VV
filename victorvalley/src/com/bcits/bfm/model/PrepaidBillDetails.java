package com.bcits.bfm.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="PREPAIDBILL_DATA")
@NamedQueries({
	@NamedQuery(name="PrepaidBillDetails.getPreData",query="SELECT pb FROM PrepaidBillDetails pb "),
	@NamedQuery(name="PrepaidBillDetails.getCount",query="SELECT count(pb) FROM PrepaidBillDetails pb WHERE pb.propertyId=:propertyId AND EXTRACT(month FROM pb.bill_Month)=:month AND EXTRACT(year FROM pb.bill_Month)=:year"),
	@NamedQuery(name="PrepaidBillDetails.getBillCount",query="SELECT count(pb) FROM PrepaidBillDetails pb where pb.propertyId=:propertyId"),
	
	
	
	
	
	
	
	
	@NamedQuery(name = "PrepaidBillDetails.downloadAllBills", query = "SELECT elb FROM PrepaidBillDetails elb WHERE EXTRACT(month FROM elb.bill_Month) =:month and EXTRACT(year FROM elb.bill_Month) =:year"),
	@NamedQuery(name = "PrepaidBillDetails.downloadAllBillsOnPropertyNo", query = "SELECT elb FROM PrepaidBillDetails elb WHERE EXTRACT(month FROM elb.bill_Month) =:month and EXTRACT(year FROM elb.bill_Month) =:year AND elb.propertyId=:propertyId"),
	
	@NamedQuery(name="PrepaidBillDetails.fetchBillsDataBasedOnMonthAndPropId",query="SELECT b.billNo FROM PrepaidBillDetails b WHERE  EXTRACT(month FROM b.bill_Month)=:actualmonth AND EXTRACT(year FROM b.bill_Month)=:year AND b.propertyId=:propertyId"),
	@NamedQuery(name = "PrepaidBillDetails.getContactDetailsForMail", query = "SELECT c.contactType,c.contactContent FROM Contact c WHERE c.contactPrimary='Yes' AND c.personId=:personId"),
	
})
public class PrepaidBillDetails {

	@Id
	@SequenceGenerator(name="PREPAIDBILL_DATA_SEQ",sequenceName="PREPAIDBILL_DATA_SEQ")
	@GeneratedValue(generator="PREPAIDBILL_DATA_SEQ")
	@Column(name="BILLID")
	private int preBillId;
	
	@Column(name="PROPERTY_ID")
	private int propertyId;
	
	@Column(name="CONSUMPTION_AMT")
	private long bill_Amt;
	
	@Column(name="BILL_NO")
	private String billNo;
	
	@Column(name="BILL_MONTH")
	private Date bill_Month;
	
	@Column(name="PREVIOUS_BAL")
	private double previousBal;
	
	@Column(name="CLOSING_BAL")
	private double closingBal;
	
	@Column(name="MAIL_STATUS")
	private String mailStatus;

	public int getPreBillId() {
		return preBillId;
	}

	public void setPreBillId(int preBillId) {
		this.preBillId = preBillId;
	}

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public long getBill_Amt() {
		return bill_Amt;
	}

	public void setBill_Amt(long bill_Amt) {
		this.bill_Amt = bill_Amt;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}


	public Date getBill_Month() {
		return bill_Month;
	}

	public void setBill_Month(Date bill_Month) {
		this.bill_Month = bill_Month;
	}

	public double getPreviousBal() {
		return previousBal;
	}

	public void setPreviousBal(double previousBal) {
		this.previousBal = previousBal;
	}

	public double getClosingBal() {
		return closingBal;
	}

	public void setClosingBal(double closingBal) {
		this.closingBal = closingBal;
	}

	public String getMailStatus() {
		return mailStatus;
	}

	public void setMailStatus(String mailStatus) {
		this.mailStatus = mailStatus;
	}
	
	
}
