const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { BussinessPartner,States} = this.entities();
    this.on('READ',States,async(req)=> {
        states=[

            {"code":"T",StatesList:"Telangana"},
            {"code":"A",StatesList:"Andhra Pradesh"},
            {"code":"M",StatesList:"Mumbai"},
        ]
        states.$count=states.length;
        return states;
    })
    
});