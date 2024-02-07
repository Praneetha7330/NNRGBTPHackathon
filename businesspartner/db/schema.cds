namespace com.satinfotech.electonics;
using {managed, cuid } from '@sap/cds/common';
@assert.unique:{
  bid:[bid]
}
entity BussinessPartner :cuid,managed{
  
    @title:'Bussiness Partner Number'
     bid: String(10);
     @title:'Name'
    name:String(10) @mandatory;
     @title:'Address1'
    address1:String(40) @mandatory;
     @title:'Address2'
    address2:String(40) @mandatory;
    @title:'City'
      city:String(20) @mandatory;
    @title:'State'
    state:String(20) @mandatory;
      @title:'PINCode'
      pin_no: String(20) @mandatory;
      @title:'Is_gstn_registered'
      is_gstn_registered:Boolean;
      @title:'GSTIN Number'
    gstin: String(15) @mandatory;
    
    @title:'Is Vendor'
    is_vendor: Boolean;
    
    @title:'Is Customer'
    is_customer: Boolean;
}
entity States {
    @title: 'code'
    key code: String(1);
    @title: 'Description'
    StatesList: String(100);
}