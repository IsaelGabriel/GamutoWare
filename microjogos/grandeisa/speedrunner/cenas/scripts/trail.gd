extends Line2D


@export var tracked_node: Node2D
@export var max_points: int = 50

var queue: Array[Vector2]

	
func _process(delta):
	if not queue.has(tracked_node.position):
		queue.push_front(tracked_node.position)
	if len(queue) > max_points:
		queue.pop_back()
	
	clear_points()
	
	for point in queue: 
		add_point(point)

func _on_timer_timeout():
	queue.pop_back()
