
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	global.remove_figure()
	if global.win_or_draw==0:
		get_node("display").set_text("¡¡RED WIN!!")
	elif global.win_or_draw==1:
		get_node("display").set_text("¡¡BLUE WIN!!")
	else :
		get_node("display").set_text("¡¡EMPATEE!!")

func _on_btn_volver_pressed():
	global.cleaner_variables()
	get_tree().change_scene("res://scenas/board.tscn")
