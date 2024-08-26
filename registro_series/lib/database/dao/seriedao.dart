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
    'nome': 'Brooklyn Nine-Nine',
    'progresso': 0.0,
    'avaliacao': 4,
    'sinopse':
        'A série Brooklyn Nine-Nine é ambientada na 99ª Delegacia de Polícia de Nova York, no Brooklyn, acompanhando as maluquices do imaturo detetive Jake Peralta (Andy Samberg) e a relação que ele tem com o novo capitão, Ray Holt (Andre Braugher).'
  });
  await db.insert('series', {
    'nome': 'How I Met Your Mother',
    'progresso': 0.0,
    'avaliacao': 5,
    'sinopse':
        'Em 2030, o arquiteto Ted Mosby (Josh Radnor) conta a história sobre como conheceu a mãe dos seus filhos. Ele volta no tempo para 2005, relembrando suas aventuras amorosas em Nova York e a busca pela mulher dos seus sonhos. Ao longo do anos, Ted aproveita para falar a jornada dos seus amigos: o advogado Marshall Eriksen (Jason Segel), a professora Lily Aldrin (Alyson Hannigan), a jornalista Robin Scherbatsky (Cobie Smulders) e o mulherengo convicto Barney Stinson (Neil Patrick Harris).'
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

  // Recuperar o ID de cada série
  List<Map<String, dynamic>> breakingBad =
      await db.query('series', where: 'nome = ?', whereArgs: ['Breaking Bad']);
  int breakingBadId = breakingBad.first['id'];

  List<Map<String, dynamic>> casaDoDragao = await db
      .query('series', where: 'nome = ?', whereArgs: ['House of the Dragon']);
  int casaDoDragaoId = casaDoDragao.first['id'];

  List<Map<String, dynamic>> betterCallSaul = await db
      .query('series', where: 'nome = ?', whereArgs: ['Better Call Saul']);
  int betterCallSaulId = betterCallSaul.first['id'];

  // Inserir episódios de Breaking Bad
  await db.insert('episodios', {
    'nome': 'Pilot - Breaking Bad',
    'tempo': 58,
    'episodio': 1,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  await db.insert('episodios', {
    'nome': 'Cat\'s in the Bag... - Breaking Bad',
    'tempo': 48,
    'episodio': 2,
    'temporada': 1,
    'serie_id': breakingBadId
  });

  // Inserir episódios de Casa do Dragão
  await db.insert('episodios', {
    'nome': 'Os Herdeiros do Dragão - Casa do Dragão',
    'tempo': 60,
    'episodio': 1,
    'temporada': 1,
    'serie_id': casaDoDragaoId
  });

  await db.insert('episodios', {
    'nome': 'O Príncipe Rebelde - Casa do Dragão',
    'tempo': 54,
    'episodio': 2,
    'temporada': 1,
    'serie_id': casaDoDragaoId
  });

  // Inserir episódios de Better Call Saul
  await db.insert('episodios', {
    'nome': 'Uno - Better Call Saul',
    'tempo': 53,
    'episodio': 1,
    'temporada': 1,
    'serie_id': betterCallSaulId
  });

  await db.insert('episodios', {
    'nome': 'Mijo - Better Call Saul',
    'tempo': 47,
    'episodio': 2,
    'temporada': 1,
    'serie_id': betterCallSaulId
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
