import carla
client = carla.Client('localhost', 2000)
client.set_timeout(10.0)
map_name = 'Town01'
world = client.load_world(map_name)
client.disconnect()
