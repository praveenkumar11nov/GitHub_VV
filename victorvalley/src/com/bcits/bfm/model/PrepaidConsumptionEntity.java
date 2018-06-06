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
@Table(name="PREPAID_DAILY_CONSUMPTION")
@NamedQueries({
	@NamedQuery(name="PrepaidConsumptionEntity.getConsumptionHtry",query="SELECT p FROM PrepaidConsumptionEntity p WHERE p.meterNo=:meterNo  and TRUNC(p.date) BETWEEN to_date(:fromDate,'yyyy-MM-dd') AND to_date(:toDate,'yyyy-MM-dd') ORDER BY p.consupId"),
	@NamedQuery(name="PrepaidConsumptionEntity.getDataDayWise",query="SELECT p FROM PrepaidConsumptionEntity p WHERE TRUNC(p.date) BETWEEN to_date(:fromDate,'yyyy-MM-dd') AND to_date(:toDate,'yyyy-MM-dd') ORDER BY  p.date DESC"),
	@NamedQuery(name="PrepaidConsumptionEntity.exportPDF",query="SELECT p.consupId,p.ca_NO,p.meterNo,p.date,p.ebUnit,p.dgUnit,p.eB_AMT,p.dg_AMT,p.fixedCharges,p.recharge_Amt,p.balance,p.cum_eb_reading,p.cum_dg_reading  FROM PrepaidConsumptionEntity p where p.meterNo=:meterNo and EXTRACT(month FROM p.date)=:month and EXTRACT(year FROM p.date)=:year ORDER BY p.consupId"),
	@NamedQuery(name="PrepaidConsumptionEntity.getMaxDate",query="SELECT MAX(pc.date) FROM PrepaidConsumptionEntity pc"),
	@NamedQuery(name="PrepaidConsumptionEntity.getCount",query="SELECT COUNT(p) FROM PrepaidConsumptionEntity p where p.ca_NO=:caNO and TRUNC(p.date)=TO_DATE(:fromDate,'yyyy-MM-dd')"),
	@NamedQuery(name="PrepaidConsumptionEntity.getConsumptionData",query="SELECT p.ca_NO,p.meterNo,p.date,p.ebUnit,p.dgUnit FROM PrepaidConsumptionEntity p WHERE p.meterNo=:meterNo and p.date BETWEEN :fromDate AND :toDate ORDER BY p.date"),
	@NamedQuery(name="PrepaidConsumptionEntity.getBalance",query="SELECT p.balance FROM PrepaidConsumptionEntity p where p.meterNo=:mtrSrNo and TRUNC(p.date)=:fromDate"),
	@NamedQuery(name="PrepaidConsumptionEntity.getRechrgeAmtDuringPer",query="SELECT SUM(pp.recharge_Amt) FROM PrepaidConsumptionEntity pp where pp.meterNo=:meterNo and EXTRACT(month FROM pp.date)=:month  and EXTRACT(year FROM pp.date)=:year "),
	@NamedQuery(name="PrepaidConsumptionEntity.getCurrentBalance",query="SELECT p.balance,p.ebUnit,p.dgUnit FROM PrepaidConsumptionEntity p where p.meterNo=:mtrSrNo and TRUNC(p.date)=:fromDate"),
	@NamedQuery(name="PrepaidConsumptionEntity.getPreviousBal",query="SELECT pc.balance,pc.noofTimeRech FROM PrepaidConsumptionEntity pc where pc.consupId IN (SELECT MAX(pc.consupId) FROM PrepaidConsumptionEntity pc where pc.ca_NO =:ca_NO)"),
	@NamedQuery(name="PrepaidConsumptionEntity.getDataForLowBal",query="SELECT DISTINCT pc.ca_NO,pc.meterNo,pc.balance,pc.noofTimeRech,pm.personId,pm.propertyId FROM PrepaidConsumptionEntity pc ,PrePaidMeters pm Where pc.ca_NO=pm.ca_no AND pc.meterNo=pm.meterNumber AND pc.consupId IN (SELECT MAX(pc.consupId) FROM PrepaidConsumptionEntity pc ,PrePaidMeters pm Where pc.ca_NO=pm.ca_no AND pc.meterNo=pm.meterNumber GROUP BY pc.meterNo) AND pc.balance<=1000")
})
public class PrepaidConsumptionEntity {
	@Id
	@SequenceGenerator(name="PREPAID_DAILY_CONSUMPTION_SEQ",sequenceName="PREPAID_DAILY_CONSUMPTION_SEQ")
	@GeneratedValue(generator="PREPAID_DAILY_CONSUMPTION_SEQ")

	@Column(name="CONSUMID")
	private long consupId;

	@Column(name="CA_NUMBER")
	private String ca_NO;

	@Column(name="METER_NUMBER")
	private String meterNo;

	@Column(name="READING_DATE")
	private Date date;

	@Column(name="EB_UNITS")
	private double ebUnit;

	@Column(name="DG_UNITS")
	private double dgUnit;

	@Column(name="EB_AMOUNT")
	private double eB_AMT;

	@Column(name="DG_AMOUNT")
	private double dg_AMT;

	@Column(name="FIXED_CHARGES")
	private double fixedCharges;

	@Column(name="RECHARGE_AMOUNT")
	private long recharge_Amt;

	@Column(name="BALANCE")
	private double balance;

	@Column(name="NOOF_TIMES_RECHARGED")
	private int noofTimeRech;

	@Column(name="EB_PV_READING")
	private double cum_eb_reading;

	@Column(name="DG_PV_READING")
	private double cum_dg_reading;


	public double getCum_eb_reading() {
		return cum_eb_reading;
	}
	public void setCum_eb_reading(double cum_eb_reading) {
		this.cum_eb_reading = cum_eb_reading;
	}
	public double getCum_dg_reading() {
		return cum_dg_reading;
	}
	public void setCum_dg_reading(double cum_dg_reading) {
		this.cum_dg_reading = cum_dg_reading;
	}
	public long getConsupId() {
		return consupId;
	}
	public void setConsupId(long consupId) {
		this.consupId = consupId;
	}
	public String getCa_NO() {
		return ca_NO;
	}
	public void setCa_NO(String ca_NO) {
		this.ca_NO = ca_NO;
	}
	public String getMeterNo() {
		return meterNo;
	}
	public void setMeterNo(String meterNo) {
		this.meterNo = meterNo;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getEbUnit() {
		return ebUnit;
	}
	public void setEbUnit(double ebUnit) {
		this.ebUnit = ebUnit;
	}
	public double getDgUnit() {
		return dgUnit;
	}
	public void setDgUnit(double dgUnit) {
		this.dgUnit = dgUnit;
	}
	public double geteB_AMT() {
		return eB_AMT;
	}
	public void seteB_AMT(double eB_AMT) {
		this.eB_AMT = eB_AMT;
	}
	public double getDg_AMT() {
		return dg_AMT;
	}
	public void setDg_AMT(double dg_AMT) {
		this.dg_AMT = dg_AMT;
	}
	public double getFixedCharges() {
		return fixedCharges;
	}
	public void setFixedCharges(double fixedCharges) {
		this.fixedCharges = fixedCharges;
	}
	public long getRecharge_Amt() {
		return recharge_Amt;
	}
	public void setRecharge_Amt(long recharge_Amt) {
		this.recharge_Amt = recharge_Amt;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "PrepaidConsumptionEntity [consupId=" + consupId + ", ca_NO=" + ca_NO + ", meterNo=" + meterNo + ", date="
				+ date + ", ebUnit=" + ebUnit + ", dgUnit=" + dgUnit + ", eB_AMT=" + eB_AMT + ", dg_AMT=" + dg_AMT
				+ ", fixedCharges=" + fixedCharges + ", recharge_Amt=" + recharge_Amt + ", balance=" + balance + "]";
	}
	public int getNoofTimeRech() {
		return noofTimeRech;
	}
	public void setNoofTimeRech(int noofTimeRech) {
		this.noofTimeRech = noofTimeRech;
	}




}
