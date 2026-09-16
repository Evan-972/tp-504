def puissance(a,b):
	if type(a) is int and type(b) is int:
		return a**b
	else:
		raise TypeError ("Only integers are allowed")
