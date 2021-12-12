using { coffee.db as cof } from '../db/schema';

@path: 'service/coffee'
service CoffeeService {
    
  @cds.search : {name}
   entity Coffees @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'Viewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'Developer' ]
            }
        ]) as projection on cof.Coffees;
    annotate Coffees with @odata.draft.enabled;
  entity Beans @(restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'Viewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'Developer' ]
            }
        ]) as projection on cof.Beans;
    annotate Beans with @odata.draft.enabled;
}