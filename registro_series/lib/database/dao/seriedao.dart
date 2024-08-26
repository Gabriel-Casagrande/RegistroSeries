import 'package:registro_series/database/db.dart';
import 'package:registro_series/model/serie.dart';
import 'package:sqflite/sqflite.dart';

Future<int> insertSerie(Serie serie) async {
  Database db = await getDatabase();
  return db.insert('series', serie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Serie>> findAll() async {
  Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('series');

  return List.generate(maps.length, (i) {
    return Serie.fromMap(maps[i]);
  });
}

Future<int> deleteById(int id) async {
  Database db = await getDatabase();
  return db.delete('series', where: 'id = ?', whereArgs: [id]);
}

void insertTodasSeries() async {
  Database db = await getDatabase();
  await db.insert('series', {
    'nome': 'Game of Thrones',
    'progresso': 0.7,
    'avaliacao': 5,
    'sinopse':
        'Em uma terra onde os verões podem durar vários anos e o inverno toda uma vida, as reivindicações e as forças sobrenaturais correm as portas do Reino dos Sete Reinos. A irmandade da Patrulha da Noite busca proteger o reino de cada criatura que pode vir de lá da Muralha, mas já não tem os recursos necessários para garantir a segurança de todos. Depois de um verão de dez anos, um inverno rigoroso promete chegar com um futuro mais sombrio. Enquanto isso, conspirações e rivalidades correm no jogo político pela disputa do Trono de Ferro, o símbolo do poder absoluto.'
  });
  await db.insert('series', {
    'nome': 'Breaking Bad',
    'progresso': 0.5,
    'avaliacao': 5,
    'sinopse':
        'Walter White (Bryan Cranston) é um professor de química na casa dos 50 anos que trabalha em uma escola secundária no Novo México. Para atender às necessidades de Skyler (Anna Gunn), sua esposa grávida, e Walt Junior (RJ Mitte), seu filho deficiente físico, ele tem que trabalhar duplamente. Sua vida fica ainda mais complicada quando descobre que está sofrendo de um câncer de pulmão incurável. Para aumentar rapidamente a quantidade de dinheiro que deixaria para sua família após sua morte, Walter usa seu conhecimento de química para fazer e vender metanfetamina, uma droga sintética. Ele conta com a ajuda do ex-aluno e pequeno traficante Jesse (Aaron Paul) e enfrenta vários desafios, incluindo o fato de seu concunhado ser um importante nome dentro da Agência Anti-Drogas da região.'
  });
  await db.insert('series', {
    'nome': 'The Office',
    'progresso': 0.9,
    'avaliacao': 5,
    'sinopse':
        'The Office retrata o cotidiano de um escritório em Scranton, na Pensilvânia. Filial da empresa fictícia Dunder Mifflin, os funcionários tem como função vender o suprimento de papel fornecido pela companhia. Michael Scott (Steve Carell), gerente da franquia, é um chefe incoerente e imaturo mas que se preocupa com o bem estar de seus empregados. Assim, The Office traça um olhar cômico e honesto sobre seus personagens, destacando suas diferenças e particularidades e como isso afeta a convivência diária durante o trabalho. Embora, à princípio, não exista um laço emocional muito forte entre eles, aos poucos amizades são formadas e os funcionários da Dunder Mifflin se tornam uma espécie de segunda família. Entre as relações mais memoráveis de The Office está o casal Jim (John Krasinski), um vendedor, e Pam (Jenna Fischer), a recepcionista. Ao longo das temporadas, a adorável amizade entre os dois se transforma em um intenso amor romântico.'
  });

  await db.insert('series', {
    'nome': 'House of the Dragon',
    'progresso': 0.0,
    'avaliacao': 4,
    'sinopse':
        "House of the Dragon é um spin-off de Game of Thrones que narra a história de conquista de terras em Westeros, mais conhecida como a Dança dos Dragões. Situada mais de 200 anos antes dos eventos da série original, em A Casa do Dragão acompanhamos a guerra civil que acontece enquanto os meio-irmãos Aegon II (Tom Glynn-Carney) e Rhaenyra (Emma D'Arcy) almejam o trono após a morte do pai Viserys I (Paddy Considine). Rhaenyra é a filha mais velha, contudo, Aegon é o filho homem de um segundo casamento, o que acaba gerando uma crescente tensão entre dois clãs Targaryen sobre quem tem o verdadeiro direito ao trono. Como descrito em Game of Thrones, no tempo em que a família Targaryen dominava os 7 reinos, a casa era conhecida por seus imponentes dragões, que assim como a família, acabaram praticamente extintos após o conflito interno."
  });
  await db.insert('series', {
    'nome': 'KnightFall',
    'progresso': 0.0,
    'avaliacao': 4,
    'sinopse':
        'O colapso dos Cavaleiros Templários após o cerco de Acre, onde perderam tanto a Terra Santa como o Santo Graal.'
  });
  await db.insert('series', {
    'nome': 'The Last Kingdom',
    'progresso': 0.0,
    'avaliacao': 5,
    'sinopse':
        'Enquanto Alfredo, o Grande, defende seu reino de invasões nórdicas, Uhtred, um saxão criado por vikings, planeja reivindicar o que é seu por direito.'
  });
  await db.insert('series', {
    'nome': 'Better Call Saul',
    'progresso': 0.0,
    'avaliacao': 5,
    'sinopse':
        'Série derivada do sucesso Breaking Bad, é ambientada seis anos antes de Saul Goodman (Bob Odenkirk) conhecer Walter White (Brian Cranston) e Jesse Pinkman (Aaron Paul). Quando o conhecemos, o homem que se tornará Saul Goodman é conhecido como Jimmy McGill, um advogado de pequenas causas procurando o próprio destino e, mais imediatamente, tentando acertar sua vida financeira. Além da fracassada carreira no direito, ele precisa cuidar do irmão mais bem-sucedido, Chuck (Michael McKean), que embora seja um brilhante advogado, está passando por um grave problema de saúde mental. Trabalhando ora junto a ele e ora contra, também está o faz-tudo Mike Erhmantraut (Jonathan Banks). A série acompanhará a transformação de Jimmy em Saul Goodman, o homem que coloca "criminosos" dentro da "lei". Embora, à principio, apenas cometa pequenos crimes, Jimmy acaba se envolvendo com pessoas muito perigosas do cartel, entre eles Nacho Varga (Michael Mando) e Tuco Salacamanca (Raymund Cruz).'
  });
  await db.insert('series', {
    'nome': 'Narcos',
    'progresso': 0.0,
    'avaliacao': 4,
    'sinopse':
        'A vida e a morte de Pablo Escobar (Wagner Moura), um dos maiores narcotraficantes do mundo, chefe do Cartel de Medellín, na Colômbia. Escobar também era conhecido por ser um homem de família e reverenciado pela população mais pobre como um tipo de Robin Hood.'
  });
  await db.insert('series', {
    'nome': 'Peaky Blinders',
    'progresso': 0.0,
    'avaliacao': 3,
    'sinopse':
        'Em Peaky Blinders, Thomas Shelby (Cillian Murphy) e seus irmãos retornam a Birmingham depois de servir no exército britânico durante a Primeira Guerra Mundial. Shelby e os Peaky Blinders, a gangue de criminosos da qual ele é líder, controlam a cidade com mãos de ferro, construindo um império que vai desde corridas de cavalo adulteradas e roubo de carregamentos até parcerias secretas com os russos. Mas as ambições de Shelby se estendem para além de Birmingham, e ele não vai deixar que ninguém atrapalhe seus planos de se tornar um dos homens mais poderosos do Reino Unido. À medida que sua família se destaca nos negócios, novas alianças se formam, bem como novas e perigosas rivalidades. Ao mesmo tempo que vive as transformações políticas, econômicas e sociais do início do século 20, Shelby precisa lidar com os traumas de seu próprio passado - que parecem atormentá-lo diariamente.'
  });
  await db.insert('series', {
    'nome': 'Stranger Things',
    'progresso': 0.0,
    'avaliacao': 4,
    'sinopse':
        'Situada no início dos anos 1980, Stranger Things se passa na cidade rural fictícia de Hawkins, Indiana. Como fachada, o laboratório da região realizava experimentos científicos para o Departamento de Energia Americano, quando na realidade, os pesquisadores ali investiram em experimentos com o paranormal e o sobrenatural, incluindo o uso de cobaias humanas. Não intencionalmente, eles criaram um portal para uma dimensão alternativa conhecida como Mundo Invertido, o que iria impactar a vida dos residentes da pequena cidade. Em 1983, quando Will Byers (Noah Schnapp), um menino de 12 anos, desaparece misteriosamente, o xerife Jim Hopper (David Harbour) inicia uma operação para encontrá-lo. Enquanto isso, Mike (Finn Wolfhard), Dustin (Gaten Matarazzo) e Lucas (Caleb McLaughlin), melhores amigos de Will, decidem procurá-lo por conta própria. Mas as investigações acabam levando o grupo em direção aos experimentos secretos do governo e a Eleven (Millie Bobby Brown), uma peculiar menina perdida na floresta. Assim como as crianças, a mãe Joyce Byers (Winona Ryder) está determinada e fará o impossível para rever o filho.'
  });
}

void insertTodosEpisodios() async {
  Database db = await getDatabase();

  List<Map<String, dynamic>> gameOfThrones = await db
      .query('series', where: 'nome = ?', whereArgs: ['Game of Thrones']);
  int gameOfThronesId = gameOfThrones.first['id'];

  List<Map<String, dynamic>> breakingBad =
      await db.query('series', where: 'nome = ?', whereArgs: ['Breaking Bad']);
  int breakingBadId = breakingBad.first['id'];

  List<Map<String, dynamic>> theOffice =
      await db.query('series', where: 'nome = ?', whereArgs: ['The Office']);
  int theOfficeId = theOffice.first['id'];

  List<Map<String, dynamic>> houseOfTheDragon = await db
      .query('series', where: 'nome = ?', whereArgs: ['House of the Dragon']);
  int houseOfTheDragonId = houseOfTheDragon.first['id'];

  List<Map<String, dynamic>> knightfall =
      await db.query('series', where: 'nome = ?', whereArgs: ['KnightFall']);
  int knightfallId = knightfall.first['id'];

  List<Map<String, dynamic>> theLastKingdom = await db
      .query('series', where: 'nome = ?', whereArgs: ['The Last Kingdom']);
  int theLastKingdomId = theLastKingdom.first['id'];

  List<Map<String, dynamic>> betterCallSaul = await db
      .query('series', where: 'nome = ?', whereArgs: ['Better Call Saul']);
  int betterCallSaulId = betterCallSaul.first['id'];

  List<Map<String, dynamic>> narcos =
      await db.query('series', where: 'nome = ?', whereArgs: ['Narcos']);
  int narcosId = narcos.first['id'];

  List<Map<String, dynamic>> peakyBlinders = await db
      .query('series', where: 'nome = ?', whereArgs: ['Peaky Blinders']);
  int peakyBlindersId = peakyBlinders.first['id'];

  List<Map<String, dynamic>> strangerThings = await db
      .query('series', where: 'nome = ?', whereArgs: ['Stranger Things']);
  int strangerThingsId = strangerThings.first['id'];

  //GAME OF THRONES
  //GAME OF THRONES
  //GAME OF THRONES
  //GAME OF THRONES

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Winter Is Coming - "Winterfell"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Kingsroad - "A Estrada do Rei"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Lord Snow - "Lord Snow"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome':
        'Cripples, Bastards, and Broken Things - "Aleijados, Bastardos e Coisas Quebradas"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Wolf and the Lion - "O Lobo e o Leão"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'A Golden Crown - "Uma Coroa de Ouro"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'You Win or You Die - "Você Ganha ou Morre"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Pointy End - "O Fim Afiado"',
    'tempo': 62,
    'episodio': 8,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Baelor - "Baelor"',
    'tempo': 62,
    'episodio': 9,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Fire and Blood - "Fogo e Sangue"',
    'tempo': 62,
    'episodio': 10,
    'temporada': 1,
    'serie_id': gameOfThronesId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'The North Remembers - "O Norte se Lembra"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Night Lands - "Terras da Noite"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'What Is Dead May Never Die - "O Que Está Morto Pode Nunca Morrer"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Garden of Bones - "Jardim dos Ossos"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Ghost of Harrenhal - "O Fantasma de Harrenhal"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Prince of Winterfell - "O Príncipe de Winterfell"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'A Man Without Honor - "Um Homem Sem Honra"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Prince of Winterfell - "O Príncipe de Winterfell"',
    'tempo': 62,
    'episodio': 8,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Blackwater - "Águas Negras"',
    'tempo': 62,
    'episodio': 9,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Valar Morghulis - "Valar Morghulis"',
    'tempo': 62,
    'episodio': 10,
    'temporada': 2,
    'serie_id': gameOfThronesId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'Valar Dohaeris - "Valar Dohaeris"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Dark Wings, Dark Words - "Asas Negras, Palavras Negras"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Walk of Punishment - "Caminho da Punição"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'And Now His Watch Is Ended - "E Agora Sua Vigília Terminou"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Kissed by Fire - "Beijado pelo Fogo"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Climb - "A Escalada"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Bear and the Maiden Fair - "O Urso e a Donzela Justa"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Second Sons - "Segundos Filhos"',
    'tempo': 62,
    'episodio': 8,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Rains of Castamere - "As Chuvas de Castamere"',
    'tempo': 62,
    'episodio': 9,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Mhysa - "Mhysa"',
    'tempo': 62,
    'episodio': 10,
    'temporada': 3,
    'serie_id': gameOfThronesId
  });

// Temporada 4
  await db.insert('episodios', {
    'nome': 'Two Swords - "Duas Espadas"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Lion and the Rose - "O Leão e a Rosa"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Breaker of Chains - "Quebradora de Correntes"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Oathkeeper - "Guardião do Juramento"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'First of His Name - "Primeiro de Seu Nome"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Laws of Gods and Men - "As Leis dos Deuses e dos Homens"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Mockingbird - "O Pássaro Zombeteiro"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Mountain and the Viper - "A Montanha e a Víbora"',
    'tempo': 62,
    'episodio': 8,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Watchers on the Wall - "Os Guardiões da Muralha"',
    'tempo': 62,
    'episodio': 9,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Children - "As Crianças"',
    'tempo': 62,
    'episodio': 10,
    'temporada': 4,
    'serie_id': gameOfThronesId
  });

// Temporada 5
  await db.insert('episodios', {
    'nome': 'The Wars to Come - "As Guerras Que Virão"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The House of Black and White - "A Casa do Preto e Branco"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'High Sparrow - "Alto Pardal"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Sons of the Harpy - "Filhos da Harpia"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Kill the Boy - "Mate o Menino"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Unbowed, Unbent, Unbroken - "Incurvado, Inflexível, Intocado"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Gift - "O Presente"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Hardhome - "Hardhome"',
    'tempo': 62,
    'episodio': 8,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Dance of Dragons - "A Dança dos Dragões"',
    'tempo': 62,
    'episodio': 9,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Mother’s Mercy - "A Misericórdia da Mãe"',
    'tempo': 62,
    'episodio': 10,
    'temporada': 5,
    'serie_id': gameOfThronesId
  });

// Temporada 6
  await db.insert('episodios', {
    'nome': 'The Red Woman - "A Mulher Vermelha"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Home - "Lar"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Oathbreaker - "Quebrador de Juramentos"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Book of the Stranger - "O Livro do Estranho"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Door - "A Porta"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Blood of My Blood - "Sangue do Meu Sangue"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Broken Man - "O Homem Quebrado"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'No One - "Ninguém"',
    'tempo': 62,
    'episodio': 8,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Battle of the Bastards - "Batalha dos Bastardos"',
    'tempo': 62,
    'episodio': 9,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Winds of Winter - "Os Ventos de Inverno"',
    'tempo': 62,
    'episodio': 10,
    'temporada': 6,
    'serie_id': gameOfThronesId
  });

// Temporada 7
  await db.insert('episodios', {
    'nome': 'Dragonstone - "Pedra do Dragão"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Stormborn - "Nascida da Tempestade"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Queen’s Justice - "A Justiça da Rainha"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Spoils of War - "Os Despojos da Guerra"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Eastwatch - "Vigilância Oriental"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'Beyond the Wall - "Além da Muralha"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Dragon and the Wolf - "O Dragão e o Lobo"',
    'tempo': 62,
    'episodio': 7,
    'temporada': 7,
    'serie_id': gameOfThronesId
  });

// Temporada 8
  await db.insert('episodios', {
    'nome': 'Winterfell - "Winterfell"',
    'tempo': 62,
    'episodio': 1,
    'temporada': 8,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'A Knight of the Seven Kingdoms - "Um Cavaleiro dos Sete Reinos"',
    'tempo': 62,
    'episodio': 2,
    'temporada': 8,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Long Night - "A Longa Noite"',
    'tempo': 62,
    'episodio': 3,
    'temporada': 8,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Last of the Starks - "O Último dos Starks"',
    'tempo': 62,
    'episodio': 4,
    'temporada': 8,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Bells - "Os Sinos"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 8,
    'serie_id': gameOfThronesId
  });

  await db.insert('episodios', {
    'nome': 'The Iron Throne - "O Trono de Ferro"',
    'tempo': 62,
    'episodio': 6,
    'temporada': 8,
    'serie_id': gameOfThronesId
  });

  //BREAKING BAD
  //BREAKING BAD
  //BREAKING BAD
  //BREAKING BAD
  //BREAKING BAD

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Pilot - Breaking Bad',
    'tempo': 58,
    'episodio': 1,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Cat’s in the Bag… - Breaking Bad',
    'tempo': 48,
    'episodio': 2,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': '…And the Bag’s in the River - Breaking Bad',
    'tempo': 48,
    'episodio': 3,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Cancer Man - Breaking Bad',
    'tempo': 47,
    'episodio': 4,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Gray Matter - Breaking Bad',
    'tempo': 48,
    'episodio': 5,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Crazy Handful of Nothin’ - Breaking Bad',
    'tempo': 48,
    'episodio': 6,
    'temporada': 1,
    'serie_id': breakingBadId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'Seven Thirty-Seven - Breaking Bad',
    'tempo': 47,
    'episodio': 1,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Grilled - Breaking Bad',
    'tempo': 47,
    'episodio': 2,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Bit by a Dead Bee - Breaking Bad',
    'tempo': 47,
    'episodio': 3,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Down - Breaking Bad',
    'tempo': 47,
    'episodio': 4,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Breakage - Breaking Bad',
    'tempo': 48,
    'episodio': 5,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Peekaboo - Breaking Bad',
    'tempo': 48,
    'episodio': 6,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Negro y Azul - Breaking Bad',
    'tempo': 48,
    'episodio': 7,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Better Call Saul - Breaking Bad',
    'tempo': 47,
    'episodio': 8,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': '4 Days Out - Breaking Bad',
    'tempo': 47,
    'episodio': 9,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Over - Breaking Bad',
    'tempo': 48,
    'episodio': 10,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Mandala - Breaking Bad',
    'tempo': 48,
    'episodio': 11,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Phoenix - Breaking Bad',
    'tempo': 48,
    'episodio': 12,
    'temporada': 2,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'ABQ - Breaking Bad',
    'tempo': 48,
    'episodio': 13,
    'temporada': 2,
    'serie_id': breakingBadId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'No Mas - Breaking Bad',
    'tempo': 47,
    'episodio': 1,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Caballo Sin Nombre - Breaking Bad',
    'tempo': 47,
    'episodio': 2,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'I.F.T. - Breaking Bad',
    'tempo': 47,
    'episodio': 3,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Green Light - Breaking Bad',
    'tempo': 48,
    'episodio': 4,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Más - Breaking Bad',
    'tempo': 48,
    'episodio': 5,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Sunset - Breaking Bad',
    'tempo': 48,
    'episodio': 6,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'One Minute - Breaking Bad',
    'tempo': 48,
    'episodio': 7,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'I See You - Breaking Bad',
    'tempo': 48,
    'episodio': 8,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Kafkaesque - Breaking Bad',
    'tempo': 48,
    'episodio': 9,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Fly - Breaking Bad',
    'tempo': 48,
    'episodio': 10,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Abiquiú - Breaking Bad',
    'tempo': 48,
    'episodio': 11,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Half Measures - Breaking Bad',
    'tempo': 48,
    'episodio': 12,
    'temporada': 3,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Full Measure - Breaking Bad',
    'tempo': 48,
    'episodio': 13,
    'temporada': 3,
    'serie_id': breakingBadId
  });

// Temporada 4
  await db.insert('episodios', {
    'nome': 'Box Cutter - Breaking Bad',
    'tempo': 47,
    'episodio': 1,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Thirty-Eight Snub - Breaking Bad',
    'tempo': 47,
    'episodio': 2,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Open House - Breaking Bad',
    'tempo': 47,
    'episodio': 3,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Bullet Points - Breaking Bad',
    'tempo': 47,
    'episodio': 4,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Shotgun - Breaking Bad',
    'tempo': 47,
    'episodio': 5,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Cornered - Breaking Bad',
    'tempo': 47,
    'episodio': 6,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Problem Dog - Breaking Bad',
    'tempo': 47,
    'episodio': 7,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Hermanos - Breaking Bad',
    'tempo': 47,
    'episodio': 8,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Bug - Breaking Bad',
    'tempo': 47,
    'episodio': 9,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Salud - Breaking Bad',
    'tempo': 47,
    'episodio': 10,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Crawl Space - Breaking Bad',
    'tempo': 47,
    'episodio': 11,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'End Times - Breaking Bad',
    'tempo': 47,
    'episodio': 12,
    'temporada': 4,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Face Off - Breaking Bad',
    'tempo': 47,
    'episodio': 13,
    'temporada': 4,
    'serie_id': breakingBadId
  });

// Temporada 5
  await db.insert('episodios', {
    'nome': 'Live Free or Die - Breaking Bad',
    'tempo': 47,
    'episodio': 1,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Madrigal - Breaking Bad',
    'tempo': 47,
    'episodio': 2,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Hazard Pay - Breaking Bad',
    'tempo': 47,
    'episodio': 3,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Fifty-One - Breaking Bad',
    'tempo': 47,
    'episodio': 4,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Dead Freight - Breaking Bad',
    'tempo': 47,
    'episodio': 5,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Buyout - Breaking Bad',
    'tempo': 47,
    'episodio': 6,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Say My Name - Breaking Bad',
    'tempo': 47,
    'episodio': 7,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Gliding Over All - Breaking Bad',
    'tempo': 47,
    'episodio': 8,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Blood Money - Breaking Bad',
    'tempo': 47,
    'episodio': 9,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Buried - Breaking Bad',
    'tempo': 47,
    'episodio': 10,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Confessions - Breaking Bad',
    'tempo': 47,
    'episodio': 11,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Rabid Dog - Breaking Bad',
    'tempo': 47,
    'episodio': 12,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'To\'hajiilee - Breaking Bad',
    'tempo': 47,
    'episodio': 13,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Ozymandias - Breaking Bad',
    'tempo': 47,
    'episodio': 14,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Granite State - Breaking Bad',
    'tempo': 47,
    'episodio': 15,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Felina - Breaking Bad',
    'tempo': 47,
    'episodio': 16,
    'temporada': 5,
    'serie_id': breakingBadId
  });

  // THE OFFICE
  // THE OFFICE
  // THE OFFICE
  // THE OFFICE
  // THE OFFICE

  await db.insert('episodios', {
    'nome': 'Pilot – "Piloto"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 1,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Diversity Day – "Dia da Diversidade"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 1,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Health Care – "Plano de Saúde"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 1,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Alliance – "A Aliança"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 1,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Basketball – "Basquete"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 1,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Hot Girl – "Garota Bonita"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 1,
    'serie_id': theOfficeId
  });

//temporada 2

  await db.insert('episodios', {
    'nome': 'The Dundies – "O Dundies"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Sexual Harassment – "Assédio Sexual"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Office Olympics – "Olimpíadas do Escritório"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Fire – "O Incêndio"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Halloween – "Dia das Bruxas"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Fight – "A Luta"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Client – "O Cliente"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Performance Review – "Avaliação de Desempenho"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'E-Mail Surveillance – "Espionagem de E-mails"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Christmas Party – "Festa de Natal"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Booze Cruise – "Cruzeiro Álcoolico"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Injury – "O Machucado"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Secret – "O Segredo"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Carpet – "O Carpete"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Boys and Girls – "Meninos e Meninas"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Valentine\'s Day – "Dia dos Namorados"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Dwight\'s Speech – "O Discurso de Dwight"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Take Your Daughter to Work Day – "Leve sua Filha ao Trabalho"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Michael\'s Birthday – "Aniversário do Michael"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Drug Testing – "Teste de Drogas"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Conflict Resolution – "Resolução de Conflitos"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 2,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Casino Night – "Noite de Cassino"',
    'tempo': 22,
    'episodio': 22,
    'temporada': 2,
    'serie_id': theOfficeId
  });

//temporada 3

  await db.insert('episodios', {
    'nome': 'Gay Witch Hunt – "Caça às Bruxas Gays"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Convention – "A Convenção"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Coup – "O Golpe"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Grief Counseling – "Conselho de Luto"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Initiation – "Iniciação"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Diwali – "Diwali"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Branch Closing – "Fechamento da Filial"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Merger – "A Fusão"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Convict – "O Condenado"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'A Benihana Christmas – "Um Natal Benihana"',
    'tempo': 42,
    'episodio': 10,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Back from Vacation – "De Volta das Férias"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Traveling Salesmen – "Vendedores Viajantes"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Return – "O Retorno"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Ben Franklin – "Ben Franklin"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Phyllis\' Wedding – "O Casamento de Phyllis"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Business School – "Escola de Negócios"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Cocktails – "Coquetéis"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Negotiation – "A Negociação"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Safety Training – "Treinamento de Segurança"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Product Recall – "Recall de Produto"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Women\'s Appreciation – "Apreciação das Mulheres"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Beach Games – "Jogos na Praia"',
    'tempo': 22,
    'episodio': 22,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Job: Part 1 – "O Emprego: Parte 1"',
    'tempo': 22,
    'episodio': 23,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Job: Part 2 – "O Emprego: Parte 2"',
    'tempo': 22,
    'episodio': 24,
    'temporada': 3,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Job: Super-Sized – "O Emprego: Versão Extendida"',
    'tempo': 42,
    'episodio': 25,
    'temporada': 3,
    'serie_id': theOfficeId
  });

//temporada 4

  await db.insert('episodios', {
    'nome': 'Fun Run: Part 1 – "Corrida Beneficente: Parte 1"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Fun Run: Part 2 – "Corrida Beneficente: Parte 2"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome':
        'Dunder Mifflin Infinity: Part 1 – "Dunder Mifflin Infinito: Parte 1"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome':
        'Dunder Mifflin Infinity: Part 2 – "Dunder Mifflin Infinito: Parte 2"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Launch Party: Part 1 – "Festa de Lançamento: Parte 1"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Launch Party: Part 2 – "Festa de Lançamento: Parte 2"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Money: Part 1 – "Dinheiro: Parte 1"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Money: Part 2 – "Dinheiro: Parte 2"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Local Ad – "Propaganda Local"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Branch Wars – "Guerras entre Filiais"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Survivor Man – "O Sobrevivente"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Deposition – "A Deposição"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Dinner Party – "Jantar em Casa"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Chair Model – "Modelo de Cadeira"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Night Out – "Saída à Noite"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Did I Stutter? – "Eu Gaguejei?"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Job Fair – "Feira de Empregos"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Goodbye, Toby: Part 1 – "Adeus, Toby: Parte 1"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 4,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Goodbye, Toby: Part 2 – "Adeus, Toby: Parte 2"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 4,
    'serie_id': theOfficeId
  });

//temporada 5

  await db.insert('episodios', {
    'nome': 'Weight Loss: Part 1 – "Perda de Peso: Parte 1"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Weight Loss: Part 2 – "Perda de Peso: Parte 2"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Business Ethics – "Ética nos Negócios"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Baby Shower – "Chá de Bebê"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Crime Aid – "Ajuda ao Crime"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Employee Transfer – "Transferência de Funcionário"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Customer Survey – "Pesquisa de Satisfação do Cliente"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Business Trip – "Viagem de Negócios"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Frame Toby – "Culpar o Toby"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Surplus – "O Excedente"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Moroccan Christmas – "Natal Marroquino"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Duel – "O Duelo"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Prince Family Paper – "A Papelaria da Família Prince"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Stress Relief: Part 1 – "Alívio do Estresse: Parte 1"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Stress Relief: Part 2 – "Alívio do Estresse: Parte 2"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Lecture Circuit: Part 1 – "Circuito de Palestras: Parte 1"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Lecture Circuit: Part 2 – "Circuito de Palestras: Parte 2"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Blood Drive – "Doação de Sangue"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Golden Ticket – "Bilhete Dourado"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'New Boss – "Novo Chefe"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Two Weeks – "Duas Semanas"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Dream Team – "Equipe dos Sonhos"',
    'tempo': 22,
    'episodio': 22,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Michael Scott Paper Company – "Companhia de Papel Michael Scott"',
    'tempo': 22,
    'episodio': 23,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Heavy Competition – "Competição Pesada"',
    'tempo': 22,
    'episodio': 24,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Broke – "Quebrados"',
    'tempo': 22,
    'episodio': 25,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Casual Friday – "Sexta-Feira Casual"',
    'tempo': 22,
    'episodio': 26,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Cafe Disco – "Café Disco"',
    'tempo': 22,
    'episodio': 27,
    'temporada': 5,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Company Picnic – "Piquenique da Empresa"',
    'tempo': 22,
    'episodio': 28,
    'temporada': 5,
    'serie_id': theOfficeId
  });

//temporada 6

  await db.insert('episodios', {
    'nome': 'Gossip – "Fofoca"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Meeting – "A Reunião"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Promotion – "A Promoção"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Niagara: Part 1 – "Niagara: Parte 1"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Niagara: Part 2 – "Niagara: Parte 2"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Mafia – "Máfia"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Lover – "O Amante"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Koi Pond – "Lago de Carpas"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Double Date – "Encontro Duplo"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Murder – "Assassinato"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Shareholder Meeting – "Reunião de Acionistas"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Scott\'s Tots – "Os Pimpolhos de Scott"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Secret Santa – "Papai Noel Secreto"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Banker – "O Banqueiro"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Sabre – "Sabre"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Manager and Salesman – "Gerente e Vendedor"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Delivery: Part 1 – "O Parto: Parte 1"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Delivery: Part 2 – "O Parto: Parte 2"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'St. Patrick\'s Day – "Dia de São Patrício"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'New Leads – "Novos Contatos"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Happy Hour – "Happy Hour"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Secretary\'s Day – "Dia da Secretária"',
    'tempo': 22,
    'episodio': 22,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Body Language – "Linguagem Corporal"',
    'tempo': 22,
    'episodio': 23,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Cover-Up – "A Cobertura"',
    'tempo': 22,
    'episodio': 24,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Chump – "O Idiota"',
    'tempo': 22,
    'episodio': 25,
    'temporada': 6,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Whistleblower – "O Denunciante"',
    'tempo': 22,
    'episodio': 26,
    'temporada': 6,
    'serie_id': theOfficeId
  });

//temporada 7

  await db.insert('episodios', {
    'nome': 'Nepotism – "Nepotismo"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Counseling – "Aconselhamento"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Andy\'s Play – "A Peça de Andy"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Sex Ed – "Educação Sexual"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Sting – "O Golpe"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Costume Contest – "Concurso de Fantasias"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Christening – "Batismo"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Viewing Party – "Festa de Exibição"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'WUPHF.com – "WUPHF.com"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'China – "China"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Classy Christmas: Part 1 – "Natal Chique: Parte 1"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Classy Christmas: Part 2 – "Natal Chique: Parte 2"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Ultimatum – "Ultimato"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Seminar – "O Seminário"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Search – "A Busca"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'PDA – "PDA"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Threat Level Midnight – "Nível de Ameaça Meia-Noite"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Todd Packer – "Todd Packer"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Garage Sale – "Venda de Garagem"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Training Day – "Dia de Treinamento"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Michael\'s Last Dundies – "Os Últimos Dundies de Michael"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Goodbye, Michael – "Adeus, Michael"',
    'tempo': 42,
    'episodio': 22,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Inner Circle – "O Círculo Interno"',
    'tempo': 22,
    'episodio': 23,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome':
        'Dwight K. Schrute, (Acting) Manager – "Dwight K. Schrute, (Atuando como) Gerente"',
    'tempo': 22,
    'episodio': 24,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Search Committee: Part 1 – "Comitê de Seleção: Parte 1"',
    'tempo': 22,
    'episodio': 25,
    'temporada': 7,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Search Committee: Part 2 – "Comitê de Seleção: Parte 2"',
    'tempo': 22,
    'episodio': 26,
    'temporada': 7,
    'serie_id': theOfficeId
  });

//temporada 8

  await db.insert('episodios', {
    'nome': 'The List – "A Lista"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Incentive – "O Incentivo"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Lotto – "Loteria"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Garden Party – "Festa no Jardim"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Spooked – "Assustado"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Doomsday – "Dia do Juízo Final"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Pam\'s Replacement – "Substituta da Pam"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Gettysburg – "Gettysburg"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Mrs. California – "Senhora Califórnia"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Christmas Wishes – "Desejos de Natal"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Trivia – "Trivia"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Pool Party – "Festa na Piscina"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Jury Duty – "Dever de Jurado"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Special Project – "Projeto Especial"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Tallahassee – "Tallahassee"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'After Hours – "Depois do Expediente"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Test the Store – "Teste na Loja"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Last Day in Florida – "Último Dia na Flórida"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Get the Girl – "Conquistar a Garota"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Welcome Party – "Festa de Boas-Vindas"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Angry Andy – "Andy Furioso"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Fundraiser – "Arrecadação de Fundos"',
    'tempo': 22,
    'episodio': 22,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Turf War – "Guerra de Territórios"',
    'tempo': 22,
    'episodio': 23,
    'temporada': 8,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome':
        'Free Family Portrait Studio – "Estúdio de Retratos de Família Grátis"',
    'tempo': 22,
    'episodio': 24,
    'temporada': 8,
    'serie_id': theOfficeId
  });

//temporada 9

  await db.insert('episodios', {
    'nome': 'New Guys – "Novatos"',
    'tempo': 22,
    'episodio': 1,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Roy\'s Wedding – "O Casamento de Roy"',
    'tempo': 22,
    'episodio': 2,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Andy\'s Ancestry – "Ancestralidade de Andy"',
    'tempo': 22,
    'episodio': 3,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Work Bus – "Ônibus do Trabalho"',
    'tempo': 22,
    'episodio': 4,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Here Comes Treble – "Aqui Vem o Treble"',
    'tempo': 22,
    'episodio': 5,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Boat – "O Barco"',
    'tempo': 22,
    'episodio': 6,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Whale – "A Baleia"',
    'tempo': 22,
    'episodio': 7,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Target – "O Alvo"',
    'tempo': 22,
    'episodio': 8,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Dwight Christmas – "Natal de Dwight"',
    'tempo': 22,
    'episodio': 9,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Lice – "Piolhos"',
    'tempo': 22,
    'episodio': 10,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Suit Warehouse – "Armazém de Roupas"',
    'tempo': 22,
    'episodio': 11,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Customer Loyalty – "Lealdade do Cliente"',
    'tempo': 22,
    'episodio': 12,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Junior Salesman – "Jovem Vendedor"',
    'tempo': 22,
    'episodio': 13,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Vandalism – "Vandalismo"',
    'tempo': 22,
    'episodio': 14,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Couples Discount – "Desconto para Casais"',
    'tempo': 22,
    'episodio': 15,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Moving On – "Seguindo em Frente"',
    'tempo': 22,
    'episodio': 16,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'The Farm – "A Fazenda"',
    'tempo': 22,
    'episodio': 17,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Promos – "Promos"',
    'tempo': 22,
    'episodio': 18,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Stairmageddon – "Escadageddon"',
    'tempo': 22,
    'episodio': 19,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Paper Airplane – "Avião de Papel"',
    'tempo': 22,
    'episodio': 20,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Livin\' the Dream: Part 1 – "Vivendo o Sonho: Parte 1"',
    'tempo': 22,
    'episodio': 21,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Livin\' the Dream: Part 2 – "Vivendo o Sonho: Parte 2"',
    'tempo': 22,
    'episodio': 22,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'A.A.R.M.: Part 1 – "A.A.R.M.: Parte 1"',
    'tempo': 22,
    'episodio': 23,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'A.A.R.M.: Part 2 – "A.A.R.M.: Parte 2"',
    'tempo': 22,
    'episodio': 24,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  await db.insert('episodios', {
    'nome': 'Finale – "Finale"',
    'tempo': 52,
    'episodio': 25,
    'temporada': 9,
    'serie_id': theOfficeId
  });

  // HOUSE OF THE DRAGON
  // HOUSE OF THE DRAGON
  // HOUSE OF THE DRAGON
  // HOUSE OF THE DRAGON
  // HOUSE OF THE DRAGON

  await db.insert('episodios', {
    'nome': 'The Heirs of the Dragon – "Os Herdeiros do Dragão"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Rogue Prince – "O Príncipe Rebeldes"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'Second of His Name – "O Segundo de Seu Nome"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'King of the Narrow Sea – "Rei do Mar Estreito"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'We Light the Way – "Acendemos o Caminho"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Princess and The Queen – "A Princesa e a Rainha"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'Driftmark – "Driftmark"',
    'tempo': 60,
    'episodio': 7,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Lord of the Tides – "O Senhor das Marés"',
    'tempo': 60,
    'episodio': 8,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Green Council – "O Conselho Verde"',
    'tempo': 60,
    'episodio': 9,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Black Council – "O Conselho Negro"',
    'tempo': 60,
    'episodio': 10,
    'temporada': 1,
    'serie_id': houseOfTheDragonId
  });

//temporada 2

  await db.insert('episodios', {
    'nome': 'A Son for a Son – "Um Filho por um Filho"',
    'tempo': 58,
    'episodio': 1,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'Rhaenyra the Cruel – "Rhaenyra, a Cruel"',
    'tempo': 69,
    'episodio': 2,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Burning Mill – "O Moinho em Chamas"',
    'tempo': 67,
    'episodio': 3,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Red Dragon and the Gold – "O Dragão Vermelho e o Ouro"',
    'tempo': 55,
    'episodio': 4,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'Regent – "Regente"',
    'tempo': 62,
    'episodio': 5,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'Smallfolk – "Camponeses"',
    'tempo': 67,
    'episodio': 6,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Red Sowing – "A Semeadura Vermelha"',
    'tempo': 73,
    'episodio': 7,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  await db.insert('episodios', {
    'nome': 'The Queen Who Ever Was – "A Rainha Que Nunca Foi"',
    'tempo': 69,
    'episodio': 8,
    'temporada': 2,
    'serie_id': houseOfTheDragonId
  });

  // KNIGHTFALL
  // KNIGHTFALL
  // KNIGHTFALL
  // KNIGHTFALL
  // KNIGHTFALL

  await db.insert('episodios', {
    'nome': 'You’d Know What to Do – "Você Saberá o Que Fazer"',
    'tempo': 45,
    'episodio': 1,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Find Us the Grail – "Encontre-nos o Graal"',
    'tempo': 45,
    'episodio': 2,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome':
        'The Black Wolf and the White Wolf – "O Lobo Negro e o Lobo Branco"',
    'tempo': 45,
    'episodio': 3,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome':
        'He Who Discovers His Own Self, Discovers God – "Quem Descobre a Si Mesmo, Descobre Deus"',
    'tempo': 45,
    'episodio': 4,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome':
        'Hard Blows Will Banish the Sin – "Golpes Duros Expulsarão o Pecado"',
    'tempo': 45,
    'episodio': 5,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'The Pilgrimage of Chains – "A Peregrinação das Correntes"',
    'tempo': 45,
    'episodio': 6,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'And Certainly Not the Cripple – "E Certamente Não o Aleijado"',
    'tempo': 45,
    'episodio': 7,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'IV – "IV"',
    'tempo': 45,
    'episodio': 8,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Fiat! – "Fiat!"',
    'tempo': 45,
    'episodio': 9,
    'temporada': 1,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Do You See the Blue? – "Você Vê o Azul?"',
    'tempo': 45,
    'episodio': 10,
    'temporada': 1,
    'serie_id': knightfallId
  });

//temporada 2

  await db.insert('episodios', {
    'nome': 'God’s Executioners – "Os Carrascos de Deus"',
    'tempo': 45,
    'episodio': 1,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'The Devil Inside – "O Diabo Interior"',
    'tempo': 45,
    'episodio': 2,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Faith – "Fé"',
    'tempo': 45,
    'episodio': 3,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Equal Before God – "Iguais Diante de Deus"',
    'tempo': 45,
    'episodio': 4,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Road to Chartres – "Caminho para Chartres"',
    'tempo': 45,
    'episodio': 5,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Blood Drenched Stone – "Pedra Ensanguentada"',
    'tempo': 45,
    'episodio': 6,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome': 'Death Awaits – "A Morte Aguarda"',
    'tempo': 45,
    'episodio': 7,
    'temporada': 2,
    'serie_id': knightfallId
  });

  await db.insert('episodios', {
    'nome':
        'While I Breathe, I Trust the Cross – "Enquanto Eu Respiro, Confio na Cruz"',
    'tempo': 45,
    'episodio': 8,
    'temporada': 2,
    'serie_id': knightfallId
  });

  // THE LAST KINGDOM
  // THE LAST KINGDOM
  // THE LAST KINGDOM
  // THE LAST KINGDOM
  // THE LAST KINGDOM

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 59,
    'episodio': 1,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 59,
    'episodio': 2,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 58,
    'episodio': 3,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 58,
    'episodio': 4,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 58,
    'episodio': 5,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 59,
    'episodio': 6,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 7 – "Episódio 7"',
    'tempo': 58,
    'episodio': 7,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 8 – "Episódio 8"',
    'tempo': 59,
    'episodio': 8,
    'temporada': 1,
    'serie_id': theLastKingdomId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 59,
    'episodio': 1,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 59,
    'episodio': 2,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 59,
    'episodio': 3,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 59,
    'episodio': 4,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 59,
    'episodio': 5,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 59,
    'episodio': 6,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 7 – "Episódio 7"',
    'tempo': 59,
    'episodio': 7,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 8 – "Episódio 8"',
    'tempo': 59,
    'episodio': 8,
    'temporada': 2,
    'serie_id': theLastKingdomId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 54,
    'episodio': 1,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 54,
    'episodio': 2,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 54,
    'episodio': 3,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 54,
    'episodio': 4,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 55,
    'episodio': 5,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 54,
    'episodio': 6,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 7 – "Episódio 7"',
    'tempo': 54,
    'episodio': 7,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 8 – "Episódio 8"',
    'tempo': 54,
    'episodio': 8,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 9 – "Episódio 9"',
    'tempo': 54,
    'episodio': 9,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 10 – "Episódio 10"',
    'tempo': 54,
    'episodio': 10,
    'temporada': 3,
    'serie_id': theLastKingdomId
  });

// Temporada 4
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 56,
    'episodio': 1,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 54,
    'episodio': 2,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 56,
    'episodio': 3,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 55,
    'episodio': 4,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 57,
    'episodio': 5,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 54,
    'episodio': 6,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 7 – "Episódio 7"',
    'tempo': 54,
    'episodio': 7,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 8 – "Episódio 8"',
    'tempo': 57,
    'episodio': 8,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 9 – "Episódio 9"',
    'tempo': 55,
    'episodio': 9,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 10 – "Episódio 10"',
    'tempo': 53,
    'episodio': 10,
    'temporada': 4,
    'serie_id': theLastKingdomId
  });

// Temporada 5
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 54,
    'episodio': 1,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 58,
    'episodio': 2,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 57,
    'episodio': 3,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 53,
    'episodio': 4,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 57,
    'episodio': 5,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 52,
    'episodio': 6,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 7 – "Episódio 7"',
    'tempo': 57,
    'episodio': 7,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 8 – "Episódio 8"',
    'tempo': 53,
    'episodio': 8,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 9 – "Episódio 9"',
    'tempo': 55,
    'episodio': 9,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  await db.insert('episodios', {
    'nome': 'Episode 10 – "Episódio 10"',
    'tempo': 58,
    'episodio': 10,
    'temporada': 5,
    'serie_id': theLastKingdomId
  });

  // BETTER CALL SAUL
  // BETTER CALL SAUL
  // BETTER CALL SAUL
  // BETTER CALL SAUL
  // BETTER CALL SAUL

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Uno – "Uno"',
    'tempo': 53,
    'episodio': 1,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Mijo – "Mijo"',
    'tempo': 43,
    'episodio': 2,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Nacho – "Nacho"',
    'tempo': 47,
    'episodio': 3,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Hero – "Herói"',
    'tempo': 47,
    'episodio': 4,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Alpine Shepherd Boy – "O Menino Pastor dos Alpes"',
    'tempo': 45,
    'episodio': 5,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Five-O – "Cinco-0"',
    'tempo': 42,
    'episodio': 6,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Bingo – "Bingo"',
    'tempo': 47,
    'episodio': 7,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'RICO – "RICO"',
    'tempo': 47,
    'episodio': 8,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Pimento – "Pimento"',
    'tempo': 47,
    'episodio': 9,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Marco – "Marco"',
    'tempo': 47,
    'episodio': 10,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'Switch – "Interruptor"',
    'tempo': 46,
    'episodio': 1,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Cobbler – "Sapateiro"',
    'tempo': 47,
    'episodio': 2,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Amarillo – "Amarillo"',
    'tempo': 46,
    'episodio': 3,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Gloves Off – "Sem Luvas"',
    'tempo': 47,
    'episodio': 4,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Rebecca – "Rebecca"',
    'tempo': 47,
    'episodio': 5,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Bali Ha\'i – "Bali Ha\'i"',
    'tempo': 47,
    'episodio': 6,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Inflatable – "Inflável"',
    'tempo': 47,
    'episodio': 7,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Fifi – "Fifi"',
    'tempo': 47,
    'episodio': 8,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Nailed – "Pregado"',
    'tempo': 47,
    'episodio': 9,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Klick – "Klick"',
    'tempo': 47,
    'episodio': 10,
    'temporada': 2,
    'serie_id': betterCallSaulId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'Mabel – "Mabel"',
    'tempo': 53,
    'episodio': 1,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Witness – "Testemunha"',
    'tempo': 47,
    'episodio': 2,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Sunk Costs – "Custos Afundados"',
    'tempo': 47,
    'episodio': 3,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Sabrosito – "Sabrosito"',
    'tempo': 47,
    'episodio': 4,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Chicanery – "Trapaça"',
    'tempo': 47,
    'episodio': 5,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Off Brand – "Fora de Marca"',
    'tempo': 47,
    'episodio': 6,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Expenses – "Despesas"',
    'tempo': 47,
    'episodio': 7,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Slip – "Escorregão"',
    'tempo': 47,
    'episodio': 8,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Fall – "Queda"',
    'tempo': 47,
    'episodio': 9,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Lantern – "Lanterna"',
    'tempo': 53,
    'episodio': 10,
    'temporada': 3,
    'serie_id': betterCallSaulId
  });

// Temporada 4
  await db.insert('episodios', {
    'nome': 'Smoke – "Fumaça"',
    'tempo': 53,
    'episodio': 1,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Breathe – "Respire"',
    'tempo': 47,
    'episodio': 2,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Something Beautiful – "Algo Bonito"',
    'tempo': 47,
    'episodio': 3,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Talk – "Conversa"',
    'tempo': 47,
    'episodio': 4,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Quite a Ride – "Uma Grande Viagem"',
    'tempo': 47,
    'episodio': 5,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Piñata – "Piñata"',
    'tempo': 47,
    'episodio': 6,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Something Stupid – "Algo Estúpido"',
    'tempo': 47,
    'episodio': 7,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Coushatta – "Coushatta"',
    'tempo': 47,
    'episodio': 8,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Wiedersehen – "Adeus"',
    'tempo': 47,
    'episodio': 9,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Winner – "Vencedor"',
    'tempo': 60,
    'episodio': 10,
    'temporada': 4,
    'serie_id': betterCallSaulId
  });

// Temporada 5
  await db.insert('episodios', {
    'nome': 'Magic Man – "Homem Mágico"',
    'tempo': 54,
    'episodio': 1,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': '50% Off – "50% de Desconto"',
    'tempo': 45,
    'episodio': 2,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'The Guy for This – "O Cara Para Isso"',
    'tempo': 50,
    'episodio': 3,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Namaste – "Namaste"',
    'tempo': 47,
    'episodio': 4,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Dedicado a Max – "Dedicado a Max"',
    'tempo': 47,
    'episodio': 5,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Wexler v. Goodman – "Wexler v. Goodman"',
    'tempo': 53,
    'episodio': 6,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'JMM – "JMM"',
    'tempo': 53,
    'episodio': 7,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Bagman – "Homem do Saco"',
    'tempo': 54,
    'episodio': 8,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Bad Choice Road – "Caminho da Má Escolha"',
    'tempo': 56,
    'episodio': 9,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Something Unforgivable – "Algo Imperdoável"',
    'tempo': 50,
    'episodio': 10,
    'temporada': 5,
    'serie_id': betterCallSaulId
  });

// Temporada 6
  await db.insert('episodios', {
    'nome': 'Wine and Roses – "Vinho e Rosas"',
    'tempo': 57,
    'episodio': 1,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Carrot and Stick – "Cenoura e Bastão"',
    'tempo': 54,
    'episodio': 2,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Rock and Hard Place – "Entre a Cruz e a Espada"',
    'tempo': 47,
    'episodio': 3,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Hit and Run – "Atropelamento e Fuga"',
    'tempo': 43,
    'episodio': 4,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Black and Blue – "Preto e Azul"',
    'tempo': 47,
    'episodio': 5,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Axe and Grind – "Machado e Moagem"',
    'tempo': 47,
    'episodio': 6,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Plan and Execution – "Plano e Execução"',
    'tempo': 54,
    'episodio': 7,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Point and Shoot – "Aponte e Dispare"',
    'tempo': 48,
    'episodio': 8,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Fun and Games – "Diversão e Jogos"',
    'tempo': 52,
    'episodio': 9,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Nippy – "Nippy"',
    'tempo': 56,
    'episodio': 10,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Breaking Bad – "Breaking Bad"',
    'tempo': 47,
    'episodio': 11,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Waterworks – "Aquedutos"',
    'tempo': 47,
    'episodio': 12,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Saul Gone – "Saul se Foi"',
    'tempo': 69,
    'episodio': 13,
    'temporada': 6,
    'serie_id': betterCallSaulId
  });

  // NARCOS
  // NARCOS
  // NARCOS
  // NARCOS
  // NARCOS

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Descenso – "Descenso"',
    'tempo': 57,
    'episodio': 1,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'The Sword of Simón Bolívar – "A Espada de Simón Bolívar"',
    'tempo': 47,
    'episodio': 2,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'The Men of Always – "Os Homens de Sempre"',
    'tempo': 47,
    'episodio': 3,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'The Palace in Flames – "O Palácio em Chamas"',
    'tempo': 49,
    'episodio': 4,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'There Will Be a Future – "Haverá um Futuro"',
    'tempo': 49,
    'episodio': 5,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Explosivos – "Explosivos"',
    'tempo': 50,
    'episodio': 6,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome':
        'You Will Cry Tears of Blood – "Você Vai Chorar Lágrimas de Sangue"',
    'tempo': 44,
    'episodio': 7,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'La Gran Mentira – "A Grande Mentira"',
    'tempo': 46,
    'episodio': 8,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'La Catedral – "La Catedral"',
    'tempo': 51,
    'episodio': 9,
    'temporada': 1,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Despegue – "Despegue"',
    'tempo': 49,
    'episodio': 10,
    'temporada': 1,
    'serie_id': narcosId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'Free at Last – "Finalmente Livre"',
    'tempo': 49,
    'episodio': 1,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Cambalache – "Cambalache"',
    'tempo': 49,
    'episodio': 2,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Our Man in Madrid – "Nosso Homem em Madri"',
    'tempo': 49,
    'episodio': 3,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'The Good, The Bad, and The Dead – "O Bom, o Mau e o Morto"',
    'tempo': 45,
    'episodio': 4,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'The Enemies of My Enemy – "Os Inimigos dos Meus Inimigos"',
    'tempo': 48,
    'episodio': 5,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Los Pepes – "Los Pepes"',
    'tempo': 52,
    'episodio': 6,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Deutschland 93 – "Deutschland 93"',
    'tempo': 47,
    'episodio': 7,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Exit El Patrón – "Adeus ao Patrão"',
    'tempo': 49,
    'episodio': 8,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Nuestra Finca – "Nossa Fazenda"',
    'tempo': 51,
    'episodio': 9,
    'temporada': 2,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Al Fin Cayó! – "Finalmente Caiu!"',
    'tempo': 50,
    'episodio': 10,
    'temporada': 2,
    'serie_id': narcosId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'The Kingpin Strategy – "A Estratégia do Chefão"',
    'tempo': 47,
    'episodio': 1,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'The Cali KGB – "O KGB de Cali"',
    'tempo': 50,
    'episodio': 2,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Follow the Money – "Siga o Dinheiro"',
    'tempo': 52,
    'episodio': 3,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Checkmate – "Xeque-Mate"',
    'tempo': 48,
    'episodio': 4,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'MRO – "MRO"',
    'tempo': 51,
    'episodio': 5,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Best Laid Plans – "Os Melhores Planos"',
    'tempo': 50,
    'episodio': 6,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Sin Salida – "Sem Saída"',
    'tempo': 51,
    'episodio': 7,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Convivir – "Convivir"',
    'tempo': 46,
    'episodio': 8,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome':
        'Todos Los Hombres del Presidente – "Todos os Homens do Presidente"',
    'tempo': 55,
    'episodio': 9,
    'temporada': 3,
    'serie_id': narcosId
  });

  await db.insert('episodios', {
    'nome': 'Going Back to Cali – "Voltando para Cali"',
    'tempo': 51,
    'episodio': 10,
    'temporada': 3,
    'serie_id': narcosId
  });

  // PEAKY BLINDERS
  // PEAKY BLINDERS
  // PEAKY BLINDERS
  // PEAKY BLINDERS
  // PEAKY BLINDERS

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 1,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 1,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 1,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 1,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 1,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 1,
    'serie_id': peakyBlindersId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 2,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 2,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 2,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 2,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 2,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 2,
    'serie_id': peakyBlindersId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 3,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 3,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 3,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 3,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 3,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 3,
    'serie_id': peakyBlindersId
  });

// Temporada 4
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 4,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 4,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 4,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 4,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 4,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 4,
    'serie_id': peakyBlindersId
  });

// Temporada 5
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 5,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 5,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 5,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 5,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 5,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 5,
    'serie_id': peakyBlindersId
  });

// Temporada 6
  await db.insert('episodios', {
    'nome': 'Episode 1 – "Episódio 1"',
    'tempo': 60,
    'episodio': 1,
    'temporada': 6,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 2 – "Episódio 2"',
    'tempo': 60,
    'episodio': 2,
    'temporada': 6,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 3 – "Episódio 3"',
    'tempo': 60,
    'episodio': 3,
    'temporada': 6,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 4 – "Episódio 4"',
    'tempo': 60,
    'episodio': 4,
    'temporada': 6,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 5 – "Episódio 5"',
    'tempo': 60,
    'episodio': 5,
    'temporada': 6,
    'serie_id': peakyBlindersId
  });

  await db.insert('episodios', {
    'nome': 'Episode 6 – "Episódio 6"',
    'tempo': 60,
    'episodio': 6,
    'temporada': 6,
    'serie_id': peakyBlindersId
  });

  //STRANGER THINGS
  //STRANGER THINGS
  //STRANGER THINGS
  //STRANGER THINGS
  //STRANGER THINGS

  // Temporada 1
  await db.insert('episodios', {
    'nome': 'Chapter One: Stranger Things - Stranger Things',
    'tempo': 45,
    'episodio': 1,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Two: The Weirdo on Maple Street - Stranger Things',
    'tempo': 45,
    'episodio': 2,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Three: Holly, Jolly - Stranger Things',
    'tempo': 45,
    'episodio': 3,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Four: The Body - Stranger Things',
    'tempo': 45,
    'episodio': 4,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Five: The Flea and the Acrobat - Stranger Things',
    'tempo': 45,
    'episodio': 5,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Six: The Monster - Stranger Things',
    'tempo': 45,
    'episodio': 6,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Seven: The Bathtub - Stranger Things',
    'tempo': 45,
    'episodio': 7,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Eight: The Upside Down - Stranger Things',
    'tempo': 45,
    'episodio': 8,
    'temporada': 1,
    'serie_id': strangerThingsId
  });

// Temporada 2
  await db.insert('episodios', {
    'nome': 'Chapter One: Stranger Things 2 - Stranger Things',
    'tempo': 50,
    'episodio': 1,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Two: Trick or Treat, Freak - Stranger Things',
    'tempo': 50,
    'episodio': 2,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Three: The Pollywog - Stranger Things',
    'tempo': 50,
    'episodio': 3,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Four: Will the Wise - Stranger Things',
    'tempo': 50,
    'episodio': 4,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Five: Dig Dug - Stranger Things',
    'tempo': 50,
    'episodio': 5,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Six: The Spy - Stranger Things',
    'tempo': 50,
    'episodio': 6,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Seven: The Lost Sister - Stranger Things',
    'tempo': 50,
    'episodio': 7,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Eight: The Mind Flayer - Stranger Things',
    'tempo': 50,
    'episodio': 8,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Nine: The Gate - Stranger Things',
    'tempo': 50,
    'episodio': 9,
    'temporada': 2,
    'serie_id': strangerThingsId
  });

// Temporada 3
  await db.insert('episodios', {
    'nome': 'Chapter One: Montauk - Stranger Things',
    'tempo': 50,
    'episodio': 1,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Two: The Mall Rats - Stranger Things',
    'tempo': 50,
    'episodio': 2,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome':
        'Chapter Three: The Case of the Missing Lifeguard - Stranger Things',
    'tempo': 50,
    'episodio': 3,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Four: The Sauna Test - Stranger Things',
    'tempo': 50,
    'episodio': 4,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Five: The Flayed - Stranger Things',
    'tempo': 50,
    'episodio': 5,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Six: E Pluribus Unum - Stranger Things',
    'tempo': 50,
    'episodio': 6,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Seven: The Bite - Stranger Things',
    'tempo': 50,
    'episodio': 7,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Eight: The Battle of Starcourt - Stranger Things',
    'tempo': 50,
    'episodio': 8,
    'temporada': 3,
    'serie_id': strangerThingsId
  });

// Temporada 4
  await db.insert('episodios', {
    'nome': 'Chapter One: The Hellfire Club - Stranger Things',
    'tempo': 55,
    'episodio': 1,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Two: Vecna’s Curse - Stranger Things',
    'tempo': 55,
    'episodio': 2,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Three: The Monster and the Superhero - Stranger Things',
    'tempo': 55,
    'episodio': 3,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Four: Dear Billy - Stranger Things',
    'tempo': 55,
    'episodio': 4,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Five: The Nina Project - Stranger Things',
    'tempo': 55,
    'episodio': 5,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Six: The Dive - Stranger Things',
    'tempo': 55,
    'episodio': 6,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Seven: The Massacre at Hawkins Lab - Stranger Things',
    'tempo': 55,
    'episodio': 7,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Eight: Papa - Stranger Things',
    'tempo': 55,
    'episodio': 8,
    'temporada': 4,
    'serie_id': strangerThingsId
  });

  await db.insert('episodios', {
    'nome': 'Chapter Nine: The Piggyback - Stranger Things',
    'tempo': 55,
    'episodio': 9,
    'temporada': 4,
    'serie_id': strangerThingsId
  });
}

Future<List<Map<String, dynamic>>> loadTemporadas(int serieId) async {
  Database db = await getDatabase();
  List<Map<String, dynamic>> temporadas = await db.query('episodios',
      columns: ['temporada'],
      where: 'serie_id = ?',
      whereArgs: [serieId],
      distinct: true);
  return temporadas;
}
