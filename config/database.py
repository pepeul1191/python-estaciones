import string
import random

def generator_id():
	size = 32
	chars = string.ascii_lowercase + string.digits
	return ''.join(random.choice(chars) for _ in range(size))