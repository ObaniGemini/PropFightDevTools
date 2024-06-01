class_name PowerupClass extends Node2D

enum Type {
	Malus,
	Bonus
}

@export var type : Type = Type.Malus

func active(__id) : pass
