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
@Table(name="LOWBALANCE_STATUS")
@NamedQueries({
	@NamedQuery(name="SmsEmailForLowBal.lowBal1",query="SELECT s From SmsEmailForLowBal s Where s.ca_num =:ca_num and s.rechargedStatus =:rechargedStatus"),
	@NamedQuery(name="SmsEmailForLowBal.lowBal2",query="SELECT s From SmsEmailForLowBal s Where s.ca_num =:ca_num and s.rechargedStatus =:rechargedStatus and s.status!='s1' and s.status ='s2'"),
	@NamedQuery(name="SmsEmailForLowBal.lowBal3",query="SELECT s From SmsEmailForLowBal s Where s.ca_num =:ca_num and s.rechargedStatus =:rechargedStatus and s.status NOT IN('s1','s2') and s.status ='s3'"),
	@NamedQuery(name="SmsEmailForLowBal.EstateManager",query="SELECT u.personId FROM Users u INNER JOIN u.designation dn where u.dnId=dn.dn_Id and dn.dn_Name='Estate Manager' and u.status='Active'"),
	
	
	@NamedQuery(name="SmsEmailForLowBal.lowBalhourly",query="SELECT s From SmsEmailForLowBal s Where s.ca_num =:ca_num and s.rechargeAmt =:RECHARGED_AMT_WEB"),
	@NamedQuery(name="SmsEmailForLowBal.lowBal2hourly",query="SELECT s From SmsEmailForLowBal s Where s.ca_num =:ca_num and s.rechargeAmt =:RECHARGED_AMT_WEB and s.status!='s1' and s.status ='s2'"),
	@NamedQuery(name="SmsEmailForLowBal.lowBal3hourly",query="SELECT s From SmsEmailForLowBal s Where s.ca_num =:ca_num and s.rechargeAmt =:RECHARGED_AMT_WEB and s.status NOT IN('s1','s2') and s.status ='s3'"),

	//@NamedQuery(name="SmsEmailForLowBal.lowBalanceStatusHourly",query="SELECT sl FROM SmsEmailForLowBal sl WHERE lId IN(SELECT MAX(s.lId) FROM SmsEmailForLowBal s GROUP BY s.ca_num)")
})
public class SmsEmailForLowBal {
	@Id
	@SequenceGenerator(name="LOWBALANCE_STATUS_SEQ", sequenceName="LOWBALANCE_STATUS_SEQ")
	@GeneratedValue(generator="LOWBALANCE_STATUS_SEQ")
	@Column(name="LID")
	private int lId;
	
	@Column(name="CA_NUMBER")
	private String ca_num;
	
	@Column(name="RECHARGED_STATUS")
	private int rechargedStatus;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="MAILSEND_DATE")
	private Date mailSendDate;
	
	@Column(name="RECHARGED_AMT")
	private String rechargeAmt;
	
	public String getRechargeAmt() {
		return rechargeAmt;
	}

	public void setRechargeAmt(String rechargeAmt) {
		this.rechargeAmt = rechargeAmt;
	}

	public int getlId() {
		return lId;
	}

	public void setlId(int lId) {
		this.lId = lId;
	}

	public String getCa_num() {
		return ca_num;
	}

	public void setCa_num(String ca_num) {
		this.ca_num = ca_num;
	}

	public int getRechargedStatus() {
		return rechargedStatus;
	}

	public void setRechargedStatus(int rechargedStatus) {
		this.rechargedStatus = rechargedStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getMailSendDate() {
		return mailSendDate;
	}

	public void setMailSendDate(Date mailSendDate) {
		this.mailSendDate = mailSendDate;
	}
	
	
	
	
}
