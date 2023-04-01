extends Node

var thing: int = 9 : get=get_thing, set=set_thing

func get_thing():
	print('getting: ', thing)
	return thing

func set_thing(value):
	print('setting: ', value)
	thing = value
