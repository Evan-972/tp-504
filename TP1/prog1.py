import fonctions as f

print ("Hello, World!")

while True:
	a = int(input("Entrez la base (a) : "))
	b = int(input("Entrez l'exposant (b) :"))
	res = f.puissance(a,b)

	print(f"resultats = ",res)

