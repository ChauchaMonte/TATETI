
extends Node2D

var circulo = load("res://assents/img/o.png")

func change_o():
	get_node("img_xo").set_texture(circulo)
