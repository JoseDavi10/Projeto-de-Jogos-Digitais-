extends Node

func _ready():
	Save.load_data();
	$VBoxContainer/Play.grab_focus();
	GlobalSettings.togglefullscreen(Save.gameData.fullscreen_on);
	GlobalSettings.toggleVsync(Save.gameData.vsync_on);
	GlobalSettings.updateShortcut();
	$Label.text = "Ouro: " + str(Save.gameData.player.gold);

func _on_Play_pressed(): #abre a tela de jogo
	return get_tree().change_scene("res://Main.tscn");

func _on_Player_Stats_pressed(): #abre as estatísticas de jogo
	return get_tree().change_scene("res://Menu/StatsMenu.tscn");

func _on_Settings_pressed(): #abre as configurações do jogo
	return get_tree().change_scene("res://Menu/SettingsMenu.tscn");

func _on_Exit_pressed():
	get_tree().quit();

func _on_Time_item_focused(index):
	if index == 0:
		Save.gameData.time = 2;
	if index == 1:
		Save.gameData.time = 5;
	if index == 2:
		Save.gameData.time = 10;
	Save.save_data();
