extends Node2D

var time = 0;
var endTimer = Save.gameData.time;
# função para determinar o tempo que o jogador irá escolher para participar da partida
func _process(delta):
	time += delta;
	var mins = fmod(time, 60 * 60) / 60; #regenera vida
	if mins >= endTimer:
		return get_tree().change_scene("res://Menu/Victory.tscn");

