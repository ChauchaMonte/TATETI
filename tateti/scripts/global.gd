
extends Node

var figure = load("res://scenas/xo.tscn")
var current_figure = 0 # 0=x 1=y
var contador_jugadas=0
const RES = 360
var board = [[-1,-1,-1],
			 [-1,-1,-1],
			 [-1,-1,-1]]
var win_or_draw = -2 # si es -1 = draw | 0 x win | 1 y win 

func figure_pos(x, y):
	if board[y][x]==-1:
		add_element_to_board(y,x)
		if x==0 and y==0:
			generate_figure(RES / 4 - 35, RES / 4 - 35)
		elif x==0 and y==1:
			generate_figure(RES / 4 - 35, RES / 2)
		elif x==0 and y==2:
			generate_figure(RES / 4 - 35, RES - 50)
		elif x==1 and y==0:
			generate_figure(RES / 2, RES / 4 - 35)
		elif x==1 and y==1:
			generate_figure(RES / 2, RES / 2)
		elif x==1 and y==2:
			generate_figure(RES / 2, RES - 50)
		elif x==2 and y==0:
			generate_figure(RES - 50, RES / 4 - 35)
		elif x==2 and y==1:
			generate_figure(RES - 50, RES / 2)
		elif x==2 and y==2:
			generate_figure(RES - 50, RES - 50)
		check_win()
		change_figure()
	else: 
		print("pos ocupada")

func generate_figure(x,y):
	var fig_instance = figure.instance()
	add_child(fig_instance) 
	if current_figure ==1 :
		fig_instance.change_o()
	fig_instance.add_to_group("figuras")
	fig_instance.set_pos(Vector2(x,y))

func change_figure():
	if current_figure == 0:
		current_figure=1
	elif current_figure==1:
		current_figure=0

func add_element_to_board (x, y):
	board[x][y] = current_figure

func check_win():
	contador_jugadas+=1
	var i = 0
	while i <= 2:
		# horizontal
		if board[i][0]==board[i][1] and board[i][0]==board[i][2] and board[i][0]!=-1:
			win_or_draw = current_figure
			get_tree().change_scene("res://scenas/final.tscn")
		# vertical
		if board[0][i]==board[1][i] and board[0][i]==board[2][i] and board[0][i]!=-1:
			win_or_draw = current_figure
			get_tree().change_scene("res://scenas/final.tscn")
		i+=1
		# diagonal
	if board[0][0]==board[1][1] and board[0][0]==board[2][2] and board[0][0]!=-1:
		win_or_draw = current_figure
		get_tree().change_scene("res://scenas/final.tscn")
	elif board[2][0]==board[1][1] and board[2][0]==board[0][2] and board[2][0]!=-1:
		win_or_draw = current_figure
		get_tree().change_scene("res://scenas/final.tscn")
	elif contador_jugadas==9:
		win_or_draw = -1
		get_tree().change_scene("res://scenas/final.tscn")
func remove_figure():
	for i in get_tree().get_nodes_in_group("figuras"):
		i.queue_free()
func cleaner_variables():
	figure = load("res://scenas/xo.tscn")
	current_figure = 0 # 0=x 1=y
	contador_jugadas = 0
	board = [[-1,-1,-1],
			 [-1,-1,-1],
			 [-1,-1,-1]]
	win_or_draw = -2 # si es -1 = draw | 0 x win | 1 y win 
	