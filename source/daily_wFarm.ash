import DailyMpRestore.ash
import DailyLocations.ash
import DailyUseCasts.ash
import DailyFreeFights.ash
import MeatFarmDinsey.ash
import DailyNoms.ash

string olfact_tourist(int round, monster opp, string text) 
{
	if(opp == $monster[garbage tourist])
		if(round == 1 && have_effect($effect[On the Trail]) < 1)
			return "skill transcendent olfaction";
		if(round > 1 && have_effect($effect[On the Trail]) == 40)
			round -= 1;
	return get_ccs_action(round);
}

void daily_chores()
{
	generate_reagents();
	generate_noodles();
	generate_cocktail_ingredients();
	generate_sugar_sheets();
	generate_smithsness();
	generate_clip_art("box of Familiar Jacks", 9999);
	generate_perfect_ice_cubes();
	generate_army_cards();
	generate_confiscated_things();
	generate_prismatic_wads();
	generate_cold_one();
	generate_spaghetti_breakfast();
	generate_crimbo_candy();
	generate_single_atom();
	generate_chroners();
	generate_chester_candy();
	cheat_deck_every_card("Island");
	cheat_deck_every_card("Rope");
	generate_bacon();
	generate_kardashians(14999);
	generate_pocket_wishes(49999);
	get_clovers();
	harvest_Chateau_Juice_Bar();
	harvest_tea_tree(99999);
	harvest_gene_tonics();
	harvest_terminal_booze(9999);
	harvest_terminal_buffs();
	harvest_garden();
	harvest_clan_meat_tree();
	harvest_mr_klaw();
	harvest_floundry();
	harvest_clan_mirror();
	harvest_clan_shower();
	harvest_clan_pool();
	harvest_clan_fax();
	visit_hippy_store();
	check_plumber_arcade();
	visit_precinct_headquarters();
	harvest_sea_jelly();
	harvest_dinsey_maint_tunnel();
	harvest_inferno_tower();
	harvest_wlf_bunker();
	harvest_velvet_gold_mine(5, false);
	operate_control_panel();
}
	
void meat_farm_prep()
{	
	meatFarm_create_copiers();
	kbg_briefcase_buff();
	get_dark_horse();	
}
	
void fight_freely()
{
	set_auto_attack(0);
	free_fight_deck_penguin();
	use_familiar($familiar[Golden Monkey]);
	equip($slot[weapon], $item[Meat Tenderizer is Murder]);
	free_fight_snojo();
	free_fight_bricko();
	free_fight_witchess();
	free_fight_eldritch_tent();
	free_fight_eldritch_skill();
	free_fight_machine_tunnel();
}

void main()
{
	if(property_exists("_dailyDone"))
		print("Daily scripts already run today", "blue");
	else
	{
		if(my_name()=="jag2k2")
		{
			if(my_inebriety() > inebriety_limit())
				print("jag2k2 is too drunk to adventure anymore", "blue");
			else
			{
				daily_chores();
				nom_noms("hi mein", true);
				
				fight_freely();
				
				nom_noms("jumping horseradish", false);	
				nom_noms("perfect booze", true);
				nom_noms("Ambitious Turkey", false);
				nom_noms("Cold One", false);
				nom_noms("4-size spleen", true);
				nom_noms("3-size spleen", false);

				meat_farm_prep();
				
				int adv = 95;	
				//use_GreenSpan();
				self_buff_meat_effects(adv);
				meatFarm_base_potions(adv);
				meatFarm_fam_equip();								// Meat farm buff equips MP reduction gear and base Potions equips Travoltan Trousers.  Need to equip farm equipment before adventuring.
				adventure(adv , $location[Barf Mountain], "olfact_tourist");
				
				generate_resolutions(100);
				once_daily_meatBuffs();								// LOVE Tunnel restores all MP
				generate_resolutions(100);
				use(1, $item[License to Chill]);					// Get 5 adv and restore all MP
				generate_resolutions(100);
				use(1, $item[Platinum Yendorian Express Card]);		// Extend all buffs by 5 and restore all MP
				generate_resolutions(50);
				
				adv = my_adventures();
				self_buff_meat_effects(adv);
				meatFarm_base_potions(adv);
				meatFarm_fam_equip();								// Meat farm buff equips MP reduction gear and base Potions equips Travoltan Trousers.  Need to equip farm equipment before adventuring.
				adventure(adv , $location[Barf Mountain], "olfact_tourist");
				
				outfit("adventure pajamas");
				use_familiar($familiar[Trick-or-Treating Tot]);
				
				if(have_effect($effect[Fat Leon's Phat Loot Lyric]) > 0)
					cli_execute("uneffect Fat Leon's Phat Loot Lyric");
				if(have_effect($effect[Ode to Booze]) < 10)
					use_skill(1, $skill[The Ode to Booze]);
				
				overdrink(1, $item[cherry bomb]);
				if(item_amount($item[tiny plastic sword]) > 0)		// Just to ensure mafia doesn't try and purchase a tps from the mall
					cli_execute("mix cherry bomb");
				if(have_effect($effect[Ode to Booze]) > 0)
					cli_execute("uneffect Ode to Booze");
			}
			
			if(!property_exists("_dailyDoneZed"))
			{
				set_property("_dailyDoneZed", "true");
				cli_execute("login zeddemore");
			}
			if(!property_exists("_dailyDoneBoba"))
			{
				set_property("_dailyDoneBoba", "true");
				cli_execute("login Boba the Fett");
			}
		}
		
		if(my_name()=="zeddemore")
		{
			if(my_inebriety() > inebriety_limit())
				print("Zeddemore is too drunk to adventure anymore", "blue");
			else
			{
				outfit("Max MP");
				meat_farm_cast_buffs(500);
				nom_noms("hi mein", true);
				nom_noms("perfect booze", true);
				nom_noms("1-size booze", true);
				nom_noms("4-size spleen", true);
				nom_noms("3-size spleen", true);
				outfit("volcano mining");
				harvest_velvet_gold_mine(my_adventures(), true);
				
				outfit("Adventure Pajamas");
				if(have_effect($effect[Ode to Booze]) < 10)
					use_skill($skill[The Ode to Booze]);
				retrieve_item(1, $item[Psychotic Train Wine]);
				overdrink(1, $item[Psychotic Train Wine]);
			}	
			print("Zed done", "blue");
			cli_execute("login jag2k2");
		}
			
		if(my_name()=="Boba the Fett")
		{			
			if(my_inebriety() > inebriety_limit())
				print("Boba the Fett is too drunk to adventure anymore", "blue");
			else
			{
				outfit("Max MP");
				meat_farm_cast_buffs(500);
				nom_noms("hi mein", true);
				nom_noms("perfect booze", true);
				nom_noms("1-size booze", true);
				nom_noms("4-size spleen", true);
				nom_noms("3-size spleen", true);
				outfit("volcano mining");
				harvest_velvet_gold_mine(my_adventures(), true);
				
				outfit("Adventure Pajamas");
				if(have_effect($effect[Ode to Booze]) < 10)
					use_skill($skill[The Ode to Booze]);
				retrieve_item(1, $item[Psychotic Train Wine]);
				overdrink(1, $item[Psychotic Train Wine]);
			}
			print("Boba done", "blue");
			cli_execute("login jag2k2");
		}
		set_property("_dailyDone", "true");
		cli_execute("exit");
	}	
}

