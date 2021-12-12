using CoffeeService from './coffee-service';

annotate CoffeeService.Coffees with {
	title       @title: 'Title';
	bean        @title: 'Bean-Description';
	descr       @title: 'Taste-Description';
	coftype     @title: 'Type of Coffee';
	temperature @title: 'Temperature to brew';
}

annotate CoffeeService.Beans with {
	ID @(
		UI.Hidden,
		Common: {
		Text: description
		}
	);
	description  @title: 'Description';
	height       @title: 'Height of growing location';
	roast	     @title: 'Roast-type';
	coffees      @title: 'Contained in';
}

annotate CoffeeService.Coffees with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Coffee',
			TypeNamePlural: 'Coffees',
			Title          : {
                $Type : 'UI.DataField',
                Value : name
            },
			Description : {
				$Type: 'UI.DataField',
				Value: descr
			},

		},
		SelectionFields: [],
		LineItem: [
			{Value: name},
			{Value: bean_ID},
			{Value: descr},
			{Value: coftype},
			{Value: temperature}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
		],
		FieldGroup#Main: {
			Data: [
				{Value: name},
				{Value: bean_ID},
				{Value: descr},
				{Value: coftype},
				{Value: temperature}
				
			]
		}
	},
) {

};

annotate CoffeeService.Coffees with {
	bean @(
		Common: {
			//show text, not id for mitigation in the context of risks
			Text: bean.description  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Beans',
				CollectionPath: 'Beans',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: bean_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'description'
					},
				]
			}
		}
	);
}
