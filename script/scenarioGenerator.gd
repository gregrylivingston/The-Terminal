extends Panel

var scenarioChoiceButton = preload("res://scene/dropdown.tscn")
var colorMap = {
	"SHIP":7,"STATION":12,"BASE":4,
	"EARTH_SYSTEM":12,"SOLAR_SYSTEM":6,"DISTANT_STAR":6,"ANOTHER_DIMENSION":0,
	"EXPLORATION":14,"TRADE":11,"SCIENCE":12,"MILITARY":0,"EXTRACTION":4,"TOURISM":9,
}
var button_facilityType
var button_scenarioLocation
var button_scenarioType
var button_facilitySize


func beginGame():
	get_tree().change_scene_to_file("res://scene/terminal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#$summary.visible = false
	$summary/Button_S.connect("pressed",beginGame)

	button_facilityType = createScenarioButton("BASE")

	$VBox/HBox/VBox1.add_child(button_facilityType)
	for i in gFacility.facilityType:button_facilityType.addOption(i)

	button_scenarioLocation = createScenarioButton("EARTH_SYSTEM")
	$VBox/HBox/VBox2.add_child(button_scenarioLocation)
	for i in gScenario.scenarioLocation:button_scenarioLocation.addOption(i)
	
	button_scenarioType = createScenarioButton("SCIENCE")
	$VBox/HBox/VBox3.add_child(button_scenarioType)
	for i in gScenario.scenarioType:button_scenarioType.addOption(i)

	button_facilitySize = createScenarioButton("TINY")
	$VBox/HBox/VBox4.add_child(button_facilitySize)
	for i in gFacility.facilitySize:button_facilitySize.addOption(i)

	button_facilityType.connect("newSelection" , loadProposedScenario)
	button_scenarioLocation.connect("newSelection" , loadProposedScenario)
	button_scenarioType.connect("newSelection" , loadProposedScenario)
	button_facilitySize.connect("newSelection" , loadProposedScenario)

#		createScenarioButton(i, "res://texture/icon/Icon_"+i+".png").get_node("Button_S").connect("pressed",saveFacilitySize.bind(i))

func saveFacilitySize(choice):
	gFacility.myFacilitySize = choice

	loadProposedScenario()
	
func loadProposedScenario():
	
	gFacility.myType = button_facilityType.selectedOption
	gScenario.myScenarioLocation = button_scenarioLocation.selectedOption
	gScenario.myScenarioType = button_scenarioType.selectedOption
	gFacility.myFacilitySize = button_facilitySize.selectedOption

	gFacility.myFacilityName = "[i]" + shipNames[gFacility.myType][gScenario.myScenarioType][ randi_range(0,shipNames[gFacility.myType][gScenario.myScenarioType].size()-1)] + "[/i]"
	$summary/Label_FacilityName.text = gFacility.myFacilityName
	$summary/HBox1/Label_FacilityType.text = gFacility.myType.replace("_"," ")
	$summary/HBox1/Icon_FacilityType.texture = load("res://texture/icon/Icon_"+gFacility.myType+".png")
	$summary/HBox2/Label.text = gScenario.myScenarioLocation.replace("_"," ")
	$summary/HBox2/Icon.texture = load("res://texture/icon/Icon_"+gScenario.myScenarioLocation+".png")
	$summary/HBox3/Label.text = gScenario.myScenarioType.replace("_"," ")
	$summary/HBox3/Icon.texture = load("res://texture/icon/Icon_"+gScenario.myScenarioType+".png")
	$summary/HBox4/Label.text = gFacility.myFacilitySize.replace("_"," ")
	$summary/HBox4/Icon.texture = load("res://texture/icon/Icon_"+gFacility.myFacilitySize+".png")


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
		"EXPLORATION":[ "FRONTIER-ALPHA 1" , "FAR HORIZON PLANET-BASE"], 
		"EXTRACTION":[ "FORZEK TITANIUM MINE" ],
		"MILITARY":[ "SPARTA-NINE MILITARY BASE" ,  "OMEGA FRONTIER STATION"],
		"SCIENCE":[ "PLANETARYSCIENCE-7" , "CORE DISCOVERY PROJECT" ],
		"TOURISM":[ "ELRA LOW GRAVITY SPA" ],
		"TRADE":[ "GROUND STATION ALPHA" ]
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
