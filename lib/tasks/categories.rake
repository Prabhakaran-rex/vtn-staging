namespace :purex do
	desc "Seed categories"
	task :categories => :environment do
		Category.delete_all
		inserts = Array.new
		inserts << {:parent=>"20TH CENTURY",:child=>""}
		inserts << {:parent=>"3-D PHOTOGRAPHICA",:child=>"Tru-Vue"}
		inserts << {:parent=>"3-D PHOTOGRAPHICA",:child=>"View-Masters"}
		inserts << {:parent=>"3-D PHOTOGRAPHICA",:child=>""}
		inserts << {:parent=>"4-H",:child=>""}
		inserts << {:parent=>"ACCOUNT BOOKS",:child=>""}
		inserts << {:parent=>"ADDING MACHINES",:child=>""}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"A & P Items"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Absinthe"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Absolut Vodka"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Alka Seltzer"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Ammunition"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Aunt Jemima"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Baranger Motion Displays"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Beech-Nut"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Biblical"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Billboard Signs"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Black & White Scotch"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Buster Brown"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Candy"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Counter Jars"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Dunkin' Donuts"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Figures"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Figures (Charlie Tuna)"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Figures (Reddy Kilowatt)"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Firearms Related"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Gerber Baby"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Hormel"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Monarch Food Products"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Old Spice"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Phillip Morris"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Piano Related"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Pillsbury"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Potato Chips"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Potteries Related"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Signs"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Signs (Inn)"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Sunshine Biscuit"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Telephone & Telegraph"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Tin Vienna Art Plates"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Tins"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Trade Cards"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Trade Cards (Tobacco)"}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>"Woolson Spice Co."}
		inserts << {:parent=>"ADVERTISING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"AFRICAN & TRIBAL ART",:child=>"Masks"}
		inserts << {:parent=>"AFRICAN & TRIBAL ART",:child=>""}
		inserts << {:parent=>"AIRGUNS",:child=>""}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Air Sickness Bags"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Baggage I.D. Labels"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Models"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Models (Desk)"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Pan Am"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Pilots Wings"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Playing Cards"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>"Timetables"}
		inserts << {:parent=>"AIRLINE MEMORABILIA",:child=>""}
		inserts << {:parent=>"AIRPLANES",:child=>"Ford Tri-Motors"}
		inserts << {:parent=>"AIRPLANES",:child=>"Model"}
		inserts << {:parent=>"AIRPLANES",:child=>"Racing"}
		inserts << {:parent=>"AIRPLANES",:child=>"Sailplanes"}
		inserts << {:parent=>"AIRPLANES",:child=>""}
		inserts << {:parent=>"AIRSHIPS",:child=>"Balloons"}
		inserts << {:parent=>"AIRSHIPS",:child=>"Dirigibles, Zeppelins, Blimps"}
		inserts << {:parent=>"ALARM BOXES",:child=>""}
		inserts << {:parent=>"ALBUMS",:child=>"Autograph"}
		inserts << {:parent=>"ALCOHOLICS ANONYMOUS ITEMS",:child=>""}
		inserts << {:parent=>"ALUMINUM",:child=>"Hammered"}
		inserts << {:parent=>"AMMUNITION & EXPLOSIVE ORDNANCE",:child=>"Badges"}
		inserts << {:parent=>"AMMUNITION & EXPLOSIVE ORDNANCE",:child=>"Shell Casings"}
		inserts << {:parent=>"AMMUNITION & EXPLOSIVE ORDNANCE",:child=>""}
		inserts << {:parent=>"AMUSEMENT PARK ITEMS",:child=>""}
		inserts << {:parent=>"ANGELS",:child=>""}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Cats"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Cats (Goebel Figurines)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Cats (Kliban)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Deer"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Dogs"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Dogs (Collies)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Dogs (German Shepherds)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Dogs (Poodles)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Dogs (Scotties)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Elephants"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Flamingos"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Horse Related"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Horse Related (Draft)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Horse Related (Horse Brasses)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Horse Related (Models )"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Horse Related (Models by Breyer)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Horse Related (Models by Stone)"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Monkeys"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Mules"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Penguins"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Phallus"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Pigs"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Plastic Models"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Rabbits"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>"Reptiles"}
		inserts << {:parent=>"ANIMAL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ANIMAL CONTROL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ANIMAL TROPHIES",:child=>""}
		inserts << {:parent=>"ANIMATION FILM ART",:child=>""}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>"Canadian"}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>"German"}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>"Irish"}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>"Mexican"}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>"Reproductions"}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>"Switzerland"}
		inserts << {:parent=>"ANTIQUES & COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>"Computer Software Vendors"}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>"Insurance"}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>"Services For"}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>"Supplies For"}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>"Supplies For (Safes)"}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>"Supplies For (Showcases)"}
		inserts << {:parent=>"ANTIQUES DEALERS & COLLECTORS",:child=>""}
		inserts << {:parent=>"ANTIQUITIES",:child=>"Egyptian"}
		inserts << {:parent=>"ANTIQUITIES",:child=>"Greek & Roman"}
		inserts << {:parent=>"ANTIQUITIES",:child=>"Medieval"}
		inserts << {:parent=>"ANTIQUITIES",:child=>"Middle Eastern"}
		inserts << {:parent=>"ANTIQUITIES",:child=>""}
		inserts << {:parent=>"APPLE PARERS",:child=>""}
		inserts << {:parent=>"APPRAISERS",:child=>"Online"}
		inserts << {:parent=>"APPRAISERS",:child=>""}
		inserts << {:parent=>"AQUARIUMS",:child=>"Ornaments"}
		inserts << {:parent=>"AQUARIUMS",:child=>""}
		inserts << {:parent=>"ARCHAEOLOGY",:child=>""}
		inserts << {:parent=>"ARCHITECTURAL ELEMENTS",:child=>"Victorian Gingerbread"}
		inserts << {:parent=>"ARCHITECTURAL ELEMENTS",:child=>"Wallpaper"}
		inserts << {:parent=>"ARCHITECTURAL ELEMENTS",:child=>""}
		inserts << {:parent=>"ARCTIC EXPLORERS",:child=>""}
		inserts << {:parent=>"ARMS & ARMOR",:child=>"Japanese"}
		inserts << {:parent=>"ARMS & ARMOR",:child=>"Japanese (Swords)"}
		inserts << {:parent=>"ARMS & ARMOR",:child=>"Medieval"}
		inserts << {:parent=>"ARMS & ARMOR",:child=>"Miniature"}
		inserts << {:parent=>"ARMS & ARMOR",:child=>""}
		inserts << {:parent=>"ART",:child=>"Alabama"}
		inserts << {:parent=>"ART",:child=>"Andy Warhol"}
		inserts << {:parent=>"ART",:child=>"Arizona"}
		inserts << {:parent=>"ART",:child=>"Asian"}
		inserts << {:parent=>"ART",:child=>"Australia"}
		inserts << {:parent=>"ART",:child=>"Automotive"}
		inserts << {:parent=>"ART",:child=>"Bad"}
		inserts << {:parent=>"ART",:child=>"Botanical"}
		inserts << {:parent=>"ART",:child=>"British"}
		inserts << {:parent=>"ART",:child=>"Byzantine"}
		inserts << {:parent=>"ART",:child=>"Canadian"}
		inserts << {:parent=>"ART",:child=>"Canvas Marks"}
		inserts << {:parent=>"ART",:child=>"Commercial Advertising"}
		inserts << {:parent=>"ART",:child=>"Contemporary"}
		inserts << {:parent=>"ART",:child=>"Fiber"}
		inserts << {:parent=>"ART",:child=>"Georgia O'Keeffe"}
		inserts << {:parent=>"ART",:child=>"German"}
		inserts << {:parent=>"ART",:child=>"Grandma Moses"}
		inserts << {:parent=>"ART",:child=>"Haitian"}
		inserts << {:parent=>"ART",:child=>"India"}
		inserts << {:parent=>"ART",:child=>"Irish"}
		inserts << {:parent=>"ART",:child=>"Islamic"}
		inserts << {:parent=>"ART",:child=>"Israel"}
		inserts << {:parent=>"ART",:child=>"Italian Renaissance"}
		inserts << {:parent=>"ART",:child=>"Jasper F. Cropsey"}
		inserts << {:parent=>"ART",:child=>"Jewish"}
		inserts << {:parent=>"ART",:child=>"Jo Mora"}
		inserts << {:parent=>"ART",:child=>"Latin American"}
		inserts << {:parent=>"ART",:child=>"Marine"}
		inserts << {:parent=>"ART",:child=>"New Mexico"}
		inserts << {:parent=>"ART",:child=>"New Zealand"}
		inserts << {:parent=>"ART",:child=>"Oceanic"}
		inserts << {:parent=>"ART",:child=>"Oriental"}
		inserts << {:parent=>"ART",:child=>"Outsider"}
		inserts << {:parent=>"ART",:child=>"Paint-By-Numbers"}
		inserts << {:parent=>"ART",:child=>"Polynesia"}
		inserts << {:parent=>"ART",:child=>"Prison Related"}
		inserts << {:parent=>"ART",:child=>"Pulp"}
		inserts << {:parent=>"ART",:child=>"Remington"}
		inserts << {:parent=>"ART",:child=>"Rodin"}
		inserts << {:parent=>"ART",:child=>"Russell"}
		inserts << {:parent=>"ART",:child=>"Scottish"}
		inserts << {:parent=>"ART",:child=>"South Africa"}
		inserts << {:parent=>"ART",:child=>"South America"}
		inserts << {:parent=>"ART",:child=>"Southern"}
		inserts << {:parent=>"ART",:child=>"Spanish"}
		inserts << {:parent=>"ART",:child=>"Sporting"}
		inserts << {:parent=>"ART",:child=>"Sports"}
		inserts << {:parent=>"ART",:child=>"Supplies For"}
		inserts << {:parent=>"ART",:child=>"Western"}
		inserts << {:parent=>"ART",:child=>"Wildlife"}
		inserts << {:parent=>"ART",:child=>"William Aiken Walker"}
		inserts << {:parent=>"ART",:child=>""}
		inserts << {:parent=>"ART DECO",:child=>"Chase Brass & Copper Co."}
		inserts << {:parent=>"ART DECO",:child=>"Lamps & Lighting"}
		inserts << {:parent=>"ART DECO",:child=>"Neon"}
		inserts << {:parent=>"ART DECO",:child=>""}
		inserts << {:parent=>"ART NOUVEAU",:child=>""}
		inserts << {:parent=>"ART THEFT & FRAUD",:child=>""}
		inserts << {:parent=>"ARTS & CRAFTS",:child=>"Furniture"}
		inserts << {:parent=>"ARTS & CRAFTS",:child=>"Roycroft"}
		inserts << {:parent=>"ARTS & CRAFTS",:child=>"Van Erp-Style Lamps"}
		inserts << {:parent=>"ARTS & CRAFTS",:child=>"William Morris"}
		inserts << {:parent=>"ARTS & CRAFTS",:child=>""}
		inserts << {:parent=>"ASHTRAYS",:child=>"Casino"}
		inserts << {:parent=>"ASHTRAYS",:child=>"Tire"}
		inserts << {:parent=>"ASHTRAYS",:child=>""}
		inserts << {:parent=>"ASTRONOMICAL ITEMS",:child=>"Comets"}
		inserts << {:parent=>"ASTRONOMICAL ITEMS",:child=>"Telescopes"}
		inserts << {:parent=>"ATLASES",:child=>""}
		inserts << {:parent=>"AUCTION CATALOGS",:child=>""}
		inserts << {:parent=>"AUCTION SERVICES",:child=>"Government Contract"}
		inserts << {:parent=>"AUCTION SERVICES",:child=>""}
		inserts << {:parent=>"AUDIO-VISUAL",:child=>""}
		inserts << {:parent=>"AUTO RACING MEMORABILIA",:child=>"Drag"}
		inserts << {:parent=>"AUTO RACING MEMORABILIA",:child=>"Indy 500"}
		inserts << {:parent=>"AUTO RACING MEMORABILIA",:child=>"NASCAR"}
		inserts << {:parent=>"AUTO RACING MEMORABILIA",:child=>""}
		inserts << {:parent=>"AUTOGRAPHS",:child=>"Celebrity"}
		inserts << {:parent=>"AUTOGRAPHS",:child=>"Jewish"}
		inserts << {:parent=>"AUTOGRAPHS",:child=>"Music Related"}
		inserts << {:parent=>"AUTOGRAPHS",:child=>"Walt Disney"}
		inserts << {:parent=>"AUTOGRAPHS",:child=>""}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Alfa Romeo"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"AMC"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"AMC Rambler"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Aston Martin"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Auburn-Cord-Duesenberg"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Austin-Healey"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Avanti"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Bentley"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"BMW"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"British"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Bugatti"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Buick"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Cadillac"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Checker"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet Camaro"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet Chevelle"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet Corvette"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet El Camino"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet Impala"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet Monte Carlo"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chevrolet Nova"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Chrysler"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Citroen"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Crosley"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Customized"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Datsun Roadster"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Datsun/Nissan Z Cars"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"DeLorean"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"DeSoto"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"DeTomaso"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"DeTomaso Pantera"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Dodge"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Durant"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Edsel"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Electric"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Emergency"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ferrari"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Fiat"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Fairlane"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Falcon"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Galaxie"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Model A"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Model T"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Mustang"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Ford Thunderbird"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Franklin"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Hudson"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Hupmobile"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Jaguar"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Jeep"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Lamborghini"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Land Rover"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Lincoln"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Locomobile"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Lotus"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Marmon"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Maserati"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Mazda"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Mercedes-Benz"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Mercury"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Mercury Cougar"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"MG"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"MG A Series"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"MG B Series"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Micro & Mini"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Mini"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Nash"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Oakland"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Oldsmobile"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Opel"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Packard"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Peerless"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Pierce-Arrow"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Plymouth"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Plymouth Barracuda"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Police & Sheriff"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Pontiac"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Pontiac Firebird"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Pontiac GTO"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Porsche"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Preservation"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Professional"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Racing"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Renault"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"REO"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Rolls-Royce"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"SAAB"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Shelby"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Station Wagons"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Steam"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Studebaker"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Stutz"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Subaru"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Triumph"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Tucker"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Volkswagen"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Volvo"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Willys"}
		inserts << {:parent=>"AUTOMOBILES",:child=>"Woodies"}
		inserts << {:parent=>"AUTOMOBILES",:child=>""}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Buick Related"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Canadian Tire Company"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Car Club Badges (Grille)"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Car Jacks"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Flower Vases"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Ford Motor Company"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Hood Ornaments"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Hubcaps"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Instruments"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Literature"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Model A Advertising"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Spark Plugs"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Studebaker Related"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>"Stunt/Thrill Show Related"}
		inserts << {:parent=>"AUTOMOBILIA",:child=>""}
		inserts << {:parent=>"AVIATION",:child=>"Art"}
		inserts << {:parent=>"AVIATION",:child=>"Military"}
		inserts << {:parent=>"AVIATION",:child=>"Races & Meets"}
		inserts << {:parent=>"AVIATION",:child=>""}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Boeing 747"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Civil Air Patrol"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Helicopters"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Military"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Military (Nose Art)"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Military Insignia"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>"Models"}
		inserts << {:parent=>"AVIATION MEMORABILIA",:child=>""}
		inserts << {:parent=>"AVON COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BADGES",:child=>"Chauffeurs"}
		inserts << {:parent=>"BADGES",:child=>"Employee"}
		inserts << {:parent=>"BADGES",:child=>"Federal"}
		inserts << {:parent=>"BADGES",:child=>""}
		inserts << {:parent=>"BANANA COLLECTIBLES",:child=>"Stickers"}
		inserts << {:parent=>"BANANA COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BANKING",:child=>"Bank Checks"}
		inserts << {:parent=>"BANKING",:child=>""}
		inserts << {:parent=>"BANKS",:child=>"Glass"}
		inserts << {:parent=>"BANKS",:child=>"Mechanical"}
		inserts << {:parent=>"BANKS",:child=>"Oil Can (Miniature)"}
		inserts << {:parent=>"BANKS",:child=>"Registering"}
		inserts << {:parent=>"BANKS",:child=>"Rocket/Space"}
		inserts << {:parent=>"BANKS",:child=>"Safe Shaped"}
		inserts << {:parent=>"BANKS",:child=>"Still"}
		inserts << {:parent=>"BANKS",:child=>""}
		inserts << {:parent=>"BANKS (MODERN)",:child=>""}
		inserts << {:parent=>"BARBED WIRE",:child=>""}
		inserts << {:parent=>"BARBERSHOP COLLECTIBLES",:child=>"Barber Poles"}
		inserts << {:parent=>"BARBERSHOP COLLECTIBLES",:child=>"Furnishings"}
		inserts << {:parent=>"BARBERSHOP COLLECTIBLES",:child=>"Shaving Mugs"}
		inserts << {:parent=>"BARBERSHOP COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BAROMETERS",:child=>""}
		inserts << {:parent=>"BASKETS",:child=>"Longaberger"}
		inserts << {:parent=>"BASKETS",:child=>""}
		inserts << {:parent=>"BATHING BEAUTIES",:child=>"Nudies & Naughties"}
		inserts << {:parent=>"BAYONETS",:child=>""}
		inserts << {:parent=>"BEADS",:child=>""}
		inserts << {:parent=>"BEAUTY SHOP COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BEEKEEPING MEMORABILIA",:child=>""}
		inserts << {:parent=>"BEER CANS",:child=>""}
		inserts << {:parent=>"BELLS",:child=>""}
		inserts << {:parent=>"BERMUDA COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BIBLES",:child=>""}
		inserts << {:parent=>"BICYCLES & RELATED MEMORABILIA",:child=>"License Plates"}
		inserts << {:parent=>"BICYCLES & RELATED MEMORABILIA",:child=>""}
		inserts << {:parent=>"BIEDERMEIER",:child=>""}
		inserts << {:parent=>"BILLIARD RELATED ITEMS",:child=>""}
		inserts << {:parent=>"BILLIKENS",:child=>""}
		inserts << {:parent=>"BINOCULARS",:child=>""}
		inserts << {:parent=>"BIRD'S-EYE-MAPLE",:child=>""}
		inserts << {:parent=>"BIRTH RELATED ITEMS",:child=>""}
		inserts << {:parent=>"BLACK MEMORABILIA",:child=>"Postcards (Dance Related)"}
		inserts << {:parent=>"BLACK MEMORABILIA",:child=>"Racist Related"}
		inserts << {:parent=>"BLACK MEMORABILIA",:child=>"Sheet Music (Dance Related)"}
		inserts << {:parent=>"BLACK MEMORABILIA",:child=>""}
		inserts << {:parent=>"BLACKLIGHTS (UV LAMPS)",:child=>""}
		inserts << {:parent=>"BLACKSMITHING ITEMS",:child=>""}
		inserts << {:parent=>"BLOTTERS",:child=>""}
		inserts << {:parent=>"BOATS",:child=>"Canoes"}
		inserts << {:parent=>"BOATS",:child=>"Chris-Craft"}
		inserts << {:parent=>"BOATS",:child=>"Model"}
		inserts << {:parent=>"BOATS",:child=>"Outboard Motors"}
		inserts << {:parent=>"BOATS",:child=>"Steam"}
		inserts << {:parent=>"BOATS",:child=>"Tug"}
		inserts << {:parent=>"BOATS",:child=>""}
		inserts << {:parent=>"BOOK ARTS",:child=>""}
		inserts << {:parent=>"BOOKENDS",:child=>""}
		inserts << {:parent=>"BOOKMARKS",:child=>"Notched"}
		inserts << {:parent=>"BOOKMARKS",:child=>""}
		inserts << {:parent=>"BOOKPLATES",:child=>""}
		inserts << {:parent=>"BOOKS",:child=>"Aviation Related"}
		inserts << {:parent=>"BOOKS",:child=>"Big Little"}
		inserts << {:parent=>"BOOKS",:child=>"Boys'"}
		inserts << {:parent=>"BOOKS",:child=>"British"}
		inserts << {:parent=>"BOOKS",:child=>"Children's"}
		inserts << {:parent=>"BOOKS",:child=>"Dictionaries"}
		inserts << {:parent=>"BOOKS",:child=>"Etiquette"}
		inserts << {:parent=>"BOOKS",:child=>"First Editions"}
		inserts << {:parent=>"BOOKS",:child=>"Fore-Edge Painted"}
		inserts << {:parent=>"BOOKS",:child=>"German"}
		inserts << {:parent=>"BOOKS",:child=>"Ghosts"}
		inserts << {:parent=>"BOOKS",:child=>"Illustrated"}
		inserts << {:parent=>"BOOKS",:child=>"Jules Verne"}
		inserts << {:parent=>"BOOKS",:child=>"Juvenile Series"}
		inserts << {:parent=>"BOOKS",:child=>"Little Golden Books"}
		inserts << {:parent=>"BOOKS",:child=>"Miniature"}
		inserts << {:parent=>"BOOKS",:child=>"Modern Library"}
		inserts << {:parent=>"BOOKS",:child=>"Mountaineering"}
		inserts << {:parent=>"BOOKS",:child=>"New York"}
		inserts << {:parent=>"BOOKS",:child=>"Paperback"}
		inserts << {:parent=>"BOOKS",:child=>"Pocket"}
		inserts << {:parent=>"BOOKS",:child=>"Pop-Up & Movable"}
		inserts << {:parent=>"BOOKS",:child=>"Pop-Up & Movable (Flip)"}
		inserts << {:parent=>"BOOKS",:child=>"Poultry"}
		inserts << {:parent=>"BOOKS",:child=>"Railroad"}
		inserts << {:parent=>"BOOKS",:child=>"Rare, Antiquarian, Out-of-Print"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Antiques)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Architecture)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Art)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Art, Asian)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Automobiles)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Aviation)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Cameras)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Ceramics)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Civil War)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Clocks)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Coin-Operated)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Coins)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Dolls)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Exonumia)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Farm Toys)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Firearms)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Gems/Jewelry)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Glass)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Japanese Prints)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Jukeboxes)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Knives)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Law Enforcement)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Maps & Charts)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Militaria)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Music)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Native American)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Natural History)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Nautical)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Orientalia)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Paperweights)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Phonographs)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Postcards)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Quilts)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Radios)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Railroads)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Records)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Reptile/Amphibians)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Stamps)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Teddy Bears)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Telegraph Items)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Textiles)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Tiles)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Tools)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Toys)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Vintage Clothing)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Watches)"}
		inserts << {:parent=>"BOOKS",:child=>"Reference (Western Americana)"}
		inserts << {:parent=>"BOOKS",:child=>"Roycroft"}
		inserts << {:parent=>"BOOKS",:child=>"Scottish"}
		inserts << {:parent=>"BOOKS",:child=>"Sports"}
		inserts << {:parent=>"BOOKS",:child=>""}
		inserts << {:parent=>"BOSSONS",:child=>""}
		inserts << {:parent=>"BOTTLE CAPS",:child=>"Crown"}
		inserts << {:parent=>"BOTTLE CAPS",:child=>"Milk"}
		inserts << {:parent=>"BOTTLE OPENERS (FIGURAL)",:child=>""}
		inserts << {:parent=>"BOTTLES",:child=>"Baltimore"}
		inserts << {:parent=>"BOTTLES",:child=>"Barber"}
		inserts << {:parent=>"BOTTLES",:child=>"Bitters"}
		inserts << {:parent=>"BOTTLES",:child=>"Bubble Bath"}
		inserts << {:parent=>"BOTTLES",:child=>"Cappers"}
		inserts << {:parent=>"BOTTLES",:child=>"Ginger Beer"}
		inserts << {:parent=>"BOTTLES",:child=>"Hair"}
		inserts << {:parent=>"BOTTLES",:child=>"Historical Flasks"}
		inserts << {:parent=>"BOTTLES",:child=>"Hutchinson Soda"}
		inserts << {:parent=>"BOTTLES",:child=>"Japanese"}
		inserts << {:parent=>"BOTTLES",:child=>"Japanese/German Giveaway"}
		inserts << {:parent=>"BOTTLES",:child=>"Milk"}
		inserts << {:parent=>"BOTTLES",:child=>"Miniature Beer & Soda"}
		inserts << {:parent=>"BOTTLES",:child=>"Miniature Liquor"}
		inserts << {:parent=>"BOTTLES",:child=>"Perfume & Scent"}
		inserts << {:parent=>"BOTTLES",:child=>"Perfume & Scent (Miniature)"}
		inserts << {:parent=>"BOTTLES",:child=>"Poison"}
		inserts << {:parent=>"BOTTLES",:child=>"Puzzle"}
		inserts << {:parent=>"BOTTLES",:child=>"Violin"}
		inserts << {:parent=>"BOTTLES",:child=>"Western Whiskey"}
		inserts << {:parent=>"BOTTLES",:child=>""}
		inserts << {:parent=>"BOXES",:child=>"Enameled"}
		inserts << {:parent=>"BOXES",:child=>"Enameled (Battersea)"}
		inserts << {:parent=>"BOXES",:child=>"Enameled (Halcyon)"}
		inserts << {:parent=>"BOXES",:child=>""}
		inserts << {:parent=>"BOY SCOUT MEMORABILIA",:child=>"Camps"}
		inserts << {:parent=>"BOY SCOUT MEMORABILIA",:child=>"Neckerchief Slides"}
		inserts << {:parent=>"BOY SCOUT MEMORABILIA",:child=>"Order of the Arrow"}
		inserts << {:parent=>"BOY SCOUT MEMORABILIA",:child=>""}
		inserts << {:parent=>"BRASS ITEMS",:child=>""}
		inserts << {:parent=>"BREWERIANA",:child=>"Advertising"}
		inserts << {:parent=>"BREWERIANA",:child=>"Blatz"}
		inserts << {:parent=>"BREWERIANA",:child=>"Canadian"}
		inserts << {:parent=>"BREWERIANA",:child=>"Coasters"}
		inserts << {:parent=>"BREWERIANA",:child=>"Guinness"}
		inserts << {:parent=>"BREWERIANA",:child=>"Hamm's Beer"}
		inserts << {:parent=>"BREWERIANA",:child=>"Heineken"}
		inserts << {:parent=>"BREWERIANA",:child=>"Labels"}
		inserts << {:parent=>"BREWERIANA",:child=>"Lexington Brewery"}
		inserts << {:parent=>"BREWERIANA",:child=>"Napkins"}
		inserts << {:parent=>"BREWERIANA",:child=>"Openers"}
		inserts << {:parent=>"BREWERIANA",:child=>"Schlitz"}
		inserts << {:parent=>"BREWERIANA",:child=>"Yuengling"}
		inserts << {:parent=>"BREWERIANA",:child=>""}
		inserts << {:parent=>"BRICKS",:child=>""}
		inserts << {:parent=>"BRIDAL COLLECTIBLES",:child=>"Cake Toppers"}
		inserts << {:parent=>"BRIDAL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BRIDGE",:child=>""}
		inserts << {:parent=>"BROADCASTING",:child=>"Microphones"}
		inserts << {:parent=>"BROADCASTING",:child=>"Military"}
		inserts << {:parent=>"BROADCASTING",:child=>""}
		inserts << {:parent=>"BRONZES",:child=>"Foundry"}
		inserts << {:parent=>"BRONZES",:child=>"Remington"}
		inserts << {:parent=>"BRONZES",:child=>""}
		inserts << {:parent=>"BUBBLE GUM & CANDY WRAPPERS",:child=>""}
		inserts << {:parent=>"BURMA SHAVE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BUS LINE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"BUSES",:child=>""}
		inserts << {:parent=>"BUSINESS CARD HOLDERS",:child=>""}
		inserts << {:parent=>"BUSINESS CARDS",:child=>""}
		inserts << {:parent=>"BUTTER PATS",:child=>""}
		inserts << {:parent=>"BUTTONHOOKS",:child=>""}
		inserts << {:parent=>"BUTTONS",:child=>"Military (American)"}
		inserts << {:parent=>"BUTTONS",:child=>"Pin-Back"}
		inserts << {:parent=>"BUTTONS",:child=>"Pin-Back (Character/Comic)"}
		inserts << {:parent=>"BUTTONS",:child=>"Transportation Employees'"}
		inserts << {:parent=>"BUTTONS",:child=>""}
		inserts << {:parent=>"CALCULATORS",:child=>"Hewlett-Packard"}
		inserts << {:parent=>"CALCULATORS",:child=>""}
		inserts << {:parent=>"CALENDAR PLATES",:child=>""}
		inserts << {:parent=>"CALENDARS",:child=>"Firearms Related"}
		inserts << {:parent=>"CALENDARS",:child=>""}
		inserts << {:parent=>"CALIFORNIA PERFUME COMPANY",:child=>""}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Argus"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Deardorff"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Exakta"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Film for"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Graflex"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Kodak"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Kodak Brownie"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Leica"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Military"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Minox"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Miranda"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Movie"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Nikon"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Retina"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Rollei"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Russian"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Stereo Cameras"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Subminiature"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>"Zeiss"}
		inserts << {:parent=>"CAMERAS & CAMERA EQUIPMENT",:child=>""}
		inserts << {:parent=>"CAMPBELL SOUP COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CAMPING EQUIPMENT",:child=>"Coleman"}
		inserts << {:parent=>"CAN OPENERS",:child=>""}
		inserts << {:parent=>"CANAL COLLECTIBLES",:child=>"Erie Canal"}
		inserts << {:parent=>"CANAL COLLECTIBLES",:child=>"Panama Canal"}
		inserts << {:parent=>"CANAL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CAN-CAN",:child=>""}
		inserts << {:parent=>"CANDY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CANDY CONTAINERS",:child=>"Jars"}
		inserts << {:parent=>"CANDY CONTAINERS",:child=>""}
		inserts << {:parent=>"CANES & WALKING STICKS",:child=>"Political"}
		inserts << {:parent=>"CANES & WALKING STICKS",:child=>""}
		inserts << {:parent=>"CANNONS",:child=>"Starter"}
		inserts << {:parent=>"CANNONS",:child=>""}
		inserts << {:parent=>"CARDS",:child=>"Tarot"}
		inserts << {:parent=>"CARNEGIE HALL ITEMS",:child=>""}
		inserts << {:parent=>"CARNIVAL ITEMS",:child=>"Chalkware"}
		inserts << {:parent=>"CARNIVAL ITEMS",:child=>""}
		inserts << {:parent=>"CAROUSELS & CAROUSEL FIGURES",:child=>"Miniature"}
		inserts << {:parent=>"CAROUSELS & CAROUSEL FIGURES",:child=>""}
		inserts << {:parent=>"CARTOON ART",:child=>"Comics"}
		inserts << {:parent=>"CARTOON ART",:child=>"Doonesbury"}
		inserts << {:parent=>"CARTOON ART",:child=>"Milton Caniff"}
		inserts << {:parent=>"CARTOON ART",:child=>"Walt Kelly"}
		inserts << {:parent=>"CARTOON ART",:child=>""}
		inserts << {:parent=>"CASH REGISTERS",:child=>""}
		inserts << {:parent=>"CAST IRON ITEMS",:child=>"Cookware"}
		inserts << {:parent=>"CAST IRON ITEMS",:child=>"Cookware (Griswold)"}
		inserts << {:parent=>"CAST IRON ITEMS",:child=>"Cookware (Wagner)"}
		inserts << {:parent=>"CAST IRON ITEMS",:child=>""}
		inserts << {:parent=>"CATALOGS",:child=>"Christmas"}
		inserts << {:parent=>"CATALOGS",:child=>"Mail Order"}
		inserts << {:parent=>"CATALOGS",:child=>"Trade"}
		inserts << {:parent=>"CATALOGS",:child=>"Trade (Furniture)"}
		inserts << {:parent=>"CATALOGS",:child=>"Trade (Homebuilding)"}
		inserts << {:parent=>"CATALOGS",:child=>"Trade (Kitchen Collectibles)"}
		inserts << {:parent=>"CAVE RELATED ITEMS",:child=>""}
		inserts << {:parent=>"CELLULOID ITEMS",:child=>""}
		inserts << {:parent=>"CERAMICS",:child=>"Belleek"}
		inserts << {:parent=>"CERAMICS",:child=>"Belleek (American)"}
		inserts << {:parent=>"CERAMICS",:child=>"Blue & White Pottery"}
		inserts << {:parent=>"CERAMICS",:child=>"Blue Mountain"}
		inserts << {:parent=>"CERAMICS",:child=>"Chintz"}
		inserts << {:parent=>"CERAMICS",:child=>"Clay Art"}
		inserts << {:parent=>"CERAMICS",:child=>"Cups & Saucers"}
		inserts << {:parent=>"CERAMICS",:child=>"Don Winton"}
		inserts << {:parent=>"CERAMICS",:child=>"Flow Blue"}
		inserts << {:parent=>"CERAMICS",:child=>"Gaudy"}
		inserts << {:parent=>"CERAMICS",:child=>"Handpainted"}
		inserts << {:parent=>"CERAMICS",:child=>"Head Vase Planters"}
		inserts << {:parent=>"CERAMICS",:child=>"Ironstone (Mason's)"}
		inserts << {:parent=>"CERAMICS",:child=>"Ironstone (Tea Leaf)"}
		inserts << {:parent=>"CERAMICS",:child=>"Ironstone (White)"}
		inserts << {:parent=>"CERAMICS",:child=>"Jugs (Puzzle)"}
		inserts << {:parent=>"CERAMICS",:child=>"Kutani"}
		inserts << {:parent=>"CERAMICS",:child=>"Lefton"}
		inserts << {:parent=>"CERAMICS",:child=>"Majolica"}
		inserts << {:parent=>"CERAMICS",:child=>"Majolica (Palissy Ware)"}
		inserts << {:parent=>"CERAMICS",:child=>"Mexican"}
		inserts << {:parent=>"CERAMICS",:child=>"Military Related"}
		inserts << {:parent=>"CERAMICS",:child=>"Mochaware"}
		inserts << {:parent=>"CERAMICS",:child=>"New Jersey (Trenton)"}
		inserts << {:parent=>"CERAMICS",:child=>"Picasso Editions"}
		inserts << {:parent=>"CERAMICS",:child=>"Planters"}
		inserts << {:parent=>"CERAMICS",:child=>"Political Related"}
		inserts << {:parent=>"CERAMICS",:child=>"Redware"}
		inserts << {:parent=>"CERAMICS",:child=>"Rockingham"}
		inserts << {:parent=>"CERAMICS",:child=>"Spatterware"}
		inserts << {:parent=>"CERAMICS",:child=>"Spongeware"}
		inserts << {:parent=>"CERAMICS",:child=>"Studio Ceramic Art"}
		inserts << {:parent=>"CERAMICS",:child=>"Terra Cotta"}
		inserts << {:parent=>"CERAMICS",:child=>"Willow Pattern"}
		inserts << {:parent=>"CERAMICS",:child=>""}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Art Deco"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Bennington"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Bybee"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Carr China Co."}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"George Ohr"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Harding Black"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Illinois"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Lewistown Pottery"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Russel Wright Designs"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Southern Folk Pottery"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Stoneware"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Stoneware (Red Wing Pottery)"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>"Texas"}
		inserts << {:parent=>"CERAMICS ( AMERICAN )",:child=>""}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Brush-McCoy Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Clewell Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Cowan Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Dedham Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Ephriam Faience"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Fulper Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Gonder Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Houghton/Dalton"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Love Field Potteries"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"McCoy Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Newcomb College"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"North Dakota"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Owens Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Pisgah Forest"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Red Wing"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Rookwood Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Roseville Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"San Jose Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Van Briggle Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>"Weller Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN ART POTTERY)",:child=>""}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Blair Ceramics"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Buffalo Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Coors Porcelain Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Gladding-McBean/Franciscan"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Hall China Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Hall China Co./Autumn Leaf"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Homer Laughlin China Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Homer Laughlin/Fiesta"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Iroquois China Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Metlox Potteries"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Pennsbury Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Pfaltzgraff Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Pickard"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Porcelier"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Red Wing"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Reed & Barton"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Restaurant China"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Royal China Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Royal China Co./Currier & Ives"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Scio Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Southern Potteries/Blue Ridge"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Stangl Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Taylor, Smith & Taylor/LuRay"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Vernon Kilns"}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Wallace China Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Warwick China Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>"Watt Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN DINNERWARE)",:child=>""}
		inserts << {:parent=>"CERAMICS (AMERICAN FIGURES)",:child=>"Ceramic Arts Studio"}
		inserts << {:parent=>"CERAMICS (AMERICAN FIGURES)",:child=>"Florence"}
		inserts << {:parent=>"CERAMICS (AMERICAN FIGURES)",:child=>"Kay Finch"}
		inserts << {:parent=>"CERAMICS (AMERICAN FIGURES)",:child=>"Stangl Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Abingdon"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"American Bisque Company"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Bauer"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Brush-McCoy Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"California Potteries"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Camark Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Catalina Island Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"deLee"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Dryden Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Eva Zeisel"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Frankoma Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Haeger/Royal Haeger"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Howard Pierce"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Hull Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Hull Pottery/Red Riding Hood"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Kreiss"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"May & Vieve Hamilton"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"McCoy Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Muncie Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Nemadji Tile & Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Niloak Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Overbeck"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Pewabic Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Purinton"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Ransburg"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Regal China Corp."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Rumrill Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Shawnee Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Spaulding China/Royal Copley"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Stanford Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Tamac Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Treasure Craft Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Twin Winton Pottery"}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>"Uhl Pottery Co."}
		inserts << {:parent=>"CERAMICS (AMERICAN PRODUCTION ARTWARE)",:child=>""}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Amphora"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Art Pottery"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Bing & Grondahl"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Capodimonte"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Conta & Boehme"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Czechoslovakian"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Delft"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"French"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Gouda"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Haviland"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Herend"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Hutschenreuther"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Italian"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Limoges"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Massier"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Meissen"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Mottahedeh"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Old Ivory"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Portuguese"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Quimper"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"R.S. Prussia"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Rosenthal"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Royal Bayreuth"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Royal Copenhagen"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Royal Copenhagen/Flora Danica"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Scandinavian"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Sevres"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Sitzendorf"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Teplitz-Turn"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Villeroy & Boch"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>"Zsolnay"}
		inserts << {:parent=>"CERAMICS (CONTINENTAL)",:child=>""}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Art Pottery"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Aynsley"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Beswick"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Bunnykins"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Burleigh"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Carlton Ware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Chelsea Ware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Clarice Cliff"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Cornish Ware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Crown Devon"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Daniel Ceramics"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Derby"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Goss China/Crested Ware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Honiton"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Hornsea"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Langley Ware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Maling"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Moorcroft"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Myott"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Paragon Ceramics"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Pilkington"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Pinxton"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Poole Pottery"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Rabbitware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Radford Ceramics"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Royal Crown Derby"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Royal Doulton"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Royal Winton"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Royal Worcester"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Rye Ceramics"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Seacombe"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Shelley Potteries"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Spode"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Staffordshire"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Staffordshire (Historical)"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Staffordshire (Romantic)"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Susie Cooper China Ltd."}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Sylvac"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Torquay"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Transferware"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Wade"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>"Wedgwood"}
		inserts << {:parent=>"CERAMICS (ENGLISH)",:child=>""}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Chinese Export Porcelain"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Dragonware"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Geisha Girl Porcelain"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Imari"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Nippon"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Noritake"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Phoenix Bird Pattern"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>"Satsuma"}
		inserts << {:parent=>"CERAMICS (ORIENTAL)",:child=>""}
		inserts << {:parent=>"CERAMICS (SCOTTISH)",:child=>""}
		inserts << {:parent=>"CEREAL BOXES",:child=>"Oats"}
		inserts << {:parent=>"CEREAL BOXES",:child=>""}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Alice In Wonderland"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Betty Boop"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"California Raisins"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Cartoon & Comic"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Davy Crockett"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Dick Tracy"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Felix The Cat"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Garfield"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Grinch"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Gumby"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Hanna-Barbera"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Howdy Doody"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Humpty Dumpty"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Jigglers"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Mystery Science Theater 3000"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Peanuts Characters"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Pink Panther"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Pogo"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Popeye"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Punch & Judy"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Sherlock Holmes"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Smurf"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Soupy Sales"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Spy Memorabilia"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Spy Memorabilia (James Bond)"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Tarzan"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Three Stooges"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Uncle Remus"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>"Uncle Wiggily"}
		inserts << {:parent=>"CHARACTER COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CHESS SETS",:child=>""}
		inserts << {:parent=>"CHILDREN'S THINGS",:child=>"Cups"}
		inserts << {:parent=>"CHILDREN'S THINGS",:child=>"Dishes"}
		inserts << {:parent=>"CHILDREN'S THINGS",:child=>"Handkerchiefs"}
		inserts << {:parent=>"CHILDREN'S THINGS",:child=>""}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>"Creches"}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>"Feather Trees"}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>"Mail Order Catalogs"}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>"Mexican"}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>"Ornaments"}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>"Santa Claus"}
		inserts << {:parent=>"CHRISTMAS COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CIGAR BOXES, LABELS & BANDS",:child=>""}
		inserts << {:parent=>"CIGAR STORE COLLECTIBLES",:child=>"Cigar Cutters"}
		inserts << {:parent=>"CIGAR STORE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CIGARETTE COLLECTIBLES",:child=>"Cigarette Boxes"}
		inserts << {:parent=>"CIGARETTE COLLECTIBLES",:child=>"Packs"}
		inserts << {:parent=>"CIGARETTE COLLECTIBLES",:child=>"Roll-Your-Own Papers"}
		inserts << {:parent=>"CIGARETTE COLLECTIBLES",:child=>"Silks"}
		inserts << {:parent=>"CIGARETTE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CIRCUS COLLECTIBLES",:child=>"Ricketts Circus"}
		inserts << {:parent=>"CIRCUS COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Artillery"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Bullets"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Confederate"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Confederate Bonds"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Confederate Swords"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Currency"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Paper Items"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Photographs"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Swords"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>"Tokens"}
		inserts << {:parent=>"CIVIL WAR ARTIFACTS",:child=>""}
		inserts << {:parent=>"CIVIL WAR HISTORY",:child=>"Cavalry"}
		inserts << {:parent=>"CIVIL WAR HISTORY",:child=>""}
		inserts << {:parent=>"CIVILIAN CONSERVATION CORPS ITEMS",:child=>""}
		inserts << {:parent=>"CLOCKS",:child=>"Alarm"}
		inserts << {:parent=>"CLOCKS",:child=>"Anniversary (400-Day)"}
		inserts << {:parent=>"CLOCKS",:child=>"Ansonia"}
		inserts << {:parent=>"CLOCKS",:child=>"Art Deco"}
		inserts << {:parent=>"CLOCKS",:child=>"British"}
		inserts << {:parent=>"CLOCKS",:child=>"Canadian"}
		inserts << {:parent=>"CLOCKS",:child=>"Cases"}
		inserts << {:parent=>"CLOCKS",:child=>"Character/Comic"}
		inserts << {:parent=>"CLOCKS",:child=>"Chelsea"}
		inserts << {:parent=>"CLOCKS",:child=>"Cuckoo"}
		inserts << {:parent=>"CLOCKS",:child=>"Dials"}
		inserts << {:parent=>"CLOCKS",:child=>"Electric"}
		inserts << {:parent=>"CLOCKS",:child=>"Electric (Atmos)"}
		inserts << {:parent=>"CLOCKS",:child=>"European (French)"}
		inserts << {:parent=>"CLOCKS",:child=>"Flow Blue"}
		inserts << {:parent=>"CLOCKS",:child=>"Lantern"}
		inserts << {:parent=>"CLOCKS",:child=>"Neon"}
		inserts << {:parent=>"CLOCKS",:child=>"Novelty Animated"}
		inserts << {:parent=>"CLOCKS",:child=>"Sundials"}
		inserts << {:parent=>"CLOCKS",:child=>"Tower"}
		inserts << {:parent=>"CLOCKS",:child=>"Willard"}
		inserts << {:parent=>"CLOCKS",:child=>""}
		inserts << {:parent=>"CLOISONNE",:child=>""}
		inserts << {:parent=>"CLOTHES SPRINKLERS",:child=>""}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Boots"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Costumes (Historical)"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Couture"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Hats"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Izod"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Lingerie"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Mannequins"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Neckties"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Parasols"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Patterns"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Shoes"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"T-shirts"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Vintage"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Wearable Art"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>"Wedding Gowns"}
		inserts << {:parent=>"CLOTHING & ACCESSORIES",:child=>""}
		inserts << {:parent=>"CLOWN COLLECTIBLES",:child=>"Emmett Kelly"}
		inserts << {:parent=>"CLOWN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"COAST GUARD",:child=>"U.S. Life-Saving Service"}
		inserts << {:parent=>"COAST GUARD",:child=>"U.S. Lighthouse Service"}
		inserts << {:parent=>"COAST GUARD",:child=>"U.S. Revenue Cutter Service"}
		inserts << {:parent=>"COAST GUARD",:child=>""}
		inserts << {:parent=>"COFFEE",:child=>"Arbuckles Bros. Coffee Co."}
		inserts << {:parent=>"COFFEE",:child=>"Mills & Grinders"}
		inserts << {:parent=>"COFFEE",:child=>"Tins"}
		inserts << {:parent=>"COFFEE",:child=>""}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Arcade Games"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Gumball Machines"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Jukeboxes"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Jukeboxes (Film)"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Pinball Machines"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Scales"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Slot Machines"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Trade Stimulators"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>"Vending Machines"}
		inserts << {:parent=>"COIN-OPERATED MACHINES",:child=>""}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Chinese"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Coins (Ancient)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Coins (Barber)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Coins (Copper)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Coins (Gold)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Coins (World Proof)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Commemorative Coins"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Errors"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Lincoln Cent"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Paper Money"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Paper Money (Fractional Currency)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Paper Money (World)"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Play Money"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Russian"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Silver Dollars"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>"Supplies For"}
		inserts << {:parent=>"COINS & CURRENCY",:child=>""}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Buildings (Brandywine)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Buildings (Cat's Meow)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Buildings (My Friends & Me)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Buildings (Shelia's)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Christmas"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Clarissa Johnson"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Clowns (Ron Lee)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Cottages"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Cottages (David Winter)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Cottages (Forma Vitrum)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Cottages (Lilliput Lane)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Cottages (Windy Meadows)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Crystal"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Crystal (Crystal Reflection)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Crystal (Crystal World)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Crystal (Silver Deer)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Crystal (Swarovski)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Danbury Mint"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dept. 56"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (American Girl)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Effanbee)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Federica Kasabasic)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Lee Middleton)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Lenox)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Madame Alexander)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Naber)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Susan Wakeen)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Terri Lee)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Wendy Lawton)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Dolls (Wimbledon)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Donald Zolan"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Face Pots (Kevin Francis)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (All God's Children)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Andrea by Sadek)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Anri)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Armani)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Byers)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Cairn)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Carousels)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Disney)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Fontanini)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Goebel)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Goebel-Miniatures)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (June McKenna)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Krystonia)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Lighthouses)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Margaret Furlong)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Maruri)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Patchville)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (PenDelfin)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Ron Lee)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Sebastian)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Second Nature)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Seraphim Classics)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Silver Deer)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Figurines (Wee Forest Folk)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Flowers (Capodimonte)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Folk Art"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Franklin Mint"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Lenox"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Lithophanes"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Music Boxes"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Norman Rockwell"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ornaments"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ornaments (Christopher Radko)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ornaments (Danforth)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ornaments (Hallmark)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ornaments (Old World)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ornaments (Sterling Silver)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"P. Buckley Moss"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Penni Anne Cross"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Plates"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Plates (Rockwell)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Prayer Ladies"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Precious Moments"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Reed & Barton"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Royal Doulton"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Russian"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sculptures (Chilmark)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sculptures (LEGENDS)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sculptures (Mark Hopkins)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sculptures (Sandicast)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sculptures (Tom Clark)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Shoes (Miniature)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Spangler's Realm"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sports Related (Sports Imp.)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Sports Related (Start. Lineup)"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Steins"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>"Ted DeGrazia"}
		inserts << {:parent=>"COLLECTIBLES (MODERN)",:child=>""}
		inserts << {:parent=>"COLLEGE COLLECTIBLES",:child=>"Humor Magazines"}
		inserts << {:parent=>"COMBS & HAIR ACCESSORIES",:child=>""}
		inserts << {:parent=>"COMIC BOOKS",:child=>"Super Heroes"}
		inserts << {:parent=>"COMIC BOOKS",:child=>""}
		inserts << {:parent=>"COMIC STRIPS",:child=>"Sunday Newspaper"}
		inserts << {:parent=>"COMPACT DISCS",:child=>""}
		inserts << {:parent=>"COMPACTS",:child=>""}
		inserts << {:parent=>"COMPUTERS",:child=>"Commodore"}
		inserts << {:parent=>"COMPUTERS",:child=>"Mac"}
		inserts << {:parent=>"COMPUTERS",:child=>""}
		inserts << {:parent=>"CONSERVATION",:child=>""}
		inserts << {:parent=>"COOKBOOKS",:child=>""}
		inserts << {:parent=>"COOKIE JARS",:child=>""}
		inserts << {:parent=>"COOKIES & COOKIE SHAPING",:child=>""}
		inserts << {:parent=>"COPPER ITEMS",:child=>""}
		inserts << {:parent=>"CORKSCREWS",:child=>""}
		inserts << {:parent=>"CORN COLLECTIBLES",:child=>"Corn Shellers"}
		inserts << {:parent=>"CORN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"COUNTERFEIT DETECTING ITEMS",:child=>""}
		inserts << {:parent=>"COVERED BRIDGES",:child=>""}
		inserts << {:parent=>"COVERLETS",:child=>""}
		inserts << {:parent=>"COWBOY HEROES",:child=>"Gene Autry"}
		inserts << {:parent=>"COWBOY HEROES",:child=>"Hopalong Cassidy"}
		inserts << {:parent=>"COWBOY HEROES",:child=>"Lone Ranger"}
		inserts << {:parent=>"COWBOY HEROES",:child=>"Roy Rogers & Dale Evans"}
		inserts << {:parent=>"COWBOY HEROES",:child=>"Tom Mix"}
		inserts << {:parent=>"COWBOY HEROES",:child=>""}
		inserts << {:parent=>"CRACKER JACK COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CRAFTS",:child=>"Basketry"}
		inserts << {:parent=>"CRAFTS",:child=>"Glass"}
		inserts << {:parent=>"CRAFTS",:child=>"Metal"}
		inserts << {:parent=>"CRAFTS",:child=>""}
		inserts << {:parent=>"CRANBERRY INDUSTRY ITEMS",:child=>""}
		inserts << {:parent=>"CREDIT CARDS & CHARGE ITEMS",:child=>""}
		inserts << {:parent=>"CRUETS",:child=>""}
		inserts << {:parent=>"CUBAN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"CUFF LINKS",:child=>"Enameled"}
		inserts << {:parent=>"CUFF LINKS",:child=>""}
		inserts << {:parent=>"CUP PLATES",:child=>""}
		inserts << {:parent=>"DAIRY COLLECTIBLES",:child=>"Cream Separators"}
		inserts << {:parent=>"DAIRY COLLECTIBLES",:child=>"Creamers"}
		inserts << {:parent=>"DAIRY COLLECTIBLES",:child=>"Milk Cartons"}
		inserts << {:parent=>"DAIRY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"DATE NAILS",:child=>""}
		inserts << {:parent=>"DECANTERS",:child=>"Figural Whiskey"}
		inserts << {:parent=>"DECANTERS",:child=>"Figural Whiskey (Beam)"}
		inserts << {:parent=>"DECANTERS",:child=>"Figural Whiskey (Bell)"}
		inserts << {:parent=>"DECANTERS",:child=>"Figural Whiskey (Ski Country)"}
		inserts << {:parent=>"DECORATIVE ARTS",:child=>""}
		inserts << {:parent=>"DECOYS",:child=>"Canadian"}
		inserts << {:parent=>"DECOYS",:child=>"Factory"}
		inserts << {:parent=>"DECOYS",:child=>"Fish"}
		inserts << {:parent=>"DECOYS",:child=>"Waterfowl"}
		inserts << {:parent=>"DECOYS",:child=>"Waterfowl (Carving of)"}
		inserts << {:parent=>"DECOYS",:child=>"Waterfowl (Mason)"}
		inserts << {:parent=>"DECOYS",:child=>""}
		inserts << {:parent=>"DESERT STORM",:child=>""}
		inserts << {:parent=>"DIAMOND EDGE (SHAPLEIGH HARDWARE)",:child=>""}
		inserts << {:parent=>"DIARIES",:child=>""}
		inserts << {:parent=>"DICE",:child=>""}
		inserts << {:parent=>"DINERS & RELATED ITEMS",:child=>""}
		inserts << {:parent=>"DINNERWARE",:child=>"Gorham"}
		inserts << {:parent=>"DINNERWARE",:child=>"Haviland"}
		inserts << {:parent=>"DINNERWARE",:child=>"Johnson Bros."}
		inserts << {:parent=>"DINNERWARE",:child=>"Lenox"}
		inserts << {:parent=>"DINNERWARE",:child=>"Mikasa"}
		inserts << {:parent=>"DINNERWARE",:child=>"Noritake"}
		inserts << {:parent=>"DINNERWARE",:child=>"Wedgwood"}
		inserts << {:parent=>"DINNERWARE",:child=>""}
		inserts << {:parent=>"DISNEY COLLECTIBLES",:child=>"Ceramics"}
		inserts << {:parent=>"DISNEY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"DIXIE CUP LIDS",:child=>""}
		inserts << {:parent=>"DOLL HOUSES & FURNISHINGS",:child=>"Plastic"}
		inserts << {:parent=>"DOLL HOUSES & FURNISHINGS",:child=>""}
		inserts << {:parent=>"DOLLS",:child=>"Advertising"}
		inserts << {:parent=>"DOLLS",:child=>"Annalee"}
		inserts << {:parent=>"DOLLS",:child=>"Artist"}
		inserts << {:parent=>"DOLLS",:child=>"Automatons"}
		inserts << {:parent=>"DOLLS",:child=>"Barbie"}
		inserts << {:parent=>"DOLLS",:child=>"Betsy McCall"}
		inserts << {:parent=>"DOLLS",:child=>"Black"}
		inserts << {:parent=>"DOLLS",:child=>"Bobbing Head"}
		inserts << {:parent=>"DOLLS",:child=>"Boudoir"}
		inserts << {:parent=>"DOLLS",:child=>"Cabbage Patch Kids"}
		inserts << {:parent=>"DOLLS",:child=>"Celebrity"}
		inserts << {:parent=>"DOLLS",:child=>"Chatty Cathy"}
		inserts << {:parent=>"DOLLS",:child=>"Cloth"}
		inserts << {:parent=>"DOLLS",:child=>"Clothing"}
		inserts << {:parent=>"DOLLS",:child=>"Customized"}
		inserts << {:parent=>"DOLLS",:child=>"Dawn"}
		inserts << {:parent=>"DOLLS",:child=>"Ginny"}
		inserts << {:parent=>"DOLLS",:child=>"Golliwoggs"}
		inserts << {:parent=>"DOLLS",:child=>"Half"}
		inserts << {:parent=>"DOLLS",:child=>"Ideal Toy Co."}
		inserts << {:parent=>"DOLLS",:child=>"Japanese"}
		inserts << {:parent=>"DOLLS",:child=>"Kewpie"}
		inserts << {:parent=>"DOLLS",:child=>"Liddle Kiddles"}
		inserts << {:parent=>"DOLLS",:child=>"Paper"}
		inserts << {:parent=>"DOLLS",:child=>"Pincushion"}
		inserts << {:parent=>"DOLLS",:child=>"Raggedy Ann & Andy"}
		inserts << {:parent=>"DOLLS",:child=>"Ribbon Dolls"}
		inserts << {:parent=>"DOLLS",:child=>"Strawberry Shortcake"}
		inserts << {:parent=>"DOLLS",:child=>"Vogue"}
		inserts << {:parent=>"DOLLS",:child=>""}
		inserts << {:parent=>"DOORKNOBS",:child=>""}
		inserts << {:parent=>"DOORKNOCKERS",:child=>""}
		inserts << {:parent=>"DOORSTOPS",:child=>""}
		inserts << {:parent=>"DR. SEUSS COLLECTIBLES",:child=>""}
		inserts << {:parent=>"DRESSER ITEMS",:child=>"Hatpins & Hatpin Holders"}
		inserts << {:parent=>"DRESSER ITEMS",:child=>""}
		inserts << {:parent=>"DRUM & BUGLE CORPS",:child=>""}
		inserts << {:parent=>"EDGED WEAPONS",:child=>"German"}
		inserts << {:parent=>"EDGED WEAPONS",:child=>""}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Appliances"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Appliances (Coffee Pots)"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Appliances (Mixers)"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Appliances (Porcelier)"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Battery Jars"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Meters"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Motors"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>"Power Utilities Items"}
		inserts << {:parent=>"ELECTRICITY RELATED ITEMS",:child=>""}
		inserts << {:parent=>"ELONGATED COINS",:child=>""}
		inserts << {:parent=>"ELSIE THE BORDEN COW ITEMS",:child=>""}
		inserts << {:parent=>"ELVES",:child=>""}
		inserts << {:parent=>"ENAMELS",:child=>""}
		inserts << {:parent=>"ENCASED COINS",:child=>""}
		inserts << {:parent=>"ENDANGERED SPECIES",:child=>"Canadian"}
		inserts << {:parent=>"ENDANGERED SPECIES",:child=>"National Marine Fisheries Ser."}
		inserts << {:parent=>"ENDANGERED SPECIES",:child=>"State Conservation Agencies"}
		inserts << {:parent=>"ENDANGERED SPECIES",:child=>"U.S. Fish & Wildlife Service"}
		inserts << {:parent=>"ENESCO",:child=>""}
		inserts << {:parent=>"ENGINES",:child=>"Gasoline"}
		inserts << {:parent=>"ENGINES",:child=>"Steam"}
		inserts << {:parent=>"ENGINES",:child=>""}
		inserts << {:parent=>"EROTICA",:child=>""}
		inserts << {:parent=>"ESTATE SALE SERVICES",:child=>""}
		inserts << {:parent=>"EXIT GLOBES",:child=>""}
		inserts << {:parent=>"EYE RELATED ITEMS",:child=>"Eyecups"}
		inserts << {:parent=>"EYE RELATED ITEMS",:child=>"Eyeglasses"}
		inserts << {:parent=>"FAIRINGS",:child=>""}
		inserts << {:parent=>"FAIRY LAMPS",:child=>""}
		inserts << {:parent=>"FAN CLUBS",:child=>""}
		inserts << {:parent=>"FANS",:child=>"Hand-Held"}
		inserts << {:parent=>"FANS",:child=>"Mechanical"}
		inserts << {:parent=>"FARM COLLECTIBLES",:child=>"Cast Iron Seats"}
		inserts << {:parent=>"FARM COLLECTIBLES",:child=>"Haying Tools"}
		inserts << {:parent=>"FARM COLLECTIBLES",:child=>"Hog Oilers"}
		inserts << {:parent=>"FARM COLLECTIBLES",:child=>"Literature"}
		inserts << {:parent=>"FARM COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FARM MACHINERY",:child=>"International Harvester"}
		inserts << {:parent=>"FARM MACHINERY",:child=>""}
		inserts << {:parent=>"FAST FOOD COLLECTIBLES",:child=>"Burger King"}
		inserts << {:parent=>"FAST FOOD COLLECTIBLES",:child=>"Kentucky Fried Chicken"}
		inserts << {:parent=>"FAST FOOD COLLECTIBLES",:child=>"McDonald's"}
		inserts << {:parent=>"FAST FOOD COLLECTIBLES",:child=>"McDonald's (Happy Meal Toys)"}
		inserts << {:parent=>"FAST FOOD COLLECTIBLES",:child=>"McDonald's (Pins)"}
		inserts << {:parent=>"FAST FOOD COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FASTENERS",:child=>""}
		inserts << {:parent=>"FATHER TIME",:child=>""}
		inserts << {:parent=>"FEED SACKS",:child=>""}
		inserts << {:parent=>"FENCE COLLECTIBLES",:child=>"Posts"}
		inserts << {:parent=>"FENCE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FIGURINES",:child=>"Boehm"}
		inserts << {:parent=>"FIGURINES",:child=>"Borsato"}
		inserts << {:parent=>"FIGURINES",:child=>"Cybis"}
		inserts << {:parent=>"FIGURINES",:child=>"Dahl Jensen"}
		inserts << {:parent=>"FIGURINES",:child=>"Erich Stauffer"}
		inserts << {:parent=>"FIGURINES",:child=>"Hagen-Renaker"}
		inserts << {:parent=>"FIGURINES",:child=>"Hartland"}
		inserts << {:parent=>"FIGURINES",:child=>"Hummel"}
		inserts << {:parent=>"FIGURINES",:child=>"Hummel Look-Alikes"}
		inserts << {:parent=>"FIGURINES",:child=>"Josef Originals"}
		inserts << {:parent=>"FIGURINES",:child=>"Kaiser"}
		inserts << {:parent=>"FIGURINES",:child=>"Lady"}
		inserts << {:parent=>"FIGURINES",:child=>"Lipstick Ladies"}
		inserts << {:parent=>"FIGURINES",:child=>"Lladro"}
		inserts << {:parent=>"FIGURINES",:child=>"Morten Studio"}
		inserts << {:parent=>"FIGURINES",:child=>"Royal Dux"}
		inserts << {:parent=>"FIGURINES",:child=>"Syrocco"}
		inserts << {:parent=>"FILMS",:child=>"Videos"}
		inserts << {:parent=>"FILMS",:child=>""}
		inserts << {:parent=>"FIRE FIGHTING MEMORABILIA",:child=>"Apparatus"}
		inserts << {:parent=>"FIRE FIGHTING MEMORABILIA",:child=>"Fire Alarm Telegraphy"}
		inserts << {:parent=>"FIRE FIGHTING MEMORABILIA",:child=>"Grenades"}
		inserts << {:parent=>"FIRE FIGHTING MEMORABILIA",:child=>""}
		inserts << {:parent=>"FIRE INSURANCE RELATED COLLECTIBLES",:child=>"Fire Marks"}
		inserts << {:parent=>"FIRE INSURANCE RELATED COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FIREARMS",:child=>"Browning Firearms"}
		inserts << {:parent=>"FIREARMS",:child=>"Colt"}
		inserts << {:parent=>"FIREARMS",:child=>"Connecticut Arms & Mfg. Co."}
		inserts << {:parent=>"FIREARMS",:child=>"Freedom Firearms"}
		inserts << {:parent=>"FIREARMS",:child=>"Garand (M1)"}
		inserts << {:parent=>"FIREARMS",:child=>"German"}
		inserts << {:parent=>"FIREARMS",:child=>"Gunsmithing"}
		inserts << {:parent=>"FIREARMS",:child=>"High Standard Arms"}
		inserts << {:parent=>"FIREARMS",:child=>"Japanese Matchlocks"}
		inserts << {:parent=>"FIREARMS",:child=>"Kentucky Rifles"}
		inserts << {:parent=>"FIREARMS",:child=>"Mannlicher"}
		inserts << {:parent=>"FIREARMS",:child=>"Marlin"}
		inserts << {:parent=>"FIREARMS",:child=>"Miniature"}
		inserts << {:parent=>"FIREARMS",:child=>"Mossberg"}
		inserts << {:parent=>"FIREARMS",:child=>"Parker"}
		inserts << {:parent=>"FIREARMS",:child=>"Pistols"}
		inserts << {:parent=>"FIREARMS",:child=>"Remington"}
		inserts << {:parent=>"FIREARMS",:child=>"Rifles"}
		inserts << {:parent=>"FIREARMS",:child=>"Rifles (Single Shot)"}
		inserts << {:parent=>"FIREARMS",:child=>"Ruger"}
		inserts << {:parent=>"FIREARMS",:child=>"Sharps"}
		inserts << {:parent=>"FIREARMS",:child=>"Shooting Awards"}
		inserts << {:parent=>"FIREARMS",:child=>"Shotguns"}
		inserts << {:parent=>"FIREARMS",:child=>"Smith & Wesson"}
		inserts << {:parent=>"FIREARMS",:child=>"Thompson/Center Arms Co."}
		inserts << {:parent=>"FIREARMS",:child=>"Weatherby"}
		inserts << {:parent=>"FIREARMS",:child=>"Winchester"}
		inserts << {:parent=>"FIREARMS",:child=>""}
		inserts << {:parent=>"FIREPLACE ITEMS",:child=>"Fireboards"}
		inserts << {:parent=>"FIREPLACE ITEMS",:child=>"Mantels"}
		inserts << {:parent=>"FIREPLACE ITEMS",:child=>"Tools"}
		inserts << {:parent=>"FIREPLACE ITEMS",:child=>""}
		inserts << {:parent=>"FIREWORKS MEMORABILIA",:child=>""}
		inserts << {:parent=>"FISHING COLLECTIBLES",:child=>"Fly Fishing (Flies)"}
		inserts << {:parent=>"FISHING COLLECTIBLES",:child=>"Ice Fishing Spears"}
		inserts << {:parent=>"FISHING COLLECTIBLES",:child=>"Reels"}
		inserts << {:parent=>"FISHING COLLECTIBLES",:child=>"Reels (Fly Fishing)"}
		inserts << {:parent=>"FISHING COLLECTIBLES",:child=>"Rods (Bamboo)"}
		inserts << {:parent=>"FISHING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FLAGS & FLAG RELATED COLLECTIBLES",:child=>"Military"}
		inserts << {:parent=>"FLAGS & FLAG RELATED COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FLASHLIGHTS",:child=>""}
		inserts << {:parent=>"FLATWARE",:child=>"Silverplate"}
		inserts << {:parent=>"FLATWARE",:child=>"Sterling Silver"}
		inserts << {:parent=>"FLATWARE",:child=>""}
		inserts << {:parent=>"FLICKERS",:child=>""}
		inserts << {:parent=>"FLOORCLOTHS",:child=>""}
		inserts << {:parent=>"FLOWER 'FROGS'",:child=>""}
		inserts << {:parent=>"FOLK ART",:child=>"Carvings"}
		inserts << {:parent=>"FOLK ART",:child=>"Contemporary"}
		inserts << {:parent=>"FOLK ART",:child=>"Stoneware"}
		inserts << {:parent=>"FOLK ART",:child=>"Theorems"}
		inserts << {:parent=>"FOLK ART",:child=>"Tinware"}
		inserts << {:parent=>"FOLK ART",:child=>"Weathervanes"}
		inserts << {:parent=>"FOLK ART",:child=>""}
		inserts << {:parent=>"FOOD COLLECTIBLES",:child=>"Fake Food"}
		inserts << {:parent=>"FOOD COLLECTIBLES",:child=>"Ketchup"}
		inserts << {:parent=>"FOOD COLLECTIBLES",:child=>"Mustard"}
		inserts << {:parent=>"FOOD COLLECTIBLES",:child=>""}
		inserts << {:parent=>"FORD MOTOR COMPANY",:child=>""}
		inserts << {:parent=>"FOSSILS",:child=>""}
		inserts << {:parent=>"FRAKTURS",:child=>""}
		inserts << {:parent=>"FRAMES",:child=>"Picture"}
		inserts << {:parent=>"FRAMES",:child=>""}
		inserts << {:parent=>"FRANK LLOYD WRIGHT",:child=>""}
		inserts << {:parent=>"FRANKART",:child=>""}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>"American Legion"}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>"Elks"}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>"Knights of Columbus"}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>"Lions Clubs"}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>"Masonic"}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>"Odd Fellows"}
		inserts << {:parent=>"FRATERNAL ORGANIZATION ITEMS",:child=>""}
		inserts << {:parent=>"FRENCH FOREIGN LEGION",:child=>""}
		inserts << {:parent=>"FRUIT JARS",:child=>""}
		inserts << {:parent=>"FUNERAL ITEMS",:child=>""}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Antler & Horn"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Beds"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Belter"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"British"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Chinese"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Colonial Revival"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Continental"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"European"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"French"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Kitchen Cabinets"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Oak"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Rustic"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Shenandoah Valley"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Soap Hollow"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Stickley"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Stottlemyer"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Victorian"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Wallace Nutting"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>"Wooton Desks"}
		inserts << {:parent=>"FURNITURE (ANTIQUE)",:child=>""}
		inserts << {:parent=>"FURS",:child=>""}
		inserts << {:parent=>"GAMBLING COLLECTIBLES",:child=>"Gambling Chips & Gaming Tokens"}
		inserts << {:parent=>"GAMBLING COLLECTIBLES",:child=>"Punchboards"}
		inserts << {:parent=>"GAMBLING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"GAMES",:child=>"Bagatelle"}
		inserts << {:parent=>"GAMES",:child=>"Baseball Related"}
		inserts << {:parent=>"GAMES",:child=>"Board"}
		inserts << {:parent=>"GAMES",:child=>"Card"}
		inserts << {:parent=>"GAMES",:child=>"Checkers"}
		inserts << {:parent=>"GAMES",:child=>"Mah Jong"}
		inserts << {:parent=>"GAMES",:child=>"Skill & Action"}
		inserts << {:parent=>"GAMES",:child=>"Video Games"}
		inserts << {:parent=>"GAMES",:child=>"Waterfuls"}
		inserts << {:parent=>"GAMES",:child=>""}
		inserts << {:parent=>"GARDEN FURNITURE",:child=>"Furniture & Ornaments"}
		inserts << {:parent=>"GARDEN FURNITURE",:child=>""}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Conoco"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Frontier"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Hess"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Oil Cans"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Pumps & Globes"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Road Maps"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Shell"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>"Texaco"}
		inserts << {:parent=>"GAS STATION COLLECTIBLES",:child=>""}
		inserts << {:parent=>"GAUGES",:child=>"Steam"}
		inserts << {:parent=>"GAUGES",:child=>""}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Amber"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Bakelite"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Cameos"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Christmas"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Costume"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Diamonds"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Hawaiian Shell"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Jade"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Komboloi"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Mourning"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Opals"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Pearls"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Pearls (Majorican)"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Pearls (Mikimoto)"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Rhinestone"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Stick Pins"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Supplies For"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>"Vintage & Estate"}
		inserts << {:parent=>"GEMS & JEWELRY",:child=>""}
		inserts << {:parent=>"GENEALOGY",:child=>""}
		inserts << {:parent=>"GHOSTS & HAUNTINGS",:child=>""}
		inserts << {:parent=>"GIRL SCOUT MEMORABILIA",:child=>""}
		inserts << {:parent=>"GLASS",:child=>"Akro Agate/Westite"}
		inserts << {:parent=>"GLASS",:child=>"Art"}
		inserts << {:parent=>"GLASS",:child=>"Art (1950s)"}
		inserts << {:parent=>"GLASS",:child=>"Art (Austrian)"}
		inserts << {:parent=>"GLASS",:child=>"Baccarat"}
		inserts << {:parent=>"GLASS",:child=>"Black"}
		inserts << {:parent=>"GLASS",:child=>"Blenko"}
		inserts << {:parent=>"GLASS",:child=>"Bohemian"}
		inserts << {:parent=>"GLASS",:child=>"Boyd's Crystal Art"}
		inserts << {:parent=>"GLASS",:child=>"Cambridge"}
		inserts << {:parent=>"GLASS",:child=>"Cameo"}
		inserts << {:parent=>"GLASS",:child=>"Canadian"}
		inserts << {:parent=>"GLASS",:child=>"Carnival"}
		inserts << {:parent=>"GLASS",:child=>"Carnival (Post-1960)"}
		inserts << {:parent=>"GLASS",:child=>"Chance Brothers"}
		inserts << {:parent=>"GLASS",:child=>"Cloud"}
		inserts << {:parent=>"GLASS",:child=>"Coin"}
		inserts << {:parent=>"GLASS",:child=>"Consolidated"}
		inserts << {:parent=>"GLASS",:child=>"Consolidated (Ruba Rombic)"}
		inserts << {:parent=>"GLASS",:child=>"Crackle"}
		inserts << {:parent=>"GLASS",:child=>"Cranberry Opalescent"}
		inserts << {:parent=>"GLASS",:child=>"Crystal"}
		inserts << {:parent=>"GLASS",:child=>"Curved"}
		inserts << {:parent=>"GLASS",:child=>"Custard"}
		inserts << {:parent=>"GLASS",:child=>"Cut"}
		inserts << {:parent=>"GLASS",:child=>"Czechoslovakian"}
		inserts << {:parent=>"GLASS",:child=>"Degenhart"}
		inserts << {:parent=>"GLASS",:child=>"Depression"}
		inserts << {:parent=>"GLASS",:child=>"Domes"}
		inserts << {:parent=>"GLASS",:child=>"Duncan & Miller"}
		inserts << {:parent=>"GLASS",:child=>"Durand"}
		inserts << {:parent=>"GLASS",:child=>"Early American"}
		inserts << {:parent=>"GLASS",:child=>"Elegant"}
		inserts << {:parent=>"GLASS",:child=>"European"}
		inserts << {:parent=>"GLASS",:child=>"Fenton"}
		inserts << {:parent=>"GLASS",:child=>"Findlay"}
		inserts << {:parent=>"GLASS",:child=>"Fire-King"}
		inserts << {:parent=>"GLASS",:child=>"Fostoria"}
		inserts << {:parent=>"GLASS",:child=>"Fry"}
		inserts << {:parent=>"GLASS",:child=>"Gay Fad Studios"}
		inserts << {:parent=>"GLASS",:child=>"Goofus"}
		inserts << {:parent=>"GLASS",:child=>"Gorham"}
		inserts << {:parent=>"GLASS",:child=>"Greentown"}
		inserts << {:parent=>"GLASS",:child=>"Hazel-Atlas"}
		inserts << {:parent=>"GLASS",:child=>"Heisey"}
		inserts << {:parent=>"GLASS",:child=>"Higgins"}
		inserts << {:parent=>"GLASS",:child=>"Imperial"}
		inserts << {:parent=>"GLASS",:child=>"Imperial (Candlewick Pattern)"}
		inserts << {:parent=>"GLASS",:child=>"Indiana Glass Co."}
		inserts << {:parent=>"GLASS",:child=>"Italian"}
		inserts << {:parent=>"GLASS",:child=>"Jack-in-the-Pulpit"}
		inserts << {:parent=>"GLASS",:child=>"Kosta Boda"}
		inserts << {:parent=>"GLASS",:child=>"Lalique"}
		inserts << {:parent=>"GLASS",:child=>"Lalique Mascot"}
		inserts << {:parent=>"GLASS",:child=>"Lenox"}
		inserts << {:parent=>"GLASS",:child=>"Loetz"}
		inserts << {:parent=>"GLASS",:child=>"Lotton"}
		inserts << {:parent=>"GLASS",:child=>"Mercury"}
		inserts << {:parent=>"GLASS",:child=>"Milk"}
		inserts << {:parent=>"GLASS",:child=>"Moser"}
		inserts << {:parent=>"GLASS",:child=>"Mount Washington"}
		inserts << {:parent=>"GLASS",:child=>"Old Morgantown"}
		inserts << {:parent=>"GLASS",:child=>"Orrefors"}
		inserts << {:parent=>"GLASS",:child=>"Overshot"}
		inserts << {:parent=>"GLASS",:child=>"Paden City"}
		inserts << {:parent=>"GLASS",:child=>"Pairpoint"}
		inserts << {:parent=>"GLASS",:child=>"Pattern"}
		inserts << {:parent=>"GLASS",:child=>"Pattern (Moon & Star)"}
		inserts << {:parent=>"GLASS",:child=>"Peachblow"}
		inserts << {:parent=>"GLASS",:child=>"PHOENIX"}
		inserts << {:parent=>"GLASS",:child=>"Post-WWII"}
		inserts << {:parent=>"GLASS",:child=>"Pressed"}
		inserts << {:parent=>"GLASS",:child=>"Pyrex"}
		inserts << {:parent=>"GLASS",:child=>"Reed & Barton"}
		inserts << {:parent=>"GLASS",:child=>"Riverside"}
		inserts << {:parent=>"GLASS",:child=>"Rose Bowls"}
		inserts << {:parent=>"GLASS",:child=>"Sandwich"}
		inserts << {:parent=>"GLASS",:child=>"Satava"}
		inserts << {:parent=>"GLASS",:child=>"Scandinavian Art"}
		inserts << {:parent=>"GLASS",:child=>"Shoes"}
		inserts << {:parent=>"GLASS",:child=>"Smallhouse"}
		inserts << {:parent=>"GLASS",:child=>"Steuben"}
		inserts << {:parent=>"GLASS",:child=>"Stretch"}
		inserts << {:parent=>"GLASS",:child=>"Studio (Contemporary)"}
		inserts << {:parent=>"GLASS",:child=>"Sulphides-Cameos In Glass"}
		inserts << {:parent=>"GLASS",:child=>"Tiffin"}
		inserts << {:parent=>"GLASS",:child=>"Val St. Lambert"}
		inserts << {:parent=>"GLASS",:child=>"Vaseline"}
		inserts << {:parent=>"GLASS",:child=>"Verlys"}
		inserts << {:parent=>"GLASS",:child=>"Waterford"}
		inserts << {:parent=>"GLASS",:child=>"Wave Crest"}
		inserts << {:parent=>"GLASS",:child=>"Westmoreland"}
		inserts << {:parent=>"GLASS",:child=>"Wheaton"}
		inserts << {:parent=>"GLASS",:child=>"Whimsies"}
		inserts << {:parent=>"GLASS",:child=>"Whimsies (Pens)"}
		inserts << {:parent=>"GLASS",:child=>"Whitefriars"}
		inserts << {:parent=>"GLASS",:child=>"Wilkerson Glass Company"}
		inserts << {:parent=>"GLASS",:child=>""}
		inserts << {:parent=>"GLASS KNIVES",:child=>""}
		inserts << {:parent=>"GLASSES",:child=>"Drinking"}
		inserts << {:parent=>"GLASSES",:child=>"Shot"}
		inserts << {:parent=>"GLASSES",:child=>"Spirit (Advertising)"}
		inserts << {:parent=>"GLOBES",:child=>""}
		inserts << {:parent=>"GNOMES",:child=>""}
		inserts << {:parent=>"GOLD",:child=>"Scrap"}
		inserts << {:parent=>"GOLD",:child=>""}
		inserts << {:parent=>"GOLD RUSH MEMORABILIA",:child=>""}
		inserts << {:parent=>"GOOD LUCK ITEMS",:child=>""}
		inserts << {:parent=>"GRANITEWARE",:child=>""}
		inserts << {:parent=>"GRAVESTONES",:child=>""}
		inserts << {:parent=>"GUINNESS WORLD RECORDS",:child=>""}
		inserts << {:parent=>"HAIRWORK",:child=>""}
		inserts << {:parent=>"HALLOWEEN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"HAMBURGERS",:child=>""}
		inserts << {:parent=>"HARDWARE",:child=>""}
		inserts << {:parent=>"HEALTH & BEAUTY",:child=>"Devices To Restore"}
		inserts << {:parent=>"HERALDRY",:child=>""}
		inserts << {:parent=>"HERITAGE RESOURCES",:child=>"National Park Service"}
		inserts << {:parent=>"HERITAGE RESOURCES",:child=>"State Archaeologists"}
		inserts << {:parent=>"HERITAGE RESOURCES",:child=>""}
		inserts << {:parent=>"HI-FI EQUIPMENT",:child=>""}
		inserts << {:parent=>"HIGHWAY COLLECTIBLES",:child=>"Decals"}
		inserts << {:parent=>"HIGHWAY COLLECTIBLES",:child=>"Lincoln Highway"}
		inserts << {:parent=>"HIGHWAY COLLECTIBLES",:child=>"Route 66 Items"}
		inserts << {:parent=>"HIGHWAY COLLECTIBLES",:child=>"Signs & Traffic Devices"}
		inserts << {:parent=>"HIGHWAY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"HISTORICAL AMERICANA",:child=>""}
		inserts << {:parent=>"HITCHING POSTS",:child=>""}
		inserts << {:parent=>"HOBOS",:child=>""}
		inserts << {:parent=>"HOLIDAY COLLECTIBLES",:child=>"Easter"}
		inserts << {:parent=>"HOLIDAY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"HOLT HOWARD",:child=>"Pixieware"}
		inserts << {:parent=>"HOLT HOWARD",:child=>""}
		inserts << {:parent=>"HORNS & WHISTLES",:child=>"Sirens"}
		inserts << {:parent=>"HORNS & WHISTLES",:child=>""}
		inserts << {:parent=>"HORROR",:child=>"Dracula"}
		inserts << {:parent=>"HORROR",:child=>"Frankenstein"}
		inserts << {:parent=>"HORROR",:child=>"Wolfman"}
		inserts << {:parent=>"HORSE-DRAWN VEHICLES",:child=>"Carriages"}
		inserts << {:parent=>"HORSE-DRAWN VEHICLES",:child=>""}
		inserts << {:parent=>"HORSES",:child=>""}
		inserts << {:parent=>"HOTEL COLLECTIBLES",:child=>"Hyatt Hotels"}
		inserts << {:parent=>"HOTEL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ICE CREAM COLLECTIBLES",:child=>"Dippers"}
		inserts << {:parent=>"ICE CREAM COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ICE INDUSTRY",:child=>""}
		inserts << {:parent=>"ICONS",:child=>""}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Arthur Szyk"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Bessie Pease Gutmann"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Coles Phillips"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Fern Bisel Peat"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"J.C. & F.X. Leyendecker"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Kate Greenaway"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Maxfield Parrish"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Norman Rockwell"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Palmer Cox"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"Philip Boileau"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"R. Atkinson Fox"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>"William Henry Chandler"}
		inserts << {:parent=>"ILLUSTRATORS",:child=>""}
		inserts << {:parent=>"IMMIGRATION",:child=>"Canadian"}
		inserts << {:parent=>"IMMIGRATION",:child=>""}
		inserts << {:parent=>"INCOLAY",:child=>""}
		inserts << {:parent=>"INDIAN WARS ITEMS",:child=>""}
		inserts << {:parent=>"INDONESIA",:child=>"Borneo"}
		inserts << {:parent=>"INDONESIA",:child=>""}
		inserts << {:parent=>"INDUSTRY RELATED ITEMS",:child=>""}
		inserts << {:parent=>"INFANT FEEDERS",:child=>""}
		inserts << {:parent=>"INKWELLS & INKSTANDS",:child=>""}
		inserts << {:parent=>"INSECTS",:child=>"Butterflies"}
		inserts << {:parent=>"INSECTS",:child=>"Cockroaches"}
		inserts << {:parent=>"INSECTS",:child=>"Mosquitoes"}
		inserts << {:parent=>"INSECTS",:child=>"Ticks"}
		inserts << {:parent=>"INSECTS",:child=>""}
		inserts << {:parent=>"INSTRUMENTS & DEVICES",:child=>"Compasses"}
		inserts << {:parent=>"INSTRUMENTS & DEVICES",:child=>"Egg Related"}
		inserts << {:parent=>"INSTRUMENTS & DEVICES",:child=>"Scientific"}
		inserts << {:parent=>"INSULATORS",:child=>"Foreign"}
		inserts << {:parent=>"INSULATORS",:child=>"Porcelain"}
		inserts << {:parent=>"INSULATORS",:child=>""}
		inserts << {:parent=>"INSURANCE MEMORABILIA",:child=>""}
		inserts << {:parent=>"INUIT & NORTHWEST COAST NATIVES",:child=>""}
		inserts << {:parent=>"IRONS",:child=>"Pressing"}
		inserts << {:parent=>"IVER JOHNSON ARMS & CYCLE WORKS",:child=>""}
		inserts << {:parent=>"IVOREX PLAQUES",:child=>""}
		inserts << {:parent=>"IVORY",:child=>""}
		inserts << {:parent=>"JELL-O MEMORABILIA",:child=>""}
		inserts << {:parent=>"JELLY CONTAINERS",:child=>""}
		inserts << {:parent=>"JOHN ROGERS STATUARY",:child=>""}
		inserts << {:parent=>"JOHNSON SMITH CO.",:child=>""}
		inserts << {:parent=>"JUDAICA",:child=>"Holocaust"}
		inserts << {:parent=>"JUDAICA",:child=>""}
		inserts << {:parent=>"KALEIDOSCOPES",:child=>""}
		inserts << {:parent=>"KEEN KUTTER (SIMMONS HARDWARE)",:child=>""}
		inserts << {:parent=>"KEY CHAINS",:child=>"B.F. Goodrich"}
		inserts << {:parent=>"KEY CHAINS",:child=>"License Plates"}
		inserts << {:parent=>"KEY CHAINS",:child=>""}
		inserts << {:parent=>"KEYS",:child=>""}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Butter Churns"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Egg Coddlers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Egg Separators"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Egg Timers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Eggbeaters"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Flour Sifters"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Frisbie Pie Pans"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Ice Shavers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Lemon Squeezers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Mangles"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Mixers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Nutmeg Grinders"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Pie Crimpers/Jaggers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Pot Scrubbers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Reamers"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Rolling Pins"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Trivets"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>"Wire Ware"}
		inserts << {:parent=>"KITCHEN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"KITES",:child=>""}
		inserts << {:parent=>"KITS",:child=>"Figures"}
		inserts << {:parent=>"KITS",:child=>"Plastic"}
		inserts << {:parent=>"KITS",:child=>"Plastic (Airfix)"}
		inserts << {:parent=>"KITS",:child=>"Plastic (Aurora)"}
		inserts << {:parent=>"KITS",:child=>""}
		inserts << {:parent=>"KNIFE RESTS",:child=>""}
		inserts << {:parent=>"KNIVES",:child=>"Bowie"}
		inserts << {:parent=>"KNIVES",:child=>"Buck"}
		inserts << {:parent=>"KNIVES",:child=>"Case"}
		inserts << {:parent=>"KNIVES",:child=>"Military"}
		inserts << {:parent=>"KNIVES",:child=>"Pocket"}
		inserts << {:parent=>"KNIVES",:child=>"Queen"}
		inserts << {:parent=>"KNIVES",:child=>"Randall"}
		inserts << {:parent=>"KNIVES",:child=>"Sheaths"}
		inserts << {:parent=>"KNIVES",:child=>"Switchblade/Automatic"}
		inserts << {:parent=>"KNIVES",:child=>""}
		inserts << {:parent=>"LABELS",:child=>"Cheese"}
		inserts << {:parent=>"LABELS",:child=>"Fruit Crate"}
		inserts << {:parent=>"LABELS",:child=>"Luggage"}
		inserts << {:parent=>"LABELS",:child=>""}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Aladdin"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Angle"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Bellova"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Candlesticks"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Carriage"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Chandeliers"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Coleman"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Emeralite"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Gas"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Kerosene"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Lanterns"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Lava Lamps"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Miniature"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Moss Manufacturing"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Motion"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Neon"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Shades"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Student"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"Tiffany/Handel/Pairpoint"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>"TV Lamps"}
		inserts << {:parent=>"LAMPS & LIGHTING",:child=>""}
		inserts << {:parent=>"LAPIDARY",:child=>"Gem Art"}
		inserts << {:parent=>"LAPIDARY",:child=>""}
		inserts << {:parent=>"LARKIN SOAP COMPANY",:child=>""}
		inserts << {:parent=>"LAW ENFORCEMENT MEMORABILIA",:child=>"FBI"}
		inserts << {:parent=>"LAW ENFORCEMENT MEMORABILIA",:child=>"Police & Sheriff"}
		inserts << {:parent=>"LAW ENFORCEMENT MEMORABILIA",:child=>""}
		inserts << {:parent=>"LAWNMOWERS",:child=>""}
		inserts << {:parent=>"LEATHER",:child=>""}
		inserts << {:parent=>"LICENSE PLATES",:child=>"Automobile"}
		inserts << {:parent=>"LICENSE PLATES",:child=>"Automobile (Delaware)"}
		inserts << {:parent=>"LICENSE PLATES",:child=>"Automobile (Porcelain)"}
		inserts << {:parent=>"LICENSE PLATES",:child=>"Government"}
		inserts << {:parent=>"LICENSE PLATES",:child=>""}
		inserts << {:parent=>"LICENSES",:child=>"Animal"}
		inserts << {:parent=>"LICENSES",:child=>"Dog"}
		inserts << {:parent=>"LICENSES",:child=>"Hunting & Fishing"}
		inserts << {:parent=>"LICENSES",:child=>""}
		inserts << {:parent=>"LIDS",:child=>""}
		inserts << {:parent=>"LIGHT BULBS",:child=>""}
		inserts << {:parent=>"LIGHTERS",:child=>"Zippo"}
		inserts << {:parent=>"LIGHTERS",:child=>""}
		inserts << {:parent=>"LIGHTNING PROTECTION COLLECTIBLES",:child=>""}
		inserts << {:parent=>"LITHOPHANES",:child=>""}
		inserts << {:parent=>"LIVESTOCK",:child=>""}
		inserts << {:parent=>"LIVING HISTORY",:child=>"Civil War Reenactors"}
		inserts << {:parent=>"LIVING HISTORY",:child=>"WWII Reenactors"}
		inserts << {:parent=>"LIVING HISTORY",:child=>""}
		inserts << {:parent=>"LOCKS",:child=>""}
		inserts << {:parent=>"LOGGING RELATED ITEMS",:child=>""}
		inserts << {:parent=>"LOTTERY TICKETS",:child=>"Instant (Used)"}
		inserts << {:parent=>"LUGGAGE",:child=>"Louis Vuitton"}
		inserts << {:parent=>"LUGGAGE",:child=>""}
		inserts << {:parent=>"LUNCH BOXES",:child=>""}
		inserts << {:parent=>"M&M/MARS CANDY",:child=>""}
		inserts << {:parent=>"MACERATED CURRENCY ITEMS",:child=>""}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>"Catalogs"}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>"Construction"}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>"Restaurant China"}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>"Road Making"}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>"Road Rollers"}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>"Woodworking"}
		inserts << {:parent=>"MACHINERY & EQUIPMENT",:child=>""}
		inserts << {:parent=>"MAGAZINES",:child=>"Automotive"}
		inserts << {:parent=>"MAGAZINES",:child=>"Covers & Tear Sheets"}
		inserts << {:parent=>"MAGAZINES",:child=>"Life"}
		inserts << {:parent=>"MAGAZINES",:child=>"MAD"}
		inserts << {:parent=>"MAGAZINES",:child=>"Men's"}
		inserts << {:parent=>"MAGAZINES",:child=>"Men's (Playboy)"}
		inserts << {:parent=>"MAGAZINES",:child=>"Monster"}
		inserts << {:parent=>"MAGAZINES",:child=>"Movie"}
		inserts << {:parent=>"MAGAZINES",:child=>"National Geographic"}
		inserts << {:parent=>"MAGAZINES",:child=>"Office Related"}
		inserts << {:parent=>"MAGAZINES",:child=>"Puck & Judge"}
		inserts << {:parent=>"MAGAZINES",:child=>"Pulp"}
		inserts << {:parent=>"MAGAZINES",:child=>"Pulp (Doc Savage)"}
		inserts << {:parent=>"MAGAZINES",:child=>"Scandal/Cult/R 'N' R"}
		inserts << {:parent=>"MAGAZINES",:child=>"Sporting"}
		inserts << {:parent=>"MAGAZINES",:child=>"Toy"}
		inserts << {:parent=>"MAGAZINES",:child=>"TV Guide"}
		inserts << {:parent=>"MAGAZINES",:child=>""}
		inserts << {:parent=>"MAGIC LANTERNS & SLIDES",:child=>""}
		inserts << {:parent=>"MAGICIANS PARAPHERNALIA",:child=>"Houdini"}
		inserts << {:parent=>"MAGICIANS PARAPHERNALIA",:child=>""}
		inserts << {:parent=>"MAILBOXES",:child=>""}
		inserts << {:parent=>"MALAYSIA",:child=>"Borneo"}
		inserts << {:parent=>"MANUSCRIPTS",:child=>"Music Related"}
		inserts << {:parent=>"MANUSCRIPTS",:child=>"Pennsylvania"}
		inserts << {:parent=>"MANUSCRIPTS",:child=>""}
		inserts << {:parent=>"MAPS & CHARTS",:child=>"Folding"}
		inserts << {:parent=>"MAPS & CHARTS",:child=>""}
		inserts << {:parent=>"MARBLE & STONE",:child=>""}
		inserts << {:parent=>"MARBLES",:child=>""}
		inserts << {:parent=>"MARDI GRAS ITEMS",:child=>"New Orleans"}
		inserts << {:parent=>"MARDI GRAS ITEMS",:child=>""}
		inserts << {:parent=>"MARINE CORPS ITEMS",:child=>""}
		inserts << {:parent=>"MATCH SAFES",:child=>""}
		inserts << {:parent=>"MATCHBOXES & LABELS",:child=>""}
		inserts << {:parent=>"MATCHCOVERS",:child=>"Casino"}
		inserts << {:parent=>"MATCHCOVERS",:child=>""}
		inserts << {:parent=>"MAYTAG",:child=>""}
		inserts << {:parent=>"MEDALLIC SCULPTURES",:child=>""}
		inserts << {:parent=>"MEDALS, ORDERS & DECORATIONS",:child=>"Medal of Honor"}
		inserts << {:parent=>"MEDALS, ORDERS & DECORATIONS",:child=>"Purple Heart"}
		inserts << {:parent=>"MEDALS, ORDERS & DECORATIONS",:child=>""}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Civil War"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Dental"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Dose Glasses"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Drug Store"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Eli Lilly & Co."}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Hearing Aids"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Military Related"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Patent Medicines"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Phrenology Busts"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Quackery"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>"Stethoscopes"}
		inserts << {:parent=>"MEDICAL, DENTAL & PHARMACEUTICAL",:child=>""}
		inserts << {:parent=>"MENUS",:child=>""}
		inserts << {:parent=>"MERMAIDS",:child=>""}
		inserts << {:parent=>"METAL ITEMS",:child=>"Heintz Art Metal"}
		inserts << {:parent=>"METAL ITEMS",:child=>"Old Hall"}
		inserts << {:parent=>"METAL ITEMS",:child=>""}
		inserts << {:parent=>"MICROSCOPES",:child=>""}
		inserts << {:parent=>"MILITARIA",:child=>"Anti-Axis"}
		inserts << {:parent=>"MILITARIA",:child=>"British"}
		inserts << {:parent=>"MILITARIA",:child=>"Decals"}
		inserts << {:parent=>"MILITARIA",:child=>"German"}
		inserts << {:parent=>"MILITARIA",:child=>"Helmets"}
		inserts << {:parent=>"MILITARIA",:child=>"Insignia"}
		inserts << {:parent=>"MILITARIA",:child=>"Insignia (British)"}
		inserts << {:parent=>"MILITARIA",:child=>"Italian"}
		inserts << {:parent=>"MILITARIA",:child=>"Manuals"}
		inserts << {:parent=>"MILITARIA",:child=>"Medals"}
		inserts << {:parent=>"MILITARIA",:child=>"Nuclear"}
		inserts << {:parent=>"MILITARIA",:child=>"Polish"}
		inserts << {:parent=>"MILITARIA",:child=>"Russian"}
		inserts << {:parent=>"MILITARIA",:child=>"Silk Embroideries"}
		inserts << {:parent=>"MILITARIA",:child=>"Spanish-American War"}
		inserts << {:parent=>"MILITARIA",:child=>"Stickers"}
		inserts << {:parent=>"MILITARIA",:child=>"U-Boats"}
		inserts << {:parent=>"MILITARIA",:child=>"Uniforms"}
		inserts << {:parent=>"MILITARIA",:child=>"Vehicles"}
		inserts << {:parent=>"MILITARIA",:child=>"Vehicles (Armored)"}
		inserts << {:parent=>"MILITARIA",:child=>"Vietnam Items"}
		inserts << {:parent=>"MILITARIA",:child=>"WWI Items"}
		inserts << {:parent=>"MILITARIA",:child=>"WWI Items (Photographs)"}
		inserts << {:parent=>"MILITARIA",:child=>"WWI Items (Posters)"}
		inserts << {:parent=>"MILITARIA",:child=>"WWII Items"}
		inserts << {:parent=>"MILITARIA",:child=>"WWII Items (Homefront)"}
		inserts << {:parent=>"MILITARIA",:child=>"WWII Items (Paratroop)"}
		inserts << {:parent=>"MILITARIA",:child=>"WWII Items (Photographs)"}
		inserts << {:parent=>"MILITARIA",:child=>"WWII Items (Posters)"}
		inserts << {:parent=>"MILITARIA",:child=>"WWII Items (Rosie the Riveter)"}
		inserts << {:parent=>"MILITARIA",:child=>""}
		inserts << {:parent=>"MILITARY HISTORY",:child=>"Australia"}
		inserts << {:parent=>"MILITARY HISTORY",:child=>"British"}
		inserts << {:parent=>"MILITARY HISTORY",:child=>"Canadian"}
		inserts << {:parent=>"MILITARY HISTORY",:child=>"Cavalry"}
		inserts << {:parent=>"MILITARY HISTORY",:child=>"Unit Histories"}
		inserts << {:parent=>"MILITARY HISTORY",:child=>""}
		inserts << {:parent=>"MILLING",:child=>"Bobbins & Spools"}
		inserts << {:parent=>"MILLING",:child=>""}
		inserts << {:parent=>"MINERAL SPECIMENS",:child=>"Fluorescent"}
		inserts << {:parent=>"MINERAL SPECIMENS",:child=>"Meteorites"}
		inserts << {:parent=>"MINERAL SPECIMENS",:child=>""}
		inserts << {:parent=>"MINIATURES",:child=>"Dishes"}
		inserts << {:parent=>"MINIATURES",:child=>"Military"}
		inserts << {:parent=>"MINIATURES",:child=>""}
		inserts << {:parent=>"MINING RELATED ITEMS",:child=>"Cap Tins"}
		inserts << {:parent=>"MINING RELATED ITEMS",:child=>"Coal Mining"}
		inserts << {:parent=>"MINING RELATED ITEMS",:child=>"Colorado"}
		inserts << {:parent=>"MINING RELATED ITEMS",:child=>"Lamps"}
		inserts << {:parent=>"MINING RELATED ITEMS",:child=>""}
		inserts << {:parent=>"MOBILE HOMES",:child=>""}
		inserts << {:parent=>"MODELS",:child=>"Aircraft"}
		inserts << {:parent=>"MODELS",:child=>"Aircraft (Flying)"}
		inserts << {:parent=>"MODELS",:child=>"Bus"}
		inserts << {:parent=>"MODELS",:child=>"Cars"}
		inserts << {:parent=>"MODELS",:child=>"Engines"}
		inserts << {:parent=>"MODELS",:child=>"Trucks & Equipment (Winross)"}
		inserts << {:parent=>"MODELS",:child=>""}
		inserts << {:parent=>"MODERNISM",:child=>"Heywood-Wakefield"}
		inserts << {:parent=>"MODERNISM",:child=>"Peter Max"}
		inserts << {:parent=>"MODERNISM",:child=>""}
		inserts << {:parent=>"MOLDS",:child=>"Butter"}
		inserts << {:parent=>"MOLDS",:child=>"Candy"}
		inserts << {:parent=>"MOLDS",:child=>"Chocolate"}
		inserts << {:parent=>"MOLDS",:child=>"Ice Cream"}
		inserts << {:parent=>"MORBID & ODD ITEMS",:child=>""}
		inserts << {:parent=>"MORMON ITEMS",:child=>""}
		inserts << {:parent=>"MOTOR SCOOTERS",:child=>"Cushman"}
		inserts << {:parent=>"MOTOR SCOOTERS",:child=>""}
		inserts << {:parent=>"MOTORCYCLES",:child=>"BMW"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"British"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"British (Triumph)"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Harley-Davidson"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Indian"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Japanese"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Moto Guzzi"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Norton"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Sidecars"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Suzuki"}
		inserts << {:parent=>"MOTORCYCLES",:child=>"Whizzer"}
		inserts << {:parent=>"MOTORCYCLES",:child=>""}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Gone With the Wind"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Movie Posters"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Movie Posters (Black)"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Movie Posters (Silent Movies)"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Oscars"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Scripts"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Silent Films"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Star Wars"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Star Wars (Art)"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Trade Publications"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Westerns"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>"Westerns (Italian)"}
		inserts << {:parent=>"MOVIE MEMORABILIA",:child=>""}
		inserts << {:parent=>"MOVING & STORAGE ASSOCIATIONS",:child=>""}
		inserts << {:parent=>"MUSIC",:child=>"8-Track Tapes"}
		inserts << {:parent=>"MUSIC",:child=>"Big Band"}
		inserts << {:parent=>"MUSIC",:child=>"Country"}
		inserts << {:parent=>"MUSIC",:child=>"Dixieland & Ragtime"}
		inserts << {:parent=>"MUSIC",:child=>"Greek"}
		inserts << {:parent=>"MUSIC",:child=>"Jazz & Blues"}
		inserts << {:parent=>"MUSIC",:child=>"Rock 'N' Roll"}
		inserts << {:parent=>"MUSIC",:child=>""}
		inserts << {:parent=>"MUSIC BOXES",:child=>"Birds & Bird Boxes (Singing)"}
		inserts << {:parent=>"MUSIC BOXES",:child=>"Cylinder"}
		inserts << {:parent=>"MUSIC BOXES",:child=>"Disc"}
		inserts << {:parent=>"MUSIC BOXES",:child=>"Scientific"}
		inserts << {:parent=>"MUSIC BOXES",:child=>""}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Accordions"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Drums"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Harmonicas"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Horns"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Horns (Brass)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Mechanical"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Mechanical (Band Organs)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Organ Grinders"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Organs"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Organs (Roller)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Organs (Theatre)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Pianos"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"Pianos (Player)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"String"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"String (Fretted)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"String (Guitars)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>"String (Violin Family)"}
		inserts << {:parent=>"MUSICAL INSTRUMENTS",:child=>""}
		inserts << {:parent=>"NAPKIN DOLLS",:child=>""}
		inserts << {:parent=>"NAPKIN RINGS (FIGURAL)",:child=>""}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Baskets"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Grenfell Labrador Industries"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Iroquois Beadwork"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Jewelry"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Kachina Dolls"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Navajo"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Navajo Rugs"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Pottery"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Skookum Dolls"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>"Totems"}
		inserts << {:parent=>"NATIVE AMERICAN",:child=>""}
		inserts << {:parent=>"NATIVE AMERICAN (MODERN)",:child=>""}
		inserts << {:parent=>"NATURAL HISTORY",:child=>""}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Diving"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Diving Helmets"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Figureheads & Ships Carvings"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Fishing Floats"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Lighthouses"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Marine Chronometers"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Merchant Marine"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Models (Sailboats)"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Models (Ship)"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Models (Ships-In-Bottles)"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Shipwrecks"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>"Telescopes"}
		inserts << {:parent=>"NAUTICAL ANTIQUES",:child=>""}
		inserts << {:parent=>"NEON",:child=>"Clocks"}
		inserts << {:parent=>"NEON",:child=>""}
		inserts << {:parent=>"NETSUKE",:child=>""}
		inserts << {:parent=>"NEWSBOY ITEMS",:child=>""}
		inserts << {:parent=>"NEWSPAPERS",:child=>"Harpers Weekly"}
		inserts << {:parent=>"NEWSPAPERS",:child=>""}
		inserts << {:parent=>"NURSES",:child=>""}
		inserts << {:parent=>"NUTCRACKERS",:child=>""}
		inserts << {:parent=>"OCCUPIED GERMANY",:child=>""}
		inserts << {:parent=>"OCCUPIED JAPAN",:child=>""}
		inserts << {:parent=>"OCEAN LINER COLLECTIBLES",:child=>""}
		inserts << {:parent=>"OFFICE EQUIPMENT",:child=>"Check Writers"}
		inserts << {:parent=>"OFFICE EQUIPMENT",:child=>""}
		inserts << {:parent=>"OIL DRILLING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"OINTMENT POTS & POT LIDS",:child=>""}
		inserts << {:parent=>"OLD SLEEPY EYE",:child=>""}
		inserts << {:parent=>"OLYMPIC GAMES COLLECTIBLES",:child=>""}
		inserts << {:parent=>"OPTICAL ITEMS",:child=>""}
		inserts << {:parent=>"ORIENTALIA",:child=>"Chinese Items"}
		inserts << {:parent=>"ORIENTALIA",:child=>"Japanese Items"}
		inserts << {:parent=>"ORIENTALIA",:child=>"Japanese Items (Kimono)"}
		inserts << {:parent=>"ORIENTALIA",:child=>"Japanese Items (Tsuba)"}
		inserts << {:parent=>"ORIENTALIA",:child=>"Korean Items"}
		inserts << {:parent=>"ORIENTALIA",:child=>"Lacquer"}
		inserts << {:parent=>"ORIENTALIA",:child=>"Near East Items"}
		inserts << {:parent=>"ORIENTALIA",:child=>"South & Southeast Asia"}
		inserts << {:parent=>"ORIENTALIA",:child=>""}
		inserts << {:parent=>"OUTLAWS & LAWMEN",:child=>""}
		inserts << {:parent=>"OYSTER RELATED COLLECTIBLES",:child=>""}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"California"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"Old Masters"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"Pastels"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"Portraits"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"Portraits (Miniature)"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"Reverse Painting On Glass"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>"Wyeth"}
		inserts << {:parent=>"PAINTINGS & DRAWINGS",:child=>""}
		inserts << {:parent=>"PAPER CLIPS",:child=>""}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Billheads"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Canadian"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Coloring Books"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Dance Cards"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Historical"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Illustrated"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Napkins"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Radio Related"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Southern"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>"Western"}
		inserts << {:parent=>"PAPER COLLECTIBLES",:child=>""}
		inserts << {:parent=>"PAPERWEIGHTS",:child=>"Advertising"}
		inserts << {:parent=>"PAPERWEIGHTS",:child=>"Cast Iron"}
		inserts << {:parent=>"PAPERWEIGHTS",:child=>""}
		inserts << {:parent=>"PAPERWEIGHTS (MODERN)",:child=>"Caithness"}
		inserts << {:parent=>"PAPERWEIGHTS (MODERN)",:child=>""}
		inserts << {:parent=>"PATENT MODELS",:child=>""}
		inserts << {:parent=>"PATENTS, TRADEMARKS & COPYRIGHTS",:child=>""}
		inserts << {:parent=>"PAWNBROKERS",:child=>""}
		inserts << {:parent=>"PEARL HARBOR",:child=>""}
		inserts << {:parent=>"PENCIL SHARPENERS",:child=>""}
		inserts << {:parent=>"PENCILS",:child=>""}
		inserts << {:parent=>"PENS",:child=>"Floaty"}
		inserts << {:parent=>"PENS",:child=>"Nibs"}
		inserts << {:parent=>"PENS",:child=>""}
		inserts << {:parent=>"PERAMBULATORS",:child=>""}
		inserts << {:parent=>"PERFORMING ARTS",:child=>"Dance"}
		inserts << {:parent=>"PERFORMING ARTS",:child=>"Gilbert & Sullivan"}
		inserts << {:parent=>"PERFORMING ARTS",:child=>"Opera Mementos"}
		inserts << {:parent=>"PERFORMING ARTS",:child=>"Theatrical Memorabilia"}
		inserts << {:parent=>"PERFORMING ARTS",:child=>""}
		inserts << {:parent=>"PERFUME LAMPS",:child=>""}
		inserts << {:parent=>"PERIODICALS",:child=>""}
		inserts << {:parent=>"PERSONALITIES",:child=>""}
		inserts << {:parent=>"PERSONALITIES (ARTISTS)",:child=>"Daniel Chester French"}
		inserts << {:parent=>"PERSONALITIES (ARTISTS)",:child=>"Edna Hibel"}
		inserts << {:parent=>"PERSONALITIES (ARTISTS)",:child=>"Grant Wood"}
		inserts << {:parent=>"PERSONALITIES (ARTISTS)",:child=>"Saint-Gaudens"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Abbott & Costello"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Al Jolson"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Billie Holiday"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"British"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Dean Martin"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Eddie Cantor"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Frank Sinatra"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Fred Astaire"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Jack Benny"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Lily Langtry"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Marx Brothers"}
		inserts << {:parent=>"PERSONALITIES (ENTERTAINERS)",:child=>"Sonja Henie"}
		inserts << {:parent=>"PERSONALITIES (FAMOUS)",:child=>"Charles A. Lindbergh"}
		inserts << {:parent=>"PERSONALITIES (FAMOUS)",:child=>"Dionne Quintuplets"}
		inserts << {:parent=>"PERSONALITIES (HISTORICAL)",:child=>"Abraham Lincoln"}
		inserts << {:parent=>"PERSONALITIES (HISTORICAL)",:child=>"George Washington"}
		inserts << {:parent=>"PERSONALITIES (HISTORICAL)",:child=>"Lafayette"}
		inserts << {:parent=>"PERSONALITIES (HISTORICAL)",:child=>"Napoleon"}
		inserts << {:parent=>"PERSONALITIES (HISTORICAL)",:child=>"Sir Winston S. Churchill"}
		inserts << {:parent=>"PERSONALITIES (INVENTORS)",:child=>"Thomas Alva Edison"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Charles Dickens"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Edgar Allan Poe"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Edgar Rice Burroughs"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Horatio Alger, Jr."}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Jack London"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Lewis Carroll"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Margaret Mitchell"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Mark Twain"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Sir Arthur Conan Doyle"}
		inserts << {:parent=>"PERSONALITIES (LITERARY)",:child=>"Zane Grey"}
		inserts << {:parent=>"PERSONALITIES (MILITARY)",:child=>"Audie Murphy"}
		inserts << {:parent=>"PERSONALITIES (MILITARY)",:child=>"Gen. George S. Patton"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Ava Gardner"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Bette Davis"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Clint Eastwood"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Frances Farmer"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Greta Garbo"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Jimmy Stewart"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"John Wayne"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Laurel & Hardy"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Margaret O'Brien"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Marilyn Monroe"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"Mary Miles Minter"}
		inserts << {:parent=>"PERSONALITIES (MOVIE STARS)",:child=>"W.C. Fields"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"Beatles"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"Def Leppard"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"Duran Duran"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"Elvis"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"KISS"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"Liberace"}
		inserts << {:parent=>"PERSONALITIES (MUSICIANS)",:child=>"Monkees"}
		inserts << {:parent=>"PEWTER",:child=>""}
		inserts << {:parent=>"PEZ",:child=>""}
		inserts << {:parent=>"PHILIPPINES",:child=>""}
		inserts << {:parent=>"PHONOGRAPHS",:child=>"Nipper"}
		inserts << {:parent=>"PHONOGRAPHS",:child=>""}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Ansel Adams"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Cases"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Celebrity"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Civil War"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Daguerreotypes"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Hand-Colored"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Mathew Brady"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Military"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>"Travel"}
		inserts << {:parent=>"PHOTOGRAPHS",:child=>""}
		inserts << {:parent=>"PHOTOGRAPHY",:child=>""}
		inserts << {:parent=>"PIANO ROLLS",:child=>""}
		inserts << {:parent=>"PIANOS",:child=>"Miniature"}
		inserts << {:parent=>"PICKLE CASTORS",:child=>""}
		inserts << {:parent=>"PIE BIRDS",:child=>""}
		inserts << {:parent=>"PINS",:child=>"Award"}
		inserts << {:parent=>"PINS",:child=>""}
		inserts << {:parent=>"PIN-UP ART",:child=>""}
		inserts << {:parent=>"PIPES",:child=>"Clay"}
		inserts << {:parent=>"PIPES",:child=>"Meerschaum"}
		inserts << {:parent=>"PIPES",:child=>"Pipe Cleaners"}
		inserts << {:parent=>"PIPES",:child=>""}
		inserts << {:parent=>"PLANNING ITEMS",:child=>""}
		inserts << {:parent=>"PLANTERS PEANUTS ITEMS",:child=>""}
		inserts << {:parent=>"PLASTIC COLLECTIBLES",:child=>""}
		inserts << {:parent=>"Plates",:child=>""}
		inserts << {:parent=>"PLATINUM",:child=>"Scrap"}
		inserts << {:parent=>"PLATINUM",:child=>""}
		inserts << {:parent=>"PLAYBOY ITEMS",:child=>"Autographs"}
		inserts << {:parent=>"PLAYBOY ITEMS",:child=>""}
		inserts << {:parent=>"PLAYING CARDS",:child=>""}
		inserts << {:parent=>"PLUMBING",:child=>"Bathroom Antiques"}
		inserts << {:parent=>"PLUMBING",:child=>""}
		inserts << {:parent=>"POCKET MIRRORS",:child=>""}
		inserts << {:parent=>"POCKET-SIZE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Barack Obama"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Benjamin Harrison"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Bill Clinton"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Calvin Coolidge"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Canadian"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Dan Quayle"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Dwight D. Eisenhower"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Flashers (Political Collectibles)"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Franklin D. Roosevelt"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"George Bush"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"George Wallace"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Gerald R. Ford"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Harry S. Truman"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Herbert Hoover"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Jimmy Carter"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"John F. Kennedy"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"John Kerry"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Locals"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Lyndon Baines Johnson"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Republican"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Richard Nixon"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Ronald Reagan"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Theodore Roosevelt"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Third Party & Hopefuls"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Wendell L. Willkie"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>"Woodrow Wilson"}
		inserts << {:parent=>"POLITICAL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"POLYNESIAN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"POPCORN ITEMS",:child=>""}
		inserts << {:parent=>"POPULAR CULTURE",:child=>"Baby Boomer"}
		inserts << {:parent=>"POPULAR CULTURE",:child=>""}
		inserts << {:parent=>"POSTAL SERVICE ITEMS",:child=>"Military"}
		inserts << {:parent=>"POSTAL SERVICE ITEMS",:child=>"Virginia"}
		inserts << {:parent=>"POSTAL SERVICE ITEMS",:child=>""}
		inserts << {:parent=>"POSTCARDS",:child=>"Aviation Related"}
		inserts << {:parent=>"POSTCARDS",:child=>"Bank Related"}
		inserts << {:parent=>"POSTCARDS",:child=>"Foreign"}
		inserts << {:parent=>"POSTCARDS",:child=>"Mexican"}
		inserts << {:parent=>"POSTCARDS",:child=>"Phonograph Related"}
		inserts << {:parent=>"POSTCARDS",:child=>"Photo (Real)"}
		inserts << {:parent=>"POSTCARDS",:child=>"Photo (Real) Canadian"}
		inserts << {:parent=>"POSTCARDS",:child=>"Piano Related"}
		inserts << {:parent=>"POSTCARDS",:child=>"Post Office Related"}
		inserts << {:parent=>"POSTCARDS",:child=>"States"}
		inserts << {:parent=>"POSTCARDS",:child=>"States (Florida)"}
		inserts << {:parent=>"POSTCARDS",:child=>"States (Maryland)"}
		inserts << {:parent=>"POSTCARDS",:child=>"States (North Carolina)"}
		inserts << {:parent=>"POSTCARDS",:child=>"States (Pennsylvania)"}
		inserts << {:parent=>"POSTCARDS",:child=>"States (West Virginia)"}
		inserts << {:parent=>"POSTCARDS",:child=>""}
		inserts << {:parent=>"POSTER STAMPS",:child=>""}
		inserts << {:parent=>"POSTERS",:child=>"Music"}
		inserts << {:parent=>"POSTERS",:child=>"Polish"}
		inserts << {:parent=>"POSTERS",:child=>""}
		inserts << {:parent=>"POWDER HORNS",:child=>""}
		inserts << {:parent=>"PRE-COLUMBIAN",:child=>""}
		inserts << {:parent=>"PREHISTORIC ARTIFACTS",:child=>"Arrowheads & Points"}
		inserts << {:parent=>"PREHISTORIC ARTIFACTS",:child=>""}
		inserts << {:parent=>"PREMIUMS",:child=>"Cereal Box"}
		inserts << {:parent=>"PREMIUMS",:child=>"Comics"}
		inserts << {:parent=>"PREMIUMS",:child=>"Radio Show"}
		inserts << {:parent=>"PREMIUMS",:child=>"Rings"}
		inserts << {:parent=>"PREMIUMS",:child=>""}
		inserts << {:parent=>"PRINTING EQUIPMENT",:child=>"Type Founding Items"}
		inserts << {:parent=>"PRINTING EQUIPMENT",:child=>""}
		inserts << {:parent=>"PRINTS",:child=>"20th Century Prints (Early)"}
		inserts << {:parent=>"PRINTS",:child=>"Audubon"}
		inserts << {:parent=>"PRINTS",:child=>"Cupid"}
		inserts << {:parent=>"PRINTS",:child=>"Currier & Ives"}
		inserts << {:parent=>"PRINTS",:child=>"Dali"}
		inserts << {:parent=>"PRINTS",:child=>"French Boudoir"}
		inserts << {:parent=>"PRINTS",:child=>"Hirshfeld"}
		inserts << {:parent=>"PRINTS",:child=>"Icart"}
		inserts << {:parent=>"PRINTS",:child=>"Leroy Neiman"}
		inserts << {:parent=>"PRINTS",:child=>"Vanity Fair (Spy)"}
		inserts << {:parent=>"PRINTS",:child=>"Wallace Nutting"}
		inserts << {:parent=>"PRINTS",:child=>"Woodblock"}
		inserts << {:parent=>"PRINTS",:child=>"Woodblock (American)"}
		inserts << {:parent=>"PRINTS",:child=>"Woodblock (Jacoulet)"}
		inserts << {:parent=>"PRINTS",:child=>"Woodblock (Japanese)"}
		inserts << {:parent=>"PRINTS",:child=>""}
		inserts << {:parent=>"PRINTS (MODERN)",:child=>"Adolf Sehring"}
		inserts << {:parent=>"PRINTS (MODERN)",:child=>"Jody Bergsma"}
		inserts << {:parent=>"PRINTS (MODERN)",:child=>"Thomas Kinkade"}
		inserts << {:parent=>"PROHIBITION ITEMS",:child=>""}
		inserts << {:parent=>"PUPPETS",:child=>""}
		inserts << {:parent=>"PURSES",:child=>"Plastic"}
		inserts << {:parent=>"PURSES",:child=>"Whiting & Davis"}
		inserts << {:parent=>"PURSES",:child=>""}
		inserts << {:parent=>"PUZZLES",:child=>"Crosswords"}
		inserts << {:parent=>"PUZZLES",:child=>"Jigsaw"}
		inserts << {:parent=>"PUZZLES",:child=>"Jigsaw (Wood)"}
		inserts << {:parent=>"PUZZLES",:child=>"Mechanical"}
		inserts << {:parent=>"PUZZLES",:child=>"Mechanical (Rubik's Cubes)"}
		inserts << {:parent=>"PUZZLES",:child=>"Paper"}
		inserts << {:parent=>"PUZZLES",:child=>""}
		inserts << {:parent=>"PYROGRAPHY ITEMS",:child=>""}
		inserts << {:parent=>"QUILTS",:child=>"Miniature"}
		inserts << {:parent=>"QUILTS",:child=>""}
		inserts << {:parent=>"RACKS (DRYING)",:child=>""}
		inserts << {:parent=>"RADIO SHOWS",:child=>"Old Time"}
		inserts << {:parent=>"RADIO SHOWS",:child=>"Old Time (Lum 'n' Abner)"}
		inserts << {:parent=>"RADIO SHOWS",:child=>"Reference (Tiles)"}
		inserts << {:parent=>"RADIOS",:child=>"Art Deco"}
		inserts << {:parent=>"RADIOS",:child=>"Atwater Kent"}
		inserts << {:parent=>"RADIOS",:child=>"Maritime"}
		inserts << {:parent=>"RADIOS",:child=>"Military"}
		inserts << {:parent=>"RADIOS",:child=>"Speakers"}
		inserts << {:parent=>"RADIOS",:child=>"Transistor"}
		inserts << {:parent=>"RADIOS",:child=>"Vacuum Tubes For"}
		inserts << {:parent=>"RADIOS",:child=>""}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"B & O Items"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"China"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"Hat Badges"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"Paper Items"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"Passes"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"Playing Cards"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"Posters"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>"Timetables"}
		inserts << {:parent=>"RAILROAD COLLECTIBLES",:child=>""}
		inserts << {:parent=>"RAILROADS",:child=>"Flying Scotsman"}
		inserts << {:parent=>"RAILROADS",:child=>""}
		inserts << {:parent=>"RANGES",:child=>""}
		inserts << {:parent=>"RANSBURG",:child=>""}
		inserts << {:parent=>"RATIONING RELATED ITEMS",:child=>""}
		inserts << {:parent=>"RECORDED SOUND",:child=>""}
		inserts << {:parent=>"RECORDS",:child=>"Big Band"}
		inserts << {:parent=>"RECORDS",:child=>"Children's"}
		inserts << {:parent=>"RECORDS",:child=>"Cylinder Records"}
		inserts << {:parent=>"RECORDS",:child=>"Gospel"}
		inserts << {:parent=>"RECORDS",:child=>"Jazz & Blues"}
		inserts << {:parent=>"RECORDS",:child=>"Rock 'N' Roll"}
		inserts << {:parent=>"RECORDS",:child=>"Soundtracks"}
		inserts << {:parent=>"RECORDS",:child=>"Vogue Picture"}
		inserts << {:parent=>"RECORDS",:child=>""}
		inserts << {:parent=>"RED CROSS",:child=>""}
		inserts << {:parent=>"RELIGIOUS COLLECTIBLES",:child=>"Church Pews"}
		inserts << {:parent=>"RELIGIOUS COLLECTIBLES",:child=>"Holy Cards"}
		inserts << {:parent=>"RELIGIOUS COLLECTIBLES",:child=>"Rosaries"}
		inserts << {:parent=>"RELIGIOUS COLLECTIBLES",:child=>""}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Archival Supplies For"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Art"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Cane & Basketry"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Ceramics"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Furniture"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Furniture & Upholstery"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Furniture (Antique Only)"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Gilding"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Glass"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Ivory"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Mattresses"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Metal Items"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Mirrors"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Painted Finishes"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Paper Items"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Supplies For"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Textiles"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>"Woodworking"}
		inserts << {:parent=>"REPAIR/RESTORATION/CONSERVATION",:child=>""}
		inserts << {:parent=>"RESTAURANT COLLECTIBLES",:child=>"Big Boy"}
		inserts << {:parent=>"RESTAURANT COLLECTIBLES",:child=>"Howard Johnson's"}
		inserts << {:parent=>"RESTAURANT COLLECTIBLES",:child=>""}
		inserts << {:parent=>"RESTRAINT DEVICES",:child=>"Handcuffs & Leg Shackles"}
		inserts << {:parent=>"RESTRAINT DEVICES",:child=>""}
		inserts << {:parent=>"REVERE GIFTWARE",:child=>""}
		inserts << {:parent=>"REVOLUTIONARY WAR ITEMS",:child=>""}
		inserts << {:parent=>"RIDING TOYS",:child=>"Pedal Vehicles"}
		inserts << {:parent=>"RIDING TOYS",:child=>"Rocking Horses"}
		inserts << {:parent=>"RIDING TOYS",:child=>"Sleds"}
		inserts << {:parent=>"RIDING TOYS",:child=>"Tricycles"}
		inserts << {:parent=>"RIDING TOYS",:child=>""}
		inserts << {:parent=>"RIPLEY'S BELIEVE IT OR NOT!",:child=>""}
		inserts << {:parent=>"ROBJ",:child=>""}
		inserts << {:parent=>"ROCK 'N' ROLL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ROLLER COASTERS",:child=>""}
		inserts << {:parent=>"ROSE O'NEILL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"ROYALTY COLLECTIBLES",:child=>"British"}
		inserts << {:parent=>"ROYALTY COLLECTIBLES",:child=>"Italian"}
		inserts << {:parent=>"ROYALTY COLLECTIBLES",:child=>"Princess Diana"}
		inserts << {:parent=>"ROYALTY COLLECTIBLES",:child=>"Russian"}
		inserts << {:parent=>"ROYALTY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"RUBBER ITEMS",:child=>"Clothing"}
		inserts << {:parent=>"RUBBER ITEMS",:child=>""}
		inserts << {:parent=>"RUGS",:child=>"Armenian"}
		inserts << {:parent=>"RUGS",:child=>"Hooked"}
		inserts << {:parent=>"RUGS",:child=>"Oriental"}
		inserts << {:parent=>"RUGS",:child=>"Oriental (Moroccan)"}
		inserts << {:parent=>"RUGS",:child=>""}
		inserts << {:parent=>"RUSSEL WRIGHT",:child=>""}
		inserts << {:parent=>"RUSSIAN ITEMS",:child=>"Enamels"}
		inserts << {:parent=>"RUSSIAN ITEMS",:child=>"Faberge"}
		inserts << {:parent=>"RUSSIAN ITEMS",:child=>"Lacquer Boxes"}
		inserts << {:parent=>"RUSSIAN ITEMS",:child=>"Samovars"}
		inserts << {:parent=>"RUSSIAN ITEMS",:child=>""}
		inserts << {:parent=>"SADDLES",:child=>"Miniature Liquor"}
		inserts << {:parent=>"SADDLES",:child=>"Side"}
		inserts << {:parent=>"SADDLES",:child=>""}
		inserts << {:parent=>"SAFES",:child=>""}
		inserts << {:parent=>"SALOON & BAR COLLECTIBLES",:child=>"Cocktail Shakers"}
		inserts << {:parent=>"SALOON & BAR COLLECTIBLES",:child=>"Corkstoppers"}
		inserts << {:parent=>"SALOON & BAR COLLECTIBLES",:child=>"Soda Syphons"}
		inserts << {:parent=>"SALOON & BAR COLLECTIBLES",:child=>"Swizzle Sticks"}
		inserts << {:parent=>"SALOON & BAR COLLECTIBLES",:child=>"Whiskey Pitchers"}
		inserts << {:parent=>"SALOON & BAR COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SALT & PEPPER SHAKERS",:child=>"Art Glass"}
		inserts << {:parent=>"SALT & PEPPER SHAKERS",:child=>"Novelty"}
		inserts << {:parent=>"SALT & PEPPER SHAKERS",:child=>""}
		inserts << {:parent=>"SALTS (OPEN)",:child=>""}
		inserts << {:parent=>"SALVATION ARMY ITEMS",:child=>""}
		inserts << {:parent=>"SAMPLERS",:child=>""}
		inserts << {:parent=>"SAND",:child=>""}
		inserts << {:parent=>"SCALES",:child=>"Penny"}
		inserts << {:parent=>"SCALES",:child=>"Toy"}
		inserts << {:parent=>"SCALES",:child=>""}
		inserts << {:parent=>"SCHOOL RELATED MEMORABILIA",:child=>""}
		inserts << {:parent=>"SCIENCE FICTION",:child=>"Costuming"}
		inserts << {:parent=>"SCIENCE FICTION",:child=>""}
		inserts << {:parent=>"SCOTTISH COLLECTIBLES",:child=>"Mauchline Ware"}
		inserts << {:parent=>"SCOTTISH COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SCRIMSHAW",:child=>""}
		inserts << {:parent=>"SCRIP",:child=>"Depression"}
		inserts << {:parent=>"SCRIP",:child=>""}
		inserts << {:parent=>"SCUBA",:child=>""}
		inserts << {:parent=>"SCULPTURES",:child=>"Erte"}
		inserts << {:parent=>"SCULPTURES",:child=>"Outdoor"}
		inserts << {:parent=>"SCULPTURES",:child=>""}
		inserts << {:parent=>"SEALS & STAMPS",:child=>"Wax"}
		inserts << {:parent=>"SEASHELLS",:child=>"Seashell Art"}
		inserts << {:parent=>"SEASHELLS",:child=>""}
		inserts << {:parent=>"SEEDS",:child=>""}
		inserts << {:parent=>"SEWING ITEMS & GO-WITHS",:child=>"Darners"}
		inserts << {:parent=>"SEWING ITEMS & GO-WITHS",:child=>"Machines"}
		inserts << {:parent=>"SEWING ITEMS & GO-WITHS",:child=>"Machines (Miniature & Toy)"}
		inserts << {:parent=>"SEWING ITEMS & GO-WITHS",:child=>"Thimbles"}
		inserts << {:parent=>"SEWING ITEMS & GO-WITHS",:child=>""}
		inserts << {:parent=>"SHAKER ITEMS",:child=>"Furniture"}
		inserts << {:parent=>"SHAKER ITEMS",:child=>""}
		inserts << {:parent=>"SHAVING COLLECTIBLES",:child=>"Razor Sharpeners"}
		inserts << {:parent=>"SHAVING COLLECTIBLES",:child=>"Razors"}
		inserts << {:parent=>"SHAVING COLLECTIBLES",:child=>"Razors (Safety)"}
		inserts << {:parent=>"SHAVING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SHAWLS",:child=>"Kashmir (Paisley)"}
		inserts << {:parent=>"SHEET MUSIC",:child=>"Rock 'N' Roll"}
		inserts << {:parent=>"SHEET MUSIC",:child=>""}
		inserts << {:parent=>"SHIP RELATED",:child=>"U.S.S. Constitution"}
		inserts << {:parent=>"SHIP RELATED",:child=>"Warships"}
		inserts << {:parent=>"SHIP RELATED",:child=>""}
		inserts << {:parent=>"SHIPPING",:child=>"Canadian"}
		inserts << {:parent=>"SHIPPING",:child=>"Chesapeake Bay Steamship"}
		inserts << {:parent=>"SHIPPING",:child=>"Great Lakes Related"}
		inserts << {:parent=>"SILHOUETTES",:child=>"Glass"}
		inserts << {:parent=>"SILHOUETTES",:child=>""}
		inserts << {:parent=>"SILVER",:child=>"Artbars"}
		inserts << {:parent=>"SILVER",:child=>"Baltimore"}
		inserts << {:parent=>"SILVER",:child=>"British"}
		inserts << {:parent=>"SILVER",:child=>"Chinese"}
		inserts << {:parent=>"SILVER",:child=>"Christofle"}
		inserts << {:parent=>"SILVER",:child=>"Georg Jensen"}
		inserts << {:parent=>"SILVER",:child=>"Gorham"}
		inserts << {:parent=>"SILVER",:child=>"International"}
		inserts << {:parent=>"SILVER",:child=>"Kirk Stieff"}
		inserts << {:parent=>"SILVER",:child=>"Lunt"}
		inserts << {:parent=>"SILVER",:child=>"Mexican"}
		inserts << {:parent=>"SILVER",:child=>"Mexican (Spratling)"}
		inserts << {:parent=>"SILVER",:child=>"Nielloware"}
		inserts << {:parent=>"SILVER",:child=>"Old Newbury Crafters"}
		inserts << {:parent=>"SILVER",:child=>"Oneida"}
		inserts << {:parent=>"SILVER",:child=>"Reed & Barton"}
		inserts << {:parent=>"SILVER",:child=>"Scrap"}
		inserts << {:parent=>"SILVER",:child=>"Towle"}
		inserts << {:parent=>"SILVER",:child=>"Wallace"}
		inserts << {:parent=>"SILVER",:child=>""}
		inserts << {:parent=>"SILVERPLATE",:child=>""}
		inserts << {:parent=>"SKELETONS",:child=>""}
		inserts << {:parent=>"SLAVERY ITEMS",:child=>"Slave Tags"}
		inserts << {:parent=>"SLAVERY ITEMS",:child=>""}
		inserts << {:parent=>"SLIDE RULES",:child=>""}
		inserts << {:parent=>"SMOKEY BEAR ITEMS",:child=>""}
		inserts << {:parent=>"SMOKING COLLECTIBLES",:child=>"Holders"}
		inserts << {:parent=>"SMOKING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SNOW BABIES",:child=>""}
		inserts << {:parent=>"SNOWDOMES",:child=>"Location"}
		inserts << {:parent=>"SNOWDOMES",:child=>""}
		inserts << {:parent=>"SNOWMOBILES",:child=>""}
		inserts << {:parent=>"SNUFF BOTTLES",:child=>""}
		inserts << {:parent=>"SOAP BOX DERBY",:child=>""}
		inserts << {:parent=>"SOCIAL CAUSES",:child=>"Beatnik"}
		inserts << {:parent=>"SOCIAL CAUSES",:child=>"Hippie Items"}
		inserts << {:parent=>"SOCIAL CAUSES",:child=>"Labor Unions"}
		inserts << {:parent=>"SOCIAL CAUSES",:child=>"Suffrage Items"}
		inserts << {:parent=>"SOCIAL CAUSES",:child=>""}
		inserts << {:parent=>"SODA FOUNTAIN COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Applied Color Label Bottles"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Coca-Cola"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Dr. Pepper"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Mountain Dew"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Moxie"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"No-Drip Bottle Protectors"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Orange Crush"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Pepsi-Cola"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Root Beer"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Root Beer (Hires)"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Soda Machines"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Soft Drink Cans"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Squirt"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Vernors Ginger Ale"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>"Whistle Soda"}
		inserts << {:parent=>"SOFT DRINK COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SOLDIERS",:child=>"Toy"}
		inserts << {:parent=>"SOLDIERS",:child=>"Toy (William Britain)"}
		inserts << {:parent=>"SOUVENIR & COMMEMORATIVE ITEMS",:child=>"Buildings"}
		inserts << {:parent=>"SOUVENIR & COMMEMORATIVE ITEMS",:child=>"Pillows"}
		inserts << {:parent=>"SOUVENIR & COMMEMORATIVE ITEMS",:child=>"Universal Theatres"}
		inserts << {:parent=>"SOUVENIR & COMMEMORATIVE ITEMS",:child=>""}
		inserts << {:parent=>"SPACE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SPINNING WHEELS",:child=>"Miniature"}
		inserts << {:parent=>"SPINNING WHEELS",:child=>""}
		inserts << {:parent=>"SPOON WARMERS",:child=>""}
		inserts << {:parent=>"SPOONS",:child=>"Souvenir"}
		inserts << {:parent=>"SPOONS",:child=>""}
		inserts << {:parent=>"SPORTING COLLECTIBLES",:child=>"Archery"}
		inserts << {:parent=>"SPORTING COLLECTIBLES",:child=>"Game Calls"}
		inserts << {:parent=>"SPORTING COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Autographs"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Baseball"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Baseball (Books about)"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Baseball Bats"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Baseball Cards"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Baseball Gloves"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Basketball"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Basketball Cards"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Bowling"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Boxing"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Cards"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Crew Rowing"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Cricket"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Curling"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Equipment"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Football"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Football (San Francisco 49ers)"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Football Cards"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Golf"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Golf Ball Markers"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Golf Balls"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Golf Clubs"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Harness Racing"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Hockey"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Hockey Cards"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Ice Skating"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Ice Skating (Ice Skates)"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Jerseys (Game Worn)"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Jewelry"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Lacrosse"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Little League"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Polo"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Rodeo"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Roller Skating"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Rugby"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Skateboards"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Snow Skiing"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Soccer"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Softball"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Squash"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Supplies For"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Surfing"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Swimming"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Table Tennis"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Tennis"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Tennis Rackets"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Thoroughbred Racing"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Track & Field"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Weightlifting"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>"Wrestling"}
		inserts << {:parent=>"SPORTS COLLECTIBLES",:child=>""}
		inserts << {:parent=>"SPORTS HISTORY",:child=>""}
		inserts << {:parent=>"SPY EQUIPMENT",:child=>""}
		inserts << {:parent=>"STAINED GLASS",:child=>""}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Africa"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Americana"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Archaeology"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Astronomy"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Australia"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Aviation Related"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Bicycle"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Biology"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Black Related"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Booklets"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"British"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Canadian"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Cancels"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Captain Cook"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Caribbean"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Chemistry & Physics"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Chess"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"China"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Christmas"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Christmas & Charity"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Christopher Columbus"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Commemorative"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Confederate"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Covers"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Covers (First Day)"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Covers (Naval)"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Duck/Fish & Game"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Earth"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Errors"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"European"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Fire Service Related"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"French"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Gay & Lesbian"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Gems & Jewelry"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"German"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Golf"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Graphics"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Hawaii"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Hong Kong"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Hungary"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"India"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Indiana"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Israel"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Japanese"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Journalists/Authors"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Liechtenstein"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Lighthouses"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Lions Clubs"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Malaria"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Maps & Charts"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Mathematics"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Medical"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Meter Stamps"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Mobile Post Office"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Napoleon"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Olympic Games Related"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Pacific Islands"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Panama"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Perfins"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Petroleum"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Pitcairn Island"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Polar"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Possessions of the U.S."}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Postal Stationery"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Postmarks"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Railroad"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Religion Related"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Revenue & Tax Stamps"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Rotary Club"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Russian"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Samoa"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Scandinavian"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Scouting"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Ships"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"South Africa"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Space"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Sports Related"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Stamps on Stamps"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Supplies For"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Topical"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Ukrainian"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"United Nations"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Windmills"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>"Wine"}
		inserts << {:parent=>"STAMP COLLECTING",:child=>""}
		inserts << {:parent=>"STANHOPES",:child=>""}
		inserts << {:parent=>"STAPLERS",:child=>""}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Alabama"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Alaska"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Arizona"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Arkansas"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"California"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Colorado"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Connecticut"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Delaware"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Florida"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Georgia"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Hawaii"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Hawaii (Hawaiian Shirts)"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Idaho"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Illinois"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Illinois (Chicago)"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Indiana"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Iowa"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Kansas"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Kentucky"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Louisiana"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Maine"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Maryland"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Massachusetts"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Michigan"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Minnesota"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Mississippi"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Missouri"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Montana"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Nebraska"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Nevada"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"New Hampshire"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"New Jersey"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"New Mexico"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"New York"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"New York (Brooklyn)"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"North Carolina"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"North Dakota"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Ohio"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Oklahoma"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Oregon"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Pennsylvania"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Pennsylvania German Heritage"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Rhode Island"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"South Carolina"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"South Dakota"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Tennessee"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Texas"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Utah"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Vermont"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Virginia"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Washington"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Washington DC"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"West Virginia"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Wisconsin"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>"Wyoming"}
		inserts << {:parent=>"STATE RELATED MEMORABILIA",:child=>""}
		inserts << {:parent=>"STATUE OF LIBERTY COLLECTIBLES",:child=>""}
		inserts << {:parent=>"STEAMBOAT COLLECTIBLES",:child=>""}
		inserts << {:parent=>"STEAM-OPERATED",:child=>"Models & Equipment"}
		inserts << {:parent=>"STEIFF",:child=>""}
		inserts << {:parent=>"STEINS",:child=>"Anheuser-Busch"}
		inserts << {:parent=>"STEINS",:child=>"Mettlach"}
		inserts << {:parent=>"STEINS",:child=>"Regimental"}
		inserts << {:parent=>"STEINS",:child=>""}
		inserts << {:parent=>"STEREO VIEWERS & STEREOVIEWS",:child=>"Alaska"}
		inserts << {:parent=>"STEREO VIEWERS & STEREOVIEWS",:child=>""}
		inserts << {:parent=>"STEVENGRAPHS",:child=>""}
		inserts << {:parent=>"STOCK TICKERS",:child=>""}
		inserts << {:parent=>"STOCKS & BONDS",:child=>"Financial History"}
		inserts << {:parent=>"STOCKS & BONDS",:child=>"Mining Related"}
		inserts << {:parent=>"STOCKS & BONDS",:child=>""}
		inserts << {:parent=>"STOVES",:child=>"Majolica"}
		inserts << {:parent=>"STOVES",:child=>"Salesman Samples & Toys"}
		inserts << {:parent=>"STOVES",:child=>""}
		inserts << {:parent=>"STREETCAR LINE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"STRING HOLDERS",:child=>""}
		inserts << {:parent=>"STRIPTEASE",:child=>""}
		inserts << {:parent=>"SUBWAY ITEMS",:child=>""}
		inserts << {:parent=>"SUGAR PACKETS",:child=>""}
		inserts << {:parent=>"SUGAR SHAKERS",:child=>"Art Glass"}
		inserts << {:parent=>"SUGAR SHAKERS",:child=>""}
		inserts << {:parent=>"SUPER HEROES",:child=>"Batman"}
		inserts << {:parent=>"SUPER HEROES",:child=>"Captain Midnight"}
		inserts << {:parent=>"SUPER HEROES",:child=>"Phantom"}
		inserts << {:parent=>"SUPER HEROES",:child=>"Superman"}
		inserts << {:parent=>"SUPER HEROES",:child=>"Wonder Woman"}
		inserts << {:parent=>"SURVEYING INSTRUMENTS",:child=>""}
		inserts << {:parent=>"SWANKYSWIGS",:child=>""}
		inserts << {:parent=>"SWORDS",:child=>""}
		inserts << {:parent=>"TABLEWARE",:child=>""}
		inserts << {:parent=>"TARGET SHOOTING MEMORABILIA",:child=>"Target Balls"}
		inserts << {:parent=>"TARGET SHOOTING MEMORABILIA",:child=>""}
		inserts << {:parent=>"TARGETS",:child=>"Shooting Gallery"}
		inserts << {:parent=>"TATTOO RELATED ITEMS",:child=>""}
		inserts << {:parent=>"TAXI RELATED COLLECTIBLES",:child=>""}
		inserts << {:parent=>"TEA RELATED COLLECTIBLES",:child=>"Tea Balls"}
		inserts << {:parent=>"TEA RELATED COLLECTIBLES",:child=>"Tea Strainers"}
		inserts << {:parent=>"TEA RELATED COLLECTIBLES",:child=>"Teapots"}
		inserts << {:parent=>"TEA RELATED COLLECTIBLES",:child=>"Teapots (Cardew)"}
		inserts << {:parent=>"TEA RELATED COLLECTIBLES",:child=>"Teapots (Carters)"}
		inserts << {:parent=>"TEA RELATED COLLECTIBLES",:child=>""}
		inserts << {:parent=>"TEDDY BEARS",:child=>""}
		inserts << {:parent=>"TEDDY BEARS (MODERN)",:child=>"Binkley"}
		inserts << {:parent=>"TEDDY BEARS (MODERN)",:child=>"Boyds"}
		inserts << {:parent=>"TEDDY BEARS (MODERN)",:child=>""}
		inserts << {:parent=>"TELEGRAMS",:child=>""}
		inserts << {:parent=>"TELEGRAPH ITEMS",:child=>"Telegraph Keys"}
		inserts << {:parent=>"TELEGRAPH ITEMS",:child=>""}
		inserts << {:parent=>"TELEPHONE COMPANY ITEMS",:child=>"Bell-Shaped Paperweights"}
		inserts << {:parent=>"TELEPHONES",:child=>"Art Deco"}
		inserts << {:parent=>"TELEPHONES",:child=>"Candlestick"}
		inserts << {:parent=>"TELEPHONES",:child=>"Novelty"}
		inserts << {:parent=>"TELEPHONES",:child=>""}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Charlie's Angels"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Dark Shadows"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Dennis The Menace"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Doctor Who"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Gilligan's Island"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Gunsmoke"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"I Dream of Jeannie"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"I Love Lucy"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Lassie"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Lost In Space"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Partridge Family"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Private Eye"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Private Eye (Man From UNCLE)"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Star Trek"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"The Waltons"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>"Westerns"}
		inserts << {:parent=>"TELEVISION SHOWS & MEMORABILIA",:child=>""}
		inserts << {:parent=>"TELEVISIONS",:child=>""}
		inserts << {:parent=>"TEXTILES",:child=>"Blankets"}
		inserts << {:parent=>"TEXTILES",:child=>"Embroidery"}
		inserts << {:parent=>"TEXTILES",:child=>"Lace & Linens"}
		inserts << {:parent=>"TEXTILES",:child=>"Needlework"}
		inserts << {:parent=>"TEXTILES",:child=>"Needlework (Judaic)"}
		inserts << {:parent=>"TEXTILES",:child=>"South America"}
		inserts << {:parent=>"TEXTILES",:child=>"Tablecloths"}
		inserts << {:parent=>"TEXTILES",:child=>"Tapestries"}
		inserts << {:parent=>"TEXTILES",:child=>""}
		inserts << {:parent=>"THERMOMETERS",:child=>""}
		inserts << {:parent=>"TIBET",:child=>""}
		inserts << {:parent=>"TIE BARS, CLIPS & TACKS",:child=>""}
		inserts << {:parent=>"TIE-BACKS",:child=>""}
		inserts << {:parent=>"TIFFANY ITEMS",:child=>""}
		inserts << {:parent=>"TILES",:child=>"California"}
		inserts << {:parent=>"TILES",:child=>"California (Malibu Potteries)"}
		inserts << {:parent=>"TILES",:child=>"Drain"}
		inserts << {:parent=>"TILES",:child=>"Victorian"}
		inserts << {:parent=>"TILES",:child=>"Zsolnay"}
		inserts << {:parent=>"TILES",:child=>""}
		inserts << {:parent=>"TITANIC MEMORABILIA",:child=>""}
		inserts << {:parent=>"TOASTERS",:child=>""}
		inserts << {:parent=>"TOBACCO COLLECTIBLES",:child=>"Jars"}
		inserts << {:parent=>"TOBACCO COLLECTIBLES",:child=>"Mail Pouch"}
		inserts << {:parent=>"TOBACCO COLLECTIBLES",:child=>"Tins"}
		inserts << {:parent=>"TOBACCO COLLECTIBLES",:child=>""}
		inserts << {:parent=>"TOKENS",:child=>"Love"}
		inserts << {:parent=>"TOKENS",:child=>"Merchant"}
		inserts << {:parent=>"TOKENS",:child=>"Sales Tax"}
		inserts << {:parent=>"TOKENS",:child=>"Transportation (Fare)"}
		inserts << {:parent=>"TOKENS",:child=>""}
		inserts << {:parent=>"TOOLS",:child=>"Anvils"}
		inserts << {:parent=>"TOOLS",:child=>"Blow Torches"}
		inserts << {:parent=>"TOOLS",:child=>"Clamps"}
		inserts << {:parent=>"TOOLS",:child=>"New Jersey"}
		inserts << {:parent=>"TOOLS",:child=>"Planes"}
		inserts << {:parent=>"TOOLS",:child=>"Plumb Bobs"}
		inserts << {:parent=>"TOOLS",:child=>"Stanley"}
		inserts << {:parent=>"TOOLS",:child=>"Tape Measures"}
		inserts << {:parent=>"TOOLS",:child=>"Wrenches"}
		inserts << {:parent=>"TOOLS",:child=>"Wrenches (Adjustable)"}
		inserts << {:parent=>"TOOLS",:child=>""}
		inserts << {:parent=>"TOOTH FAIRY",:child=>""}
		inserts << {:parent=>"TOOTHPICK HOLDERS",:child=>""}
		inserts << {:parent=>"TOWLETTES",:child=>""}
		inserts << {:parent=>"TOY GUNS",:child=>"BB Guns"}
		inserts << {:parent=>"TOY GUNS",:child=>"Cap Guns"}
		inserts << {:parent=>"TOYS",:child=>"Action Figures"}
		inserts << {:parent=>"TOYS",:child=>"Action Figures (G.I. Joe)"}
		inserts << {:parent=>"TOYS",:child=>"Action Figures (Mego)"}
		inserts << {:parent=>"TOYS",:child=>"Airplane Related"}
		inserts << {:parent=>"TOYS",:child=>"Arcade"}
		inserts << {:parent=>"TOYS",:child=>"Battery Operated"}
		inserts << {:parent=>"TOYS",:child=>"Bell"}
		inserts << {:parent=>"TOYS",:child=>"Boats & Outboards"}
		inserts << {:parent=>"TOYS",:child=>"Bubble Blowers"}
		inserts << {:parent=>"TOYS",:child=>"Cannons"}
		inserts << {:parent=>"TOYS",:child=>"Cars"}
		inserts << {:parent=>"TOYS",:child=>"Cars (Racing)"}
		inserts << {:parent=>"TOYS",:child=>"Cast Iron"}
		inserts << {:parent=>"TOYS",:child=>"Character"}
		inserts << {:parent=>"TOYS",:child=>"Character (Mickey Mouse)"}
		inserts << {:parent=>"TOYS",:child=>"Construction Sets"}
		inserts << {:parent=>"TOYS",:child=>"Construction Sets (Blocks)"}
		inserts << {:parent=>"TOYS",:child=>"Construction Sets (Erector)"}
		inserts << {:parent=>"TOYS",:child=>"Construction Sets (Meccano)"}
		inserts << {:parent=>"TOYS",:child=>"Crayola Crayons"}
		inserts << {:parent=>"TOYS",:child=>"Diecast"}
		inserts << {:parent=>"TOYS",:child=>"Diecast (Corgi)"}
		inserts << {:parent=>"TOYS",:child=>"Diecast (Hot Wheels)"}
		inserts << {:parent=>"TOYS",:child=>"Diecast (Matchbox)"}
		inserts << {:parent=>"TOYS",:child=>"Etch-A-Sketch"}
		inserts << {:parent=>"TOYS",:child=>"Farm"}
		inserts << {:parent=>"TOYS",:child=>"Fisher-Price"}
		inserts << {:parent=>"TOYS",:child=>"German & Japanese"}
		inserts << {:parent=>"TOYS",:child=>"Guitars"}
		inserts << {:parent=>"TOYS",:child=>"Horse-Drawn"}
		inserts << {:parent=>"TOYS",:child=>"Jacks"}
		inserts << {:parent=>"TOYS",:child=>"Kenner"}
		inserts << {:parent=>"TOYS",:child=>"Kinder Surprise"}
		inserts << {:parent=>"TOYS",:child=>"Kobe"}
		inserts << {:parent=>"TOYS",:child=>"Marx"}
		inserts << {:parent=>"TOYS",:child=>"Mattel"}
		inserts << {:parent=>"TOYS",:child=>"Monster"}
		inserts << {:parent=>"TOYS",:child=>"Mr. Potato Head"}
		inserts << {:parent=>"TOYS",:child=>"Ohio Art Co."}
		inserts << {:parent=>"TOYS",:child=>"Optical"}
		inserts << {:parent=>"TOYS",:child=>"Paper"}
		inserts << {:parent=>"TOYS",:child=>"Pick-Up Sticks"}
		inserts << {:parent=>"TOYS",:child=>"Playsets"}
		inserts << {:parent=>"TOYS",:child=>"Plush"}
		inserts << {:parent=>"TOYS",:child=>"Renwal"}
		inserts << {:parent=>"TOYS",:child=>"Russian"}
		inserts << {:parent=>"TOYS",:child=>"Sand"}
		inserts << {:parent=>"TOYS",:child=>"Schoenhut"}
		inserts << {:parent=>"TOYS",:child=>"Silly Putty"}
		inserts << {:parent=>"TOYS",:child=>"Space & Robot"}
		inserts << {:parent=>"TOYS",:child=>"Space & Robot (Ray Guns)"}
		inserts << {:parent=>"TOYS",:child=>"Steam/Hot Air"}
		inserts << {:parent=>"TOYS",:child=>"Structo"}
		inserts << {:parent=>"TOYS",:child=>"Super Hero"}
		inserts << {:parent=>"TOYS",:child=>"Talking (Pullstring)"}
		inserts << {:parent=>"TOYS",:child=>"Tin"}
		inserts << {:parent=>"TOYS",:child=>"Tin Tea Sets"}
		inserts << {:parent=>"TOYS",:child=>"Tinkertoys"}
		inserts << {:parent=>"TOYS",:child=>"Tonka"}
		inserts << {:parent=>"TOYS",:child=>"Toonerville Trolley"}
		inserts << {:parent=>"TOYS",:child=>"Tops & Gyroscopes"}
		inserts << {:parent=>"TOYS",:child=>"Transformers"}
		inserts << {:parent=>"TOYS",:child=>"Transportation"}
		inserts << {:parent=>"TOYS",:child=>"Trucks & Equipment"}
		inserts << {:parent=>"TOYS",:child=>"Water Pistols"}
		inserts << {:parent=>"TOYS",:child=>"White Knob Wind-Ups"}
		inserts << {:parent=>"TOYS",:child=>"Wooden"}
		inserts << {:parent=>"TOYS",:child=>""}
		inserts << {:parent=>"TOYS (MODERN)",:child=>""}
		inserts << {:parent=>"TRACTORS",:child=>"Allis-Chalmers"}
		inserts << {:parent=>"TRACTORS",:child=>"Case"}
		inserts << {:parent=>"TRACTORS",:child=>"Caterpillar"}
		inserts << {:parent=>"TRACTORS",:child=>"Cockshutt"}
		inserts << {:parent=>"TRACTORS",:child=>"Ferguson"}
		inserts << {:parent=>"TRACTORS",:child=>"Ford"}
		inserts << {:parent=>"TRACTORS",:child=>"Ford (N-Models)"}
		inserts << {:parent=>"TRACTORS",:child=>"Fordson"}
		inserts << {:parent=>"TRACTORS",:child=>"Gravely"}
		inserts << {:parent=>"TRACTORS",:child=>"John Deere"}
		inserts << {:parent=>"TRACTORS",:child=>"Massey-Harris"}
		inserts << {:parent=>"TRACTORS",:child=>"Minneapolis-Moline"}
		inserts << {:parent=>"TRACTORS",:child=>"Oliver"}
		inserts << {:parent=>"TRACTORS",:child=>""}
		inserts << {:parent=>"TRADING CARDS",:child=>"Non-Sport"}
		inserts << {:parent=>"TRAILERS & RV'S",:child=>"Teardrop"}
		inserts << {:parent=>"TRAILERS & RV'S",:child=>""}
		inserts << {:parent=>"TRAINS",:child=>"Model"}
		inserts << {:parent=>"TRAINS",:child=>"Model (N Gauge)"}
		inserts << {:parent=>"TRAINS",:child=>"Model (O Gauge)"}
		inserts << {:parent=>"TRAINS",:child=>"Model (S Gauge)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (American Flyer)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (Hornby)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (Ives)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (LGB)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (Lionel)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (Marklin)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (Marx)"}
		inserts << {:parent=>"TRAINS",:child=>"Toy (Plasticville)"}
		inserts << {:parent=>"TRAMP ART",:child=>""}
		inserts << {:parent=>"TRANSPORTATION COLLECTIBLES",:child=>"China"}
		inserts << {:parent=>"TRANSPORTATION COLLECTIBLES",:child=>"Timetables"}
		inserts << {:parent=>"TRANSPORTATION COLLECTIBLES",:child=>""}
		inserts << {:parent=>"TRAPS",:child=>"Fly"}
		inserts << {:parent=>"TRAPS",:child=>"Rat/Mouse/Fly"}
		inserts << {:parent=>"TRAPS",:child=>""}
		inserts << {:parent=>"TRAPSHOOTING",:child=>""}
		inserts << {:parent=>"TREASURE HUNTING",:child=>""}
		inserts << {:parent=>"TREES & SHRUBS",:child=>""}
		inserts << {:parent=>"TRENCH ART",:child=>""}
		inserts << {:parent=>"TROLLS",:child=>""}
		inserts << {:parent=>"TRUCKS",:child=>"Divco"}
		inserts << {:parent=>"TRUCKS",:child=>"Ford"}
		inserts << {:parent=>"TRUCKS",:child=>""}
		inserts << {:parent=>"TRUNKS",:child=>""}
		inserts << {:parent=>"TUNBRIDGE WARE",:child=>""}
		inserts << {:parent=>"TYPEWRITERS",:child=>"Ribbon Tins"}
		inserts << {:parent=>"TYPEWRITERS",:child=>"Toy"}
		inserts << {:parent=>"TYPEWRITERS",:child=>""}
		inserts << {:parent=>"UFO'S & UNEXPLAINED PHENOMENA",:child=>""}
		inserts << {:parent=>"UMBRELLA COVERS",:child=>""}
		inserts << {:parent=>"UNCLE SAM",:child=>""}
		inserts << {:parent=>"UNICORNS",:child=>""}
		inserts << {:parent=>"VACUUM CLEANERS",:child=>""}
		inserts << {:parent=>"VALENTINES",:child=>""}
		inserts << {:parent=>"VAUDEVILLE MEMORABILIA",:child=>""}
		inserts << {:parent=>"VENTRILOQUIST ITEMS",:child=>""}
		inserts << {:parent=>"VETERAN ITEMS",:child=>"Civil War"}
		inserts << {:parent=>"VETERAN ITEMS",:child=>""}
		inserts << {:parent=>"VETERINARY MEDICINE ITEMS",:child=>"Military Related"}
		inserts << {:parent=>"VETERINARY MEDICINE ITEMS",:child=>""}
		inserts << {:parent=>"VIETNAM ITEMS",:child=>""}
		inserts << {:parent=>"VOLKSWAGEN RELATED ITEMS",:child=>""}
		inserts << {:parent=>"WALL POCKETS",:child=>""}
		inserts << {:parent=>"WALLACE NUTTING",:child=>""}
		inserts << {:parent=>"WASHING MACHINES",:child=>""}
		inserts << {:parent=>"WATCH FOBS",:child=>""}
		inserts << {:parent=>"WATCHES",:child=>"Character/Comic"}
		inserts << {:parent=>"WATCHES",:child=>"Dials"}
		inserts << {:parent=>"WATCHES",:child=>"Digital"}
		inserts << {:parent=>"WATCHES",:child=>"Electric (Hamilton)"}
		inserts << {:parent=>"WATCHES",:child=>"LED"}
		inserts << {:parent=>"WATCHES",:child=>"Pocket"}
		inserts << {:parent=>"WATCHES",:child=>"Swatch"}
		inserts << {:parent=>"WATCHES",:child=>"Timex"}
		inserts << {:parent=>"WATCHES",:child=>"Watch Papers"}
		inserts << {:parent=>"WATCHES",:child=>"Wrist"}
		inserts << {:parent=>"WATCHES",:child=>""}
		inserts << {:parent=>"WATKINS COMPANY",:child=>""}
		inserts << {:parent=>"WEANERS",:child=>"Calf & Cow"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Annie Oakley"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Bits"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Boots"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Buffalo Bill"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Holsters"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Photographs"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Southwest"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Texas Rangers"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Wells Fargo"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>"Wild West Show"}
		inserts << {:parent=>"WESTERN AMERICANA",:child=>""}
		inserts << {:parent=>"WHALING",:child=>""}
		inserts << {:parent=>"WHISKEY INDUSTRY ITEMS",:child=>"Jack Daniels"}
		inserts << {:parent=>"WHISKEY INDUSTRY ITEMS",:child=>"Old Crow"}
		inserts << {:parent=>"WHISKEY INDUSTRY ITEMS",:child=>""}
		inserts << {:parent=>"WHITE HOUSE COLLECTIBLES",:child=>"China"}
		inserts << {:parent=>"WHITE HOUSE COLLECTIBLES",:child=>""}
		inserts << {:parent=>"WICKER",:child=>""}
		inserts << {:parent=>"WINCHESTER COLLECTIBLES",:child=>""}
		inserts << {:parent=>"WINDMILL COLLECTIBLES",:child=>"Weights"}
		inserts << {:parent=>"WINDMILL COLLECTIBLES",:child=>""}
		inserts << {:parent=>"WINES & WINE RELATED ITEMS",:child=>""}
		inserts << {:parent=>"WITCHES",:child=>"Salem"}
		inserts << {:parent=>"WIZARD OF OZ",:child=>""}
		inserts << {:parent=>"WOOD",:child=>"Carvings"}
		inserts << {:parent=>"WOOD",:child=>"Carvings (Black Forest)"}
		inserts << {:parent=>"WOOD",:child=>"Turnings"}
		inserts << {:parent=>"WOOD",:child=>""}
		inserts << {:parent=>"WOODEN MONEY",:child=>""}
		inserts << {:parent=>"WOODSTOCK",:child=>""}
		inserts << {:parent=>"WORLD'S FAIRS & EXPOSITIONS",:child=>""}

		inserts.each do |insert|
			pId = Category.find_or_create_by_name(insert[:parent])
			if !insert[:child].empty?
				cId = pId.children.create(:name => insert[:child])
			end
		end
	end
end

