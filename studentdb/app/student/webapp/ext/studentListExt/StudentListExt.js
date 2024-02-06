sap.ui.define(["sap/m/MessageToast"], function (MessageToast) {
    "use strict";
  
    return {
      SetAlumni: function (oBindingContext, aSelectedContexts) {
        aSelectedContexts.forEach((element) => {
          MessageToast.show(element.sPath);
          var oData = jQuery
            .ajax({
              type: "PATCH",
              contentType: "application/json",
              url: "/odata/v4/studentdb" + element.sPath,
              data: JSON.stringify({ is_alumini: true }),
            })
            .then(element.requestRefresh());
        });
      },
      SetStudent: function (oBindingContext, aSelectedContext) {
        aSelectedContext.forEach((element) => {
          MessageToast.show(element.sPath);
          var oData = jQuery
            .ajax({
              type: "PATCH",
              contentType: "application/json",
              url: "/odata/v4/studentdb" + element.sPath,
              data: JSON.stringify({ is_alumini: false }),
            })
            .then(element.requestRefresh());
        });
      },
  
      SetIsAlumni: function(oEvent) {
          MessageToast.show("Custom handler invoked.");
          }
    };
  });