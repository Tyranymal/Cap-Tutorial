namespace coffee.db;
using { managed } from '@sap/cds/common';


  entity Coffees: managed {
    key ID      : UUID  @(Core.Computed : true);
    name        : String @title:'Productname';
    bean        : Association to Beans;
    descr       : String;
    coftype     : String @assert.range enum {Espresso; Normal};
    temperature : Integer @assert.range: [90,100];
  }

  entity Beans  : managed {
    key ID      : UUID  @(Core.Computed : true);
    height      : Integer;
    location    : String;
    roast       : String enum {single; double};
    description : String;
    coffees     : Association to many Coffees on coffees.bean = $self;
    beantype    : String enum {robusta; arabica}
  }
