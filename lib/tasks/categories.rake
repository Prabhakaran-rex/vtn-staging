namespace :purex do
	desc "Seed categories"
	task :categories => :environment do
		Category.delete_all
		inserts = Array.new
		inserts << {:parent=>"20th century design (mid-20th c. furniture, lighting, decorative arts, etc.)",:child=>""}
		inserts << {:parent=>"Action figures (comic book heroes, military, adventure, sports, TV, movie, etc.)",:child=>""}
		inserts << {:parent=>"Advertising (Aunt Jemima, Pillsbury, signs, flyers, trade cards, etc.)",:child=>""}
		inserts << {:parent=>"Antiquities (Greek, Roman, Egyptian, Middle East)",:child=>""}
		inserts << {:parent=>"Arms & armor (Medieval, Japanese swords, etc.)",:child=>""}
		inserts << {:parent=>"Art (African and tribal)",:child=>""}
		inserts << {:parent=>"Art (Animation, celluloids, comic, etc.)",:child=>""}
		inserts << {:parent=>"Art (Chinese: porcelain, jade, calligraphy, etc.)",:child=>""}
		inserts << {:parent=>"Art (Japanese: porcelain, calligraphy, netsuke, etc.)",:child=>""}
		inserts << {:parent=>"Art (paintings)",:child=>""}
		inserts << {:parent=>"Art (photographs)",:child=>""}
		inserts << {:parent=>"Art (prints, posters)",:child=>""}
		inserts << {:parent=>"Art (sculpture)",:child=>""}
		inserts << {:parent=>"Art (South East Asian, Indian, etc.)",:child=>""}
		inserts << {:parent=>"Art (textile art)",:child=>""}
		inserts << {:parent=>"Art Deco (furniture, lamps, decorative arts, etc.)",:child=>""}
		inserts << {:parent=>"Arts & Crafts (furniture, lamps, decorative arts, etc.",:child=>""}
		inserts << {:parent=>"Audio equipment (vintage amps, speakers, mics, etc.)",:child=>""}
		inserts << {:parent=>"Autographs-authentic celebrity (movies, music, television, theater, etc.)",:child=>""}
		inserts << {:parent=>"Autographs-authentic sports (baseball, football, basketball, hockey, golf, NASCAR, etc.)",:child=>""}
		inserts << {:parent=>"Banks (still, mechanical, registering, etc.)",:child=>""}
		inserts << {:parent=>"Shaving collectibles (barber chairs, shaving mugs, razors, etc.)",:child=>""}
		inserts << {:parent=>"Bears (Teddy: modern, Schuco, Steiff, etc.)",:child=>""}
		inserts << {:parent=>"Bicycles & related memorabilia",:child=>""}
		inserts << {:parent=>"Billiard related items",:child=>""}
		inserts << {:parent=>"Black memorabilia",:child=>""}
		inserts << {:parent=>"Books (vintage, out-of-print, antiquarian, collectible)",:child=>""}
		inserts << {:parent=>"Bottles & insulators (decanters, whiskies, poisons, etc.)",:child=>""}
		inserts << {:parent=>"Boy/Girl Scout",:child=>""}
		inserts << {:parent=>"Breweriana (beer cans, etc.)",:child=>""}
		inserts << {:parent=>"Buttons",:child=>""}
		inserts << {:parent=>"Cameras & camera equipment",:child=>""}
		inserts << {:parent=>"Cars and trucks (vintage, special interest)",:child=>""}
		inserts << {:parent=>"Casino collectibles (chips, etc.)",:child=>""}
		inserts << {:parent=>"Celebrity-related (historical, literary, entertainment, sports, movie stars, musicians, etc.)",:child=>""}
		inserts << {:parent=>"Ceramics, porcelain, pottery & china (art pottery)",:child=>""}
		inserts << {:parent=>"Ceramics, porcelain, pottery & china (china/dinnerware)",:child=>""}
		inserts << {:parent=>"Civil War artifacts",:child=>""}
		inserts << {:parent=>"Clocks",:child=>""}
		inserts << {:parent=>"Clothing & accessories (vintage: men, women, children)",:child=>""}
		inserts << {:parent=>"Coin-operated machines (jukeboxes, pinball, vending, gumball, trade stimulators, slot, scales, etc.)",:child=>""}
		inserts << {:parent=>"Coins (ancient Byzantine, Greek, Roman, etc.)",:child=>""}
		inserts << {:parent=>"Coins (medieval: Asian, Celtic, European, Islamic, Persian, Indian, etc.)",:child=>""}
		inserts << {:parent=>"Coins (US, commemorative, Colonial, novelties, etc.)",:child=>""}
		inserts << {:parent=>"Coins (World, non-US, Africa, Asia, Europe, Middle East, South America)",:child=>""}
		inserts << {:parent=>"Comic books",:child=>""}
		inserts << {:parent=>"Cowboy heroes (Hopalong Cassidy, Gene Autry, Lone Ranger, Roy Rogers, etc.)",:child=>""}
		inserts << {:parent=>"Dairy collectibles (dairy bottles, cream separators, milk cartons, etc.)",:child=>""}
		inserts << {:parent=>"Diecast & toy vehicles (aircraft, boats, ships, cars, trucks, NSACAR, racing, construction, farm, motorcycles, military, vehicle banks, etc.)",:child=>""}
		inserts << {:parent=>"Disneyana",:child=>""}
		inserts << {:parent=>"Dollhouses & miniatures",:child=>""}
		inserts << {:parent=>"Dolls (Barbie, contemporary, designer, etc.)",:child=>""}
		inserts << {:parent=>"Dolls (furniture, clothing)",:child=>""}
		inserts << {:parent=>"Dolls (vintage paper)",:child=>""}
		inserts << {:parent=>"Dolls (vintage, US or non-US, porcelain, bisque, wax, composition, etc.)",:child=>""}
		inserts << {:parent=>"Edged weapons (knives, swords, blades, bayonets, etc.)",:child=>""}
		inserts << {:parent=>"Ethnic-related collectibles",:child=>""}
		inserts << {:parent=>"Exonumia (medals, elongated coins, encases coins, tokens, wooden nickels)",:child=>""}
		inserts << {:parent=>"Firearms (rifles, muskets, pistols, etc.)",:child=>""}
		inserts << {:parent=>"Firefighting memorabilia",:child=>""}
		inserts << {:parent=>"Folk art",:child=>""}
		inserts << {:parent=>"Furniture (vintage)",:child=>""}
		inserts << {:parent=>"Gas station collectibles (gas pumps, globes, road maps, oil cans, etc.)",:child=>""}
		inserts << {:parent=>"Glassware (19th c. Early American Pattern Glass)",:child=>""}
		inserts << {:parent=>"Glassware (art glass: Bohemian, Czech, British, French, US, Scandinavian, hand-crafted, stained glass, etc.)",:child=>""}
		inserts << {:parent=>"Glassware (contemporary, Depression, Elegant, Vaseline, Carnival, opaque, stretch, pressed, etc. )",:child=>""}
		inserts << {:parent=>"Glassware (cut: vintage, contemporary, Waterford)",:child=>""}
		inserts << {:parent=>"Hardware (vintage; door knobs, hinges, fasteners, etc.)",:child=>""}
		inserts << {:parent=>"Historical Americana (diaries, certificates, letters, photographs, etc.)",:child=>""}
		inserts << {:parent=>"Holiday collectibles (Christmas, Thanksgiving, Halloween, Easter, etc.)",:child=>""}
		inserts << {:parent=>"Inuit & Northwest Coast Natives",:child=>""}
		inserts << {:parent=>"Jewelry (vintage costume)",:child=>""}
		inserts << {:parent=>"Judaica",:child=>""}
		inserts << {:parent=>"Kitchen collectibles (apple parers, egg timers, smoothing irons, trivets, butter churns, etc.)",:child=>""}
		inserts << {:parent=>"Lamps & lighting",:child=>""}
		inserts << {:parent=>"Law enforcement memorabilia (FBI, Sheriff, police, Texas Rangers, etc.)",:child=>""}
		inserts << {:parent=>"Locks & keys",:child=>""}
		inserts << {:parent=>"Lunchboxes",:child=>""}
		inserts << {:parent=>"Magazines (pulp, MAD, men's, automotive, covers & tear sheets, etc.)",:child=>""}
		inserts << {:parent=>"Magic lanterns & slides",:child=>""}
		inserts << {:parent=>"Magicians paraphernalia",:child=>""}
		inserts << {:parent=>"Maps & charts",:child=>""}
		inserts << {:parent=>"Matchcovers",:child=>""}
		inserts << {:parent=>"Medals, awards & decorations",:child=>""}
		inserts << {:parent=>"Medical, dental & pharmaceutical",:child=>""}
		inserts << {:parent=>"Militaria (Spanish American War, WWI, WWII, Viet Nam, patches, uniforms, weapons, etc.)",:child=>""}
		inserts << {:parent=>"Movie memorabilia (lobby cards, posters, programs, wardrobe, glass slides, flyers, scripts, props, etc.)",:child=>""}
		inserts << {:parent=>"Music boxes (cylinder, disc, etc.)",:child=>""}
		inserts << {:parent=>"Music memorabilia (classical, opera, ballet, country, folk, R&B, soul, Hip Hop, rock, Pop, polka, etc.)",:child=>""}
		inserts << {:parent=>"Musical instruments (brass: trumpet, trombone, bugle, French horn, etc.)",:child=>""}
		inserts << {:parent=>"Musical instruments (guitars, banjo, mandolin, dulcimer, ukulele)",:child=>""}
		inserts << {:parent=>"Musical instruments (pianos, player pianos, organs, player organs, etc.)",:child=>""}
		inserts << {:parent=>"Musical instruments (string: bass, cello, harp, viola, violin)",:child=>""}
		inserts << {:parent=>"Musical instruments (woodwinds: bassoon, clarinet, flute, recorder, sax, etc.)",:child=>""}
		inserts << {:parent=>"Native American (pottery, jewelry, baskets, blankets, etc.)",:child=>""}
		inserts << {:parent=>"Nautical (telescopes, ship models, diving helmets, sailor art, scrimshaw, etc.)",:child=>""}
		inserts << {:parent=>"Office equipment (adding machines, staplers, typewriters, etc.)",:child=>""}
		inserts << {:parent=>"Paper ephemera (calendars, letters, advertisements, flyers, etc.)",:child=>""}
		inserts << {:parent=>"Paper money (US, Colonial, Confederate, fractional, banknotes, military, large size)",:child=>""}
		inserts << {:parent=>"Paper money (World)",:child=>""}
		inserts << {:parent=>"Paperweights",:child=>""}
		inserts << {:parent=>"Pens & pencils (pens, pencils, writing paraphernalia)",:child=>""}
		inserts << {:parent=>"Phonographs",:child=>""}
		inserts << {:parent=>"Photographic images (Civil War, military, travel, family, farm, portraits, etc.)",:child=>""}
		inserts << {:parent=>"Political collectibles (presidents, conventions, campaign, buttons, banners, etc.)",:child=>""}
		inserts << {:parent=>"Posters (movie, music, etc.)",:child=>""}
		inserts << {:parent=>"Pre-historic artifacts (arrowheads and points, etc.)",:child=>""}
		inserts << {:parent=>"Radios",:child=>""}
		inserts << {:parent=>"Railroad collectibles (posters, timetables, hat badges, schedules, lanterns, keys, etc.",:child=>""}
		inserts << {:parent=>"Steins",:child=>""}
		inserts << {:parent=>"Rocks & fossils (rocks, fossils, mineral specimens, meteorites)",:child=>""}
		inserts << {:parent=>"Telephones (vintage)",:child=>""}
		inserts << {:parent=>"Scientific instruments (barometers, slide rules, microscopes, surveying, calculators, transits, binoculars, telescopes, etc.)",:child=>""}
		inserts << {:parent=>"Soft drink collectibles (Coca-Cola, Pepsi, Dr. Pepper, etc.)",:child=>""}
		inserts << {:parent=>"Souvenir & commemorative items",:child=>""}
		inserts << {:parent=>"Sewing machines and sewing go-withs",:child=>""}
		inserts << {:parent=>"Sheet music (vintage)",:child=>""}
		inserts << {:parent=>"Records",:child=>""}
		inserts << {:parent=>"Salt & pepper shakers",:child=>""}
		inserts << {:parent=>"Saloon & bar collectibles (swizzle sticks, cocktail shakers, whiskey pitchers, etc.)",:child=>""}
		inserts << {:parent=>"Silver & silverplate",:child=>""}
		inserts << {:parent=>"Smoking collectibles (tobacianna: cigarette packs, pipes, cigarette cases, etc.)",:child=>""}
		inserts << {:parent=>"Sporting collectibles (decoys)",:child=>""}
		inserts << {:parent=>"Sporting collectibles (fishing, hunting, archery, guns, etc.)",:child=>""}
		inserts << {:parent=>"Sports cards (baseball, basketball, football, hockey, NASCAR, tennis, wrestling, etc.)",:child=>""}
		inserts << {:parent=>"Sports memorabilia (game-used: baseballs, footballs, helmets, jerseys, hats, etc.)",:child=>""}
		inserts << {:parent=>"Sports memorabilia (vintage: baseballs, bats, baseball gloves, prints, patches, pennants, photos, pins, plaques, schedules, ticket stubs, etc.)",:child=>""}
		inserts << {:parent=>"Stamps (First Day Covers)",:child=>""}
		inserts << {:parent=>"Stamps (non-US: Africa, Asia, Australia, Canada, UK/Commonwealth/Colonial, Europe, SA, Latin America, Middle East, etc.)",:child=>""}
		inserts << {:parent=>"Stamps (Postcards)",:child=>""}
		inserts << {:parent=>"Stamps (Topical: war, sports, famous people, Christmas, Black heritage, etc.)",:child=>""}
		inserts << {:parent=>"Stamps (US: used, unused, 19th c., Confederate, errors, freaks, plate blocks, Possessions, etc.)",:child=>""}
		inserts << {:parent=>"Stocks & bonds (scripophily)",:child=>""}
		inserts << {:parent=>"Television show memorabilia (games, photos, promotionals, figurals, trading cards, etc.)",:child=>""}
		inserts << {:parent=>"Textiles (lace)",:child=>""}
		inserts << {:parent=>"Textiles (linens)",:child=>""}
		inserts << {:parent=>"Textiles (needlepoint)",:child=>""}
		inserts << {:parent=>"Textiles (quilts)",:child=>""}
		inserts << {:parent=>"Textiles (rugs & carpets)",:child=>""}
		inserts << {:parent=>"Textiles (tapestries)",:child=>""}
		inserts << {:parent=>"Theater memorabilia (brochures, playbills, postcards, props, wardrobe, scripts, souvenir, programs, window cards, etc.)",:child=>""}
		inserts << {:parent=>"Tools (vintage: wood planes, wrenches, adz, clamps, etc.)",:child=>""}
		inserts << {:parent=>"Toys (marbles)",:child=>""}
		inserts << {:parent=>"Toys (vintage, tin: tin vehicles, tin character toys, etc.)",:child=>""}
		inserts << {:parent=>"Toys (vintage: building toys, cap guns, cast iron, games, card games, Cowboy/Western, lead toys/figures, puzzles, pull toys, tea sets, wind-ups, etc.)",:child=>""}
		inserts << {:parent=>"Toys (vintage: model and toy railroad trains)",:child=>""}
		inserts << {:parent=>"Trading cards (non-sport)",:child=>""}
		inserts << {:parent=>"Transportation collectibles (bus line, steamship, airlines, airships, railroads, etc.)",:child=>""}
		inserts << {:parent=>"Travel memorabilia (souvenirs, photographs, maps, decals, etc.)",:child=>""}
		inserts << {:parent=>"TV's (vintage)",:child=>""}
		inserts << {:parent=>"Vanity collectibles (perfume bottles, purses, etc.)",:child=>""}
		inserts << {:parent=>"Video game memorabilia ",:child=>""}
		inserts << {:parent=>"Watches (pocket, wrist)",:child=>""}
		inserts << {:parent=>"Western Americana (cowboy, saddles, chaps, barbed wire, Buffalo Bill, etc.)",:child=>""}

		inserts.each do |insert|
			pId = Category.find_or_create_by_name(insert[:parent])
			if !insert[:child].empty?
				cId = pId.children.create(:name => insert[:child])
			end
		end
	end
end

