from faker import Faker
import random
import datetime
import uuid

bulkSeparetor = '|'
csvSeparator = ','

def replace_lines(file_name, lineIds, contents):
    lines = open(file_name, 'r').readlines()
    for index, line in enumerate(lineIds):
        if line < len(lines):
            splitted = lines[line].split(csvSeparator)
            print(splitted)
            lines[line] = splitted[0] + csvSeparator + splitted[1] + csvSeparator + contents[index]
    out = open(file_name, 'w')
    out.writelines(lines)
    out.close()

faker = Faker()
fakerPL = Faker('pl_PL')



linieLotnicze = "LinieLotnicze.bulk"
liczbaLini = 60

koordynatorzy = "Koordynatorzy.bulk"
liczbaKoordynatorow = 150

samoloty = "Samoloty.bulk"
liczbaSamolotow = 170

przeglady = "Przeglady.bulk"
liczbaPrzegladow = 12000
dateStart = datetime.datetime.strptime('2021-09-02', '%Y-%m-%d')
dateEnd = datetime.datetime.strptime('2021-12-01', '%Y-%m-%d')

zespoly = "Zespoly.csv"
liczbaZespolow = 120

# linie lotnicze
file = open(linieLotnicze, "a")
file.close()
file = open(linieLotnicze, "r+")
num_lines = sum(1 for line in file)

for i in range(num_lines,liczbaLini):
    file.write(f'{bulkSeparetor}{str(uuid.uuid4())[:4]}{bulkSeparetor}{faker.company()}\n')

file.close()

# koordynatorzy
file = open(koordynatorzy, "a")
file.close()
file = open(koordynatorzy, "r+")
num_lines = sum(1 for line in file)
for i in range(num_lines, liczbaKoordynatorow):
    file.write(f'{bulkSeparetor}{uuid.uuid4()}\n')

file.close()

# samoloty
modele = open('modeleSamolotow.txt', 'r')
modeleSamolotow = modele.readlines()
modele.close()
file = open(samoloty, "a")
file.close()
file = open(samoloty, "r+")
num_lines = sum(1 for line in file)
for i in range(num_lines, liczbaSamolotow):
    model = modeleSamolotow[random.randint(0, len(modeleSamolotow) - 1)].strip()
    rok = random.randint(1990, 2020)
    linia = random.randint(1, liczbaLini)
    kategoriaWielkosc = random.randint(0,3)
    file.write(f'{bulkSeparetor}{model}{bulkSeparetor}{rok}{bulkSeparetor}{kategoriaWielkosc}{bulkSeparetor}{linia}\n')

file.close()

# przeglądy
file = open(przeglady, 'a')
file.close()
file = open(przeglady, 'r+')
num_lines = sum(1 for line in file)
for i in range(num_lines, liczbaPrzegladow):
    data = faker.date_time_between_dates(dateStart, dateEnd)
    numerZespolu = random.randint(1, liczbaZespolow)
    samolot = random.randint(1, liczbaSamolotow)
    koordynator = random.randint(1, liczbaKoordynatorow)
    awaria = random.randint(0, 4)
    czas = f"0{random.randint(0, 2)}:{random.randint(0, 5)}{random.randint(0, 9)}"  # czas poniżej 3h
    opoznienie = f"0{random.randint(0, 2)}:{random.randint(0, 5)}{random.randint(0, 9)}"  # czas poniżej 3h
    temp = random.randint(-20, 35)
    wiatr = random.randint(0, 100)
    opady = False
    if random.randint(0, 10) > 5:
        opady = True

    if awaria == 1:
        odwolano = random.randint(1, 100) <= 10
        if odwolano:
            czas = faker.time()
    file.write(f'{bulkSeparetor}{czas}'
               f'{bulkSeparetor}{numerZespolu}'
               f'{bulkSeparetor}{opoznienie}'
               f'{bulkSeparetor}{samolot}'
               f'{bulkSeparetor}{awaria}'
               f'{bulkSeparetor}{data}'
               f'{bulkSeparetor}{koordynator}'
               f'{bulkSeparetor}{temp}'
               f'{bulkSeparetor}{int(opady)}'
               f'{bulkSeparetor}{wiatr}'
               f'\n')

file.close()

# zespoly
file = open(zespoly, 'a')
file.close()
file = open(zespoly, 'r+')
num_lines = sum(1 for line in file)
print(num_lines)
if num_lines == 0:
    file.write(f'IdentyfikatorZespolu{csvSeparator}'
               f'NazwaZespolu{csvSeparator}'
               f'IloscCzlonkowZespoluBezStazystow{csvSeparator}'
               f'IloscStazystow\n')
    num_lines += 1

lines_to_modify = random.randint(0, int(0.1 * num_lines))
lines = []
for i in range(lines_to_modify):
    lines.append(random.randint(1, num_lines))
replace_lines(zespoly, lines, [f'{random.randint(1, 10)}{csvSeparator}{random.randint(1,5)}\n' for _ in range(len(lines))])

for i in range(num_lines-1, liczbaZespolow):
    iloscCzlonkowZespolu = random.randint(1, 10)
    iloscStazystow = 0
    nazwa = uuid.uuid4()
    if random.randint(0,2) == 0:
        iloscStazystow = random.randint(1,min(3,iloscCzlonkowZespolu))
    file.write(f'{i}{csvSeparator}{nazwa}{csvSeparator}{iloscCzlonkowZespolu}{csvSeparator}{iloscStazystow}\n')

file.close()
