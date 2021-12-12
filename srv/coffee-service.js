
const cds = require('@sap/cds')

/**
 * Implementation for Risk Management service defined in ./risk-service.cds
 */
module.exports = cds.service.impl(async function() {
    this.after('READ', 'Coffees', Data => {
        const coffees = Array.isArray(Data) ? Data : [Data];
        coffees.forEach(coffee => {
            if (coffee.bean == "double") {
                coffee.type = "Espresso";
            } else {
                coffee.type = "Normal";
            }
        });
    });
});