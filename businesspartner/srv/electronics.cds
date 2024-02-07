using { com.satinfotech.electonics as db} from '../db/schema';

service Electronics {
    entity BussinessPartner as projection on db.BussinessPartner;
   
    entity States as projection on db.States;
}

annotate Electronics.BussinessPartner with @odata.draft.enabled;
annotate Electronics.States with @odata.draft.enabled;
annotate Electronics.BussinessPartner with {
name @assert.format: '^[a-zA-Z]{2,}$';
pin_no  @assert.format: '^\d{6}$';
gstin @assert.format:'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$'; 
}
annotate Electronics.States with @(
    UI.LineItem: [
        
        {
            @Type: 'UI.DataField',
            Value: description
        },
    ]
);


annotate Electronics.BussinessPartner with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: bid
        },
        
        {
            $Type: 'UI.DataField',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: address1
        },
        {
            $Type: 'UI.DataField',
            Value: address2
        },
        {
            $Type: 'UI.DataField',
            Value: city 
        },
        {
            $Type: 'UI.DataField',
            Value: state
        },
        {
            $Type: 'UI.DataField',
            Value: pin_no
        },
        {
            $Type: 'UI.DataField',
            Value:is_gstn_registered  
        },
    
        {
              $Type: 'UI.DataField',
              Value:gstin 
        },
       
    {
        $Type: 'UI.DataField',
        Value:is_vendor
        
     },
     {
        $Type: 'UI.DataField',
        Value:is_customer 
        
    },
    
    ],
    UI.SelectionFields: [name,address1,address2,city,state],
    UI.FieldGroup #BussinessPartnerInformation: {
        $Type: 'UI.FieldGroupType',
        Data: [
             {
            $Type: 'UI.DataField',
            Value: bid
        },
        
        {
            $Type: 'UI.DataField',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: address1
        },
        {
            $Type: 'UI.DataField',
            Value: address2
        },
        {
            $Type: 'UI.DataField',
            Value: city 
        },
        {
            $Type: 'UI.DataField',
            Value: state
        },
        {
            $Type: 'UI.DataField',
            Value: pin_no
        },
      {
        $Type: 'UI.DataField',
        Value:is_gstn_registered  
      
    },
    
        {
        $Type: 'UI.DataField',
        Value:gstin 
        
    },
       
     {
        $Type: 'UI.DataField',
        Value:is_vendor
       
    },
     {
        $Type: 'UI.DataField',
        Value:is_customer 
       
    },
    
        ],
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'BussinessPartnerInfoFacet',
            Label: 'BussinessPartner Information',
            Target: '@UI.FieldGroup#BussinessPartnerInformation',
        },
        
    ],
);


annotate Electronics.States with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList: {
            Label: 'States',
            CollectionPath: 'State',
            Parameters: [
                
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'StatesList'
                }
            ]
        }
    );
    
};