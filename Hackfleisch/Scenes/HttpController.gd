extends Node


func _ready():
	pass

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json[0])
	
func _on_request_completed_recipe(result, response_code, headers, body):
	var jsonInst = JSON.new()
	var json = JSON.parse_string(body.get_string_from_utf8())
	return json

func request_all_recipes(function):
	$HTTPRequest.request_completed.connect(function)
	$HTTPRequest.request("http://144.126.143.118:3000/recipe")
	

func request_image(function, url):
	$HTTPRequest.request_completed.connect(function)
	$HTTPRequest.request(url)
