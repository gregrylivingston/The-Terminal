extends Panel

var scenarioChoiceButton = preload("res://scene/dropdown.tscn")

var button_facilityType
var button_scenarioLocation
var button_scenarioType
var button_facilitySize


func beginGame():
	get_tree().change_scene_to_file("res://scene/terminal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	G.terminalNode = self
	
	#$summary.visible = false
	$VBox2/Button_S.connect("pressed",beginGame)
	$VBox/HBox/Button_S.connect("pressed" , randomizeScenario)

	randomizeScenario()
	

#		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveFacilitySize.bind(i))

func loadDropdowns():
	for i in [$VBox/HBox/VBox1 , $VBox/HBox/VBox2, $VBox/HBox/VBox3, $VBox/HBox/VBox4]:
		for child in i.get_children():child.queue_free()
	
	button_facilityType = createScenarioButton(gFacility.facilityType.find_key(gFacility.myType))
	$VBox/HBox/VBox1.add_child(button_facilityType)
	for i in gFacility.facilityType:button_facilityType.addOption(i)

	button_scenarioLocation = createScenarioButton(gScenario.scenarioLocation.find_key(gScenario.myScenarioLocation))
	$VBox/HBox/VBox2.add_child(button_scenarioLocation)
	for i in gScenario.scenarioLocation:button_scenarioLocation.addOption(i)
	
	button_scenarioType = createScenarioButton(gScenario.scenarioType.find_key(gScenario.myScenarioType))
	$VBox/HBox/VBox3.add_child(button_scenarioType)
	for i in gScenario.scenarioType:button_scenarioType.addOption(i)

	button_facilitySize = createScenarioButton(gFacility.facilitySize.find_key(gFacility.myFacilitySize))
	$VBox/HBox/VBox4.add_child(button_facilitySize)
	for i in gFacility.facilitySize:button_facilitySize.addOption(i)


	for i in [button_facilityType , button_scenarioLocation, button_scenarioType, button_facilitySize]:
		i.connect("newSelection" , loadProposedScenario)
		i.size_flags_vertical = SIZE_EXPAND_FILL
		
func saveFacilitySize(choice):
	gFacility.myFacilitySize = choice
	loadProposedScenario()
	

func randomizeScenario():
	gFacility.myType = randi_range(0 , gFacility.facilityType.size() - 1)
	gFacility.myFacilitySize = randi_range(0 , gFacility.facilitySize.size() - 1)
	gScenario.myScenarioType = randi_range(0 , gScenario.scenarioType.size() -1)
	gScenario.myScenarioLocation = randi_range(0 , gScenario.scenarioLocation.size() - 1)
	loadDropdowns()
	loadProposedScenario()
	
var facilityDiagram = preload("res://scene/facility/facility.tscn")


func loadProposedScenario():
	
	gFacility.myType = button_facilityType.selectedOption
	gScenario.myScenarioLocation = button_scenarioLocation.selectedOption
	gScenario.myScenarioType = button_scenarioType.selectedOption
	gFacility.myFacilitySize = button_facilitySize.selectedOption

	gFacility.myFacilityName =  shipNames[gFacility.myType][gScenario.myScenarioType][ randi_range(0,shipNames[gFacility.myType][gScenario.myScenarioType].size()-1)] 
	$summary/Label_FacilityName.text = "[i]" + gFacility.myFacilityName.to_upper() + "[/i]"

	gFacility.createMyZones()
	for i in $summary/facility.get_children():i.queue_free()
	var newFacility = facilityDiagram.instantiate()
	$summary/facility.add_child(newFacility)
	




func createScenarioButton(title):
	var newButton = scenarioChoiceButton.instantiate()
	newButton.selectedOption = title
	return newButton




const shipNames = {
	"SHIP":{
		"EXPLORATION":[ "Star Voyager", "Celestial Discovery", "Astral Pathfinder" , "Galactic Quest","Nova Pioneer","Cosmic Odyssey","Stellar Seeker","Nebula Nomad","Interstellar Endeavor","Orion's Destiny","Andromeda Voyager","Apollo Ascendant","Solaris Expedition","Magellan's Legacy","Epsilon Enterprise","Aurora Explorer","Vortex Venture","Odyssey Starship","Cosmic Horizon","Nebula Nomad","Serenity's Grace","Phoenix Ascension","Horizon Wanderer","Galactica Odyssey","Aether Discovery","Intergalactic Questor","Alpha Centauri Scout"], 
		"EXTRACTION":[ "Star Drill","Asteroid Extractor 7","Planetary Plunderer","Galactic Extractor HS-7","Deep Space Digger 2","Terra Trove","Space Salvager R9","Exoplanet Excavator 7","Celestial Looter","Lunar Lootship","Crystal Cruiser","Mining Monarch","Astral Appraiser","Solar Siphon","Planet Prospector 8","Space Scavenger S092","More Ore Overseer","Astro Exploiter","Orbital Extractor","Cosmic Commodore","Meteorite Marauder","Plutonium Plunderer","Elemental Extractor" ],
		"MILITARY":[ "Battlestar Valor","Dreadnought Avenger","Starhawk Sentinel","Galactic Warlord","Nebula Guardian","Interceptor Vengeance","Void Vanguard","Warlock Warden","Corsair Conqueror","Leviathan Legion","Eclipse Enforcer","Starfire Marauder","Ironclad Rampart","Nova Nemesis","Thunderstrike Annihilator","Celestial Crusader","Solaris Siegebreaker","Stormbringer Battler","Astral Assault Cruiser","Cydonia Centurion","Galactic Obliterator","Seraphim Destroyer","Nebula Knight","Scorpion Skirmisher","Blackstar Dominance","Venom Vanguard","Orion Outlaw"],
		"SCIENCE":[ "STARLAB-7" , "Discovery Endeavor","Kepler Explorer","Quantum Quest","Cosmos Researcher","Nebula Observer 2","Horizon Seeker","Galileo Voyager","Celestial Scholar","Pioneer Investigator","Orion Science Sentinel","Newtonian Navigator","Sagan Explorer","Einstein Expedition 7","Radiant Researcher","Odyssey Observer","Magellan Mapper","Beacon of Discovery", ],
		"TOURISM":[ "Celestial Dreamliner","Stellar Odyssey 7","GalaxyGlide S2","Nebula Wanderlust","Cosmic Cruise Liner 224","Astral Escape 12","Starry Horizons 4","Infinity Voyages","Space Serenity Journeys I4","Nova Nomad Tourship 5","Solaris Sojourner","InterTrek2","Orion Starlight Tourship","Nebula Nebuluxe","Horizon Harmony 2","Cosmic Comfort E412","Astrotouria Venturecraft","Constellation Tourscape 5","GalactiCruise12","Pulsar Passage Voyager","Orbit Odyssey Traveller","Zenith Zodiac","Aurora Abound Expeditioner","Celestia Seeker","Panorama Pioneer" ],
		"TRADE":[ "FASTLANE EXPRESS 202", "Galactic Cargo 3","Starfreighter Exchange 542","Cosmic Caravan 7","TradeRoute Voyager","Interstellar Hauler-12","Astrocommerce Q9142","Cargo CosmoLiner 3","Celestial Export X12","Quantum Quay Transport 6","Horizon Haulage 1","Cosmic Commodity N4","Nebula Nexus Tradership 2","Solaris Supply Cruiser","Astral Exchange 17","Stellar Shipping DN2","Intergalactic Freightmaster","Aurora Importer","Skybound Supplier 2","TradeWings Odyssey","Pulsar Payload Transport","FreightLink Explorer","Hyperion Hauler","Cosmic Cargo Carrier","TradeStar Enterprises"]
	},
	"BASE":{
		"EXPLORATION":[ "FRONTIER-ALPHA 1" , "FAR HORIZON PLANET-BASE","Pioneer Outpost",    "Horizon Discovery Base Alpha",    "Frontier Expedition Camp Loon",    "Nebula Pathfinder Station",    "Cosmic Surveyor Hub",    "Stellar Voyager Encampment Artemis",    "Astronomer's Oasis Home",    "Eclipse Expedition Hub",    "Celestial Wayfarer Base",    "Galactic Seeker Encampment",    "Aurora Survey Station",    "Stellar Nomad Outpost",    "Nebula Scouter Hub",    "Orion Explorer Camp",    "Solaris Pioneer Station 7",    "Nexus Astronomer's Base",    "Horizon Adventurer's Hub",    "Astrocartography Outpost",    "Sapphire Survey Encampment",    "Astral Expedition Hub",    "Celestial Voyager Base",    "Frontier Astronomer's Camp",    "Stellar Seeker Station",    "Nebula Discovery Outpost",    "Cosmic Scout Hub",    "Elysium Explorer Camp",    "Aurora Pioneer Base",    "Galactic Wayfinder Hub"], 
		"EXTRACTION":[ "Quantum Resource Outpost Red",    "Nebula Extractor Station",    "Stellar Ore Processing Hub S12",    "Celestial Crystal Refinery LISA",    "Galactic Harvest Camp C42",    "Astral Fueling Depot Elf",    "Mineral Extraction Outpost Delta",    "Cosmic Energy Refinery P112",    "Orion Metal Forge Base K2",    "Solaris Extractor Station 15",    "Nexus Resource Refinery",    "Astrocore Mining Outpost 14",    "Stellar Element Refinery Bruel",    "Galactic Fuel Hub S2",    "Astral Mineral Outpost Fatima",    "Quantum Energy Refinery Finley",    "Orion Crystal Forge Base",    "Solaris Resource Station 14",    "Nexus Metal Extractor Elisa",    "Stellar Extractor Camp Martin", ],
		"MILITARY":[ "SPARTA-NINE MILITARY BASE" ,  "OMEGA FRONTIER STATION",  "Fortress Alpha",    "Nova Sentinel Outpost",    "Astro Defense Base Kiva",    "Stellar Vanguard Station Oberon",    "Celestial Warfront Encampment S22",    "Galactic Armory Hub Marvin",    "Orion Command Center",    "Solaris Barracks",    "Nebula Warzone Outpost 12",    "Cosmic Battlefront Base",    "Interstellar Warfighter Station",    "Astral Strategist Encampment",    "Nexus Armament Hub",    "Horizon Warfront Outpost",    "Eclipse Command Base",    "Quantum Warfront Station",    "Stellar Armory Encampment",    "Celestial Vanguard Hub",    "Galactic Warzone Outpost",    "Aurora Battlefront Base",    "Orion Command Center",    "Solaris Barracks",    "Nebula Warfighter Station",    "Cosmic Defense Encampment",    "Interstellar Armament Hub",    "Astral Warfront Outpost",    "Nexus Command Base",    "Horizon Battlefront Station"],
		"SCIENCE":[ "PLANETARYSCIENCE-7" , "CORE DISCOVERY PROJECT" , "Quantum Research Outpost Blue",	"Nebula Laboratory Station",	"Stellar Innovator Hub",	"Celestial Science Encampment 14",	"Galactic Explorer Base 2",	"Astral Observatorium Omega",	"Cosmic Analysis Outpost A4",	"Orion Technologist Hub Orange",	"Solaris Discoverer Station",	"Nexus Innovation Encampment",	"Horizon Research Base",	"Astro Theorist Hub Nebulon",	"Plasma Research Outpost",	"Aurora Innovator Hub",	"Galactic Science Encampment Alexis",	"Nebula Explorer Base",	"Stellar Observatorium",	"Celestial Analysis Outpost",	"Cosmic Technologist Hub Andrew",	"Orion Discoverer Station",	"Solaris Innovation Encampment",	"Nexus Research Base",	"Horizon Theorist Hub",	"Astro Research Outpost Nikita",	"Aurora Science Encampment"],
		"TOURISM":[  "Stellar Vistas Retreat",    "Luminous Expanse Resort",    "Crystalline Oasis Outpost",    "Galactic Dreamer's Gateway",    "Aurora Haven Hub",    "Nebula Escapade Oasis",    "Sapphire Tranquility Base",    "Eclipse Adventure Resort Red",    "Cosmic Cascade Oasis",    "Nova Horizon Haven",    "Astro Breeze Base",    "Twilight Tranquil Oasis",    "Astral Marvel Resort",    "Enchanted Nebula Base",    "Stellar Mirage Retreat",    "Radiant Radiance Oasis",    "Serenity Echo Hub",    "Nebula Nexus Outpost",    "Eternal Twilight Base",    "Galactic Echo Oasis",    "Celestial Echo Retreat",    "Voyager's View Haven",    "Elysian Starlight Oasis",    "Moonlit Mirage Resort",    "Stellar Echo Base",    "Nebula Lullaby Retreat"],
		"TRADE":[ "Trade Nexus Outpost Black",	"Galactic Exchange Station Z4",	"Stellar Commerce Hub Amelia",	"Celestial Barter Encampment Drew",	"Orion Trading Post L023",	"Cosmic Market Base Vena",	"Astral Commerce Outpost Ero1",	"Nexus Trade Hub Arrow",	"Solaris Merchant Station",	"Nebula Rose Barter Encampment",	"Horizon Exchange Base",	"Interstellar Trade Post",	"Aurora Commerce Outpost",	"Celestial Trade Hub",	"Galactic Merchant Station",	"Stellar Barter Encampment",	"Orion Inc Market Base",	"Cosmic Commerce Outpost",	"ACorp Astral Trade Hub",	"Nexus Merchant Station",	"Solaris Barter Encampment",	"Nebula Exchange Base",	"Horizon Trading Post",	"Interstellar Commerce Outpost",	"Aurora Trade Hub",	"Celestial Merchant Station",	"Galactic Barter Encampment",	"Stellar Exchange Base",	"Orion Commerce Outpost" ]
	},
	"STATION":{
		"TRADE":[  "Commerce Constellation 12", "Starport Nexus Alpha","C4A Exchange Hub","Galactic Trading Post Omara","Astrocommerce Depot S9","Nebula Marketplace Hub","Solaris Trade Nexus","Cosmic Cargo Terminal Delta","Horizon Harbor Station","Stellar Mercantile P224","Quantum Quay Hub","Nebula Nexus Station","TradeStar Anchorage 4","Aurora Trading Plaza","Skybound Commerce Hub","Pulsar Exchange Port","Orion Orbital Market","Prosperity Spaceport","Galaxy Goods Exchange","Interstellar Supply Station M004","Nebula Network Station","Port of Prosperity","Astral Trading Beacon","TradeWings Junction","Cosmic Commodities Hub","Stellar Exchange Anchorage",],
		"EXPLORATION":[ "Astral Frontier Outpost Omega12","Celestial Expedition Station S2","Nebula Discovery Hub L07","Stellar Odyssey Outpost","Quantum Exploratorium","Interstellar Probe Base Alpha","Cosmic Reconnaissance Station S72","Orion Pioneer Outpost","Nebula Cartography Hub","Solaris Survey Station 2","Galactic Pathfinder Outpost Erie","Celestial Cartographer Station","Quantum Quest Outpost Q3","Nebula Recon Nexus","Starfarer's Haven Elektra","Astral Mapping Station Vila","Stellar Voyager Outpost White","Nebula Exploration Nexus","Frontier Science Outpost","Celestial Navigator Station Orange","Cosmic Wayfarer Deepspace Hub Silas","Orion Mapping Outpost R","Solaris Starfarer Nexus","Nebula Expedition Base","Quantum Voyager Outpost","Interstellar Pioneer Station","Celestial Horizon Hub","Astral Reconnaissance Outpost"], 
		"EXTRACTION":[ "Astral Resource Nexus","Quantum Quarry Station","Celestial Resource Outpost Z4","Nebula Harvest Hub 12","Stellar Prospector Station Blue","Cosmic Ore Depot Monroe","Interstellar Refinery 92","Terraforge Station","Nebula Processing Depot","GalactaDrill Hub A72","Asteroid Mining Outpost Gamma Charlie","Quantum Excavation S2","Stellar Strata Refinery Hub","Celestial Ore BB9","Nebula Excavation Hub","Quantum Crystal Processing Station","Interstellar Geo Station 7","Solforge Resource Nexus","Elemental Extraction Outpost","Starcore Refinement Station","Nebula Crystal Harvest Base Red","Astromine Nexus-9","Planetary Resource Refinery Station Julie","Quantum Resource Relay Delta","GalactiCore Extraction Hub Z2" ],
		"MILITARY":[ "Starfortress Citadel 7","Nebula Bastion","Galactic Defense Nexus A2","Celestial Sentinel Station","Stellar Warship Outpost","Quantum Garrison Hub","Interstellar Command Base","Orion Warzone Station","Solaris Fleet Depot 5","Nebula Battleground Nexus","Cosmic Defense Outpost 17","Interstellar Armory Station White","Celestial Defense Nexus","Nebula Warzone Hub","Starship Arsenal Outpost'","Astral War Command Blue","Galactic Battlestation Julius","Quantum Defense Nexus","Stellar War Command 14","Celestial Armada Hub","Solaris Warship Station Blue","Nebula Starfortress Nexus","Interstellar Warzone Outpost","Cosmic Defense Hub","Orion Armory Station","Starship War Nexus Hub","Astral Fortress Outpost","Quantum Battleground Station","Galactic War Command","Celestial War Nexus"],
		"SCIENCE":[ "Astral Research Nexus 12",    "Celestial Observatory Charlie",    "Nebula Science Outpost 92",    "Stellar Knowledge Hub Q",    "Quantum Laboratory Orange",    "Interstellar Research Base Elizabeth",    "Cosmic Discovery Station 9",    "Orion Astral Nexus",    "Solaris Scientific Outpost",    "Nebula Discovery Hub",    "Galactic Experiment Station",    "Celestial Innovator Base Orion",    "Nebula Data Nexus",    "Astronomical Insight Station Bravo Sector",    "Stellar Phenomena Hub Beale",    "Quantum Hypothesis Base 1",    "Interstellar Study Station Elliot",    "Astrobiology Research Nexus",    "Celestial Beacon Hub",    "Nebula Quest Station",    "Exoplanet Investigation Outpost",    "Cosmic Analysis Nexus",    "Orion Observatory Base",    "Stellar Phenomenon Station",    "Solaris Research Nexus",    "Nebula Inquiry Outpost",    "Galactic Hypothesis Hub",    "Celestial Discovery Base",    "Astronomical Nexus",    "Quantum Science Station" ],
		"TOURISM":[  "Stellar Vacation Station",    "Celestial Leisure Lounge 4",    "Nebula Getaway Club",    "Astral Oasis Station",    "Quantum Voyager Haven",    "Star Resort 9",    "Galactic Gateway Silas",    "Orionview Retreat Hub",    "Nebula Odyssey Oasis",    "Celestial Starlight Resort Blue",    "Cosmic Adventure Haven",    "Stellar Tranquility Hub",    "Interstellar Wonder Station",    "Astronomical Escapes Oasis",    "Nebula Paradise Gateway",    "Galactic Spectacle Retreat",    "Orion Astral Oasis",    "Celestial Serenity Hub",    "Quantum Vacation Station",    "Interstellar Tranquility Resort",    "Cosmic Voyager Gateway",    "Stellar Leisure Oasis",    "Solaris Adventure Hub",    "Nebula Starlight Retreat",    "Astral Holiday Station",    "Celestial Spectacle Oasis",    "Galactic Tranquility Gateway",    "Orion Wonder Resort",    "Interstellar Escapes Hub" ],

	}
}
