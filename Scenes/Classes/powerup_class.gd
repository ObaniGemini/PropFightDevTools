class_name Powerup extends Node2D

enum Type {
	Malus,
	Bonus
}

@export var type : Type = Type.Malus

func active(_id) : pass
