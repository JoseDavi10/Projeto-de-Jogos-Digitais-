extends Control

var health = 0;
var attack = 0;
var armor = 0;
var oz = 0;
var gold = 0;

func _ready():
	$GridContainer2/UpgradeAttack.grab_focus();
	health = Save.gameData.player.health;
	attack = Save.gameData.player.attack;
	armor = Save.gameData.player.armor;
	oz = Save.gameData.player.offense_zone;
	gold = Save.gameData.player.gold;
	_update();

func _update():
	$GridContainer2/Attack.text = "Velocidade de ataque level: " +  str(attack);
	$GridContainer2/Armor.text = "Armadura level: " +  str(armor);
	$GridContainer2/Health.text = "Vida level: " +  str(health);
	$GridContainer2/OffenseZone.text = "Zona de ataque level: " +  str(oz);
	$GridContainer2/Gold.text = "Você possui  " + str(gold) +"      de ouro";

#adicionar ouro a cada ataque acertado
func _on_UpgradeAttack_pressed():
	if gold >= 10:
		attack += 1;
		Save.gameData.player.attack = attack;
		gold -= 10;
		Save.gameData.player.gold = gold;
		Save.save_data();
		_update();

#adicionar vida a auto-defesa (cura)
func _on_UpgradeHealth_pressed():
	if gold >= 10:
		health += 1;
		Save.gameData.player.health = health;
		gold -= 10;
		Save.gameData.player.gold = gold;
		Save.save_data();
		_update();

func _on_UpgradeOffenseZone_pressed():
	if gold >= 10:
		oz += 1;
		Save.gameData.player.offense_zone = oz;
		gold -= 10;
		Save.gameData.player.gold = gold;
		Save.save_data();
		_update();

#armadura quando receber danos
func _on_UpgradeArmor_pressed():
	if gold >= 10:
		armor += 1;
		Save.gameData.player.armor = armor;
		gold -= 10;
		Save.gameData.player.gold = gold;
		Save.save_data();
		_update();

func _on_Return_pressed():
	return get_tree().change_scene("res://Menu/Menu.tscn");
