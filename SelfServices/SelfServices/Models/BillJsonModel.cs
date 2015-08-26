using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SelfServices.Utilities;

namespace SelfServices.Models
{

    public class Bill
    {
        public Name Name { get; set; }
        public PrimaryPhone PrimaryPhone { get; set; }
        public Address Address { get; set; }
        public Accountnumber AccountNumber { get; set; }
        public Billdate BillDate { get; set; }
        public Account_Summary Account_Summary { get; set; }
        public Total_Due_By_Date Total_Due_by_Date { get; set; }
        public Details_Of_Current_Charges Details_of_Current_Charges { get; set; }
        public Total_Due Total_Due { get; set; }

        public static Bill GetUserBill(string customerId)
        {
            return ServiceJsonHelper.GetBill(customerId);
        }
    }

    public class Name
    {
        public string value { get; set; }
    }

    public class PrimaryPhone
    {
        public string value { get; set; }
    }

    public class Address
    {
        public string value { get; set; }
    }

    public class Accountnumber
    {
        public string value { get; set; }
    }

    public class Billdate
    {
        public string value { get; set; }
    }

    public class Account_Summary
    {
        public Previous_Period Previous_Period { get; set; }
        public Current_Charges Current_Charges { get; set; }
    }

    public class Previous_Period
    {
        public Previousbalance PreviousBalance { get; set; }
        public Paymentreceived PaymentReceived { get; set; }
        public Balanceforward BalanceForward { get; set; }
        public Paymentdate PaymentDate { get; set; }
    }

    public class Previousbalance
    {
        public string value { get; set; }
    }

    public class Paymentreceived
    {
        public string value { get; set; }
    }

    public class Balanceforward
    {
        public string value { get; set; }
    }

    public class Paymentdate
    {
        public string value { get; set; }
    }

    public class Current_Charges
    {
        public FIOSTV_Internet_And_Phone_Bundle FIOSTV_Internet_and_Phone_Bundle { get; set; }
        public Additional_Services_And_Equipment Additional_Services_and_Equipment { get; set; }
        public Fees_And_Other_Charges Fees_and_Other_Charges { get; set; }
    }

    public class FIOSTV_Internet_And_Phone_Bundle
    {
        public Price Price { get; set; }
        public Servicefrom Servicefrom { get; set; }
        public Serviceto Serviceto { get; set; }
    }

    public class Price
    {
        public string value { get; set; }
    }

    public class Servicefrom
    {
        public string value { get; set; }
    }

    public class Serviceto
    {
        public string value { get; set; }
    }

    public class Additional_Services_And_Equipment
    {
        public string value { get; set; }
    }

    public class Fees_And_Other_Charges
    {
        public string value { get; set; }
    }

    public class Total_Due_By_Date
    {
        public string value { get; set; }
    }

    public class Details_Of_Current_Charges
    {
        public Fios_TV_Internet_And_Phone_Bundle Fios_TV_Internet_and_Phone_Bundle { get; set; }
        public Additional_Services_And_Equipment1 Additional_Services_and_Equipment { get; set; }
        public Fees_And_Other_Charges1 Fees_and_other_charges { get; set; }
    }

    public class Fios_TV_Internet_And_Phone_Bundle
    {
        public Bundle_Price Bundle_Price { get; set; }
    }

    public class Bundle_Price
    {
        public Price1 Price { get; set; }
        public Service_From Service_from { get; set; }
        public Service_To Service_to { get; set; }
    }

    public class Price1
    {
        public string value { get; set; }
    }

    public class Service_From
    {
        public string value { get; set; }
    }

    public class Service_To
    {
        public string value { get; set; }
    }

    public class Additional_Services_And_Equipment1
    {
        public Services Services { get; set; }
        public Equipment Equipment { get; set; }
        public Subtotal Subtotal { get; set; }
    }

    public class Services
    {
        public Online_Backup_And_Sharing Online_Backup_and_Sharing { get; set; }
    }

    public class Online_Backup_And_Sharing
    {
        public Price2 Price { get; set; }
        public Service_From1 Service_from { get; set; }
        public Service_To1 Service_to { get; set; }
    }

    public class Price2
    {
        public string value { get; set; }
    }

    public class Service_From1
    {
        public string value { get; set; }
    }

    public class Service_To1
    {
        public string value { get; set; }
    }

    public class Equipment
    {
        public Set_Top_Box Set_Top_Box { get; set; }
        public HD_Multiroom_DVR HD_MultiRoom_DVR { get; set; }
    }

    public class Set_Top_Box
    {
        public Price3 Price { get; set; }
        public Service_From2 Service_from { get; set; }
        public Service_To2 Service_to { get; set; }
    }

    public class Price3
    {
        public string value { get; set; }
    }

    public class Service_From2
    {
        public string value { get; set; }
    }

    public class Service_To2
    {
        public string value { get; set; }
    }

    public class HD_Multiroom_DVR
    {
        public Price4 Price { get; set; }
        public Service_From3 Service_from { get; set; }
        public Service_To3 Service_to { get; set; }
    }

    public class Price4
    {
        public string value { get; set; }
    }

    public class Service_From3
    {
        public string value { get; set; }
    }

    public class Service_To3
    {
        public string value { get; set; }
    }

    public class Subtotal
    {
        public string value { get; set; }
    }

    public class Fees_And_Other_Charges1
    {
        public Taxes_And_Governmental_Fees_And_Surcharges Taxes_and_Governmental_fees_and_Surcharges { get; set; }
        public Verizon_Surcharges_And_Fees Verizon_surcharges_and_fees { get; set; }
        public Subtotal1 Subtotal { get; set; }
    }

    public class Taxes_And_Governmental_Fees_And_Surcharges
    {
        public Federal_ExciseTax Federal_exciseTax { get; set; }
        public State_Sales_Tax State_sales_tax { get; set; }
        public _911_System_Emerg_Resp_Fee _911_system_emerg_resp_fee { get; set; }
    }

    public class Federal_ExciseTax
    {
        public string value { get; set; }
    }

    public class State_Sales_Tax
    {
        public string value { get; set; }
    }

    public class _911_System_Emerg_Resp_Fee
    {
        public string value { get; set; }
    }

    public class Verizon_Surcharges_And_Fees
    {
        public Federal_Universal_Service Federal_Universal_Service { get; set; }
        public Regularity_Recovery_Fee Regularity_recovery_fee { get; set; }
        public VLD_CCRC VLD_CCRC { get; set; }
        public Federal_Subscriber_Line_And_Access Federal_Subscriber_line_and_access { get; set; }
        public Video_Franchise_Fee Video_Franchise_fee { get; set; }
        public VLD_Long_Distance_Administrative_Charge VLD_long_distance_Administrative_charge { get; set; }
        public CATV_Universal_Access_Fund CATV_Universal_access_fund { get; set; }
        public Regional_Sports_Network_Fee Regional_Sports_Network_fee { get; set; }
        public FIOS_TV_Broadcast_Fee FIOS_TV_Broadcast_fee { get; set; }
    }

    public class Federal_Universal_Service
    {
        public string value { get; set; }
    }

    public class Regularity_Recovery_Fee
    {
        public string value { get; set; }
    }

    public class VLD_CCRC
    {
        public string value { get; set; }
    }

    public class Federal_Subscriber_Line_And_Access
    {
        public string value { get; set; }
    }

    public class Video_Franchise_Fee
    {
        public string value { get; set; }
    }

    public class VLD_Long_Distance_Administrative_Charge
    {
        public string value { get; set; }
    }

    public class CATV_Universal_Access_Fund
    {
        public string value { get; set; }
    }

    public class Regional_Sports_Network_Fee
    {
        public string value { get; set; }
    }

    public class FIOS_TV_Broadcast_Fee
    {
        public string value { get; set; }
    }

    public class Subtotal1
    {
        public string value { get; set; }
    }

    public class Total_Due
    {
        public string value { get; set; }
    }


}