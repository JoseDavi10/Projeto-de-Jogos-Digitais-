extends Control
#definindo destino após perder o jogo
func _ready():
	$Button.grab_focus();

func _on_Button_pressed(): #direcionar à outra partida 
	get_tree().change_scene("res://Main.tscn");

func _on_Button2_pressed(): #direcionar ao menu inicial do jogo
	get_tree().change_scene("res://Menu/Menu.tscn");
