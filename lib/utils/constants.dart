import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:mun/models/about.dart';

//DateTime now = new DateTime.now();
//DateTime eventDate = new DateTime(2021, 12, 17, 8);
DateTime now = new DateTime.now();
DateTime eventDate = DateTime.parse('2021-12-17 10:00:00.00');
int? days, hours, minutes, seconds;
bool done = false;
bool darkMode = false;
Size size = new Size(0, 0);

ValueNotifier valueNotifier = ValueNotifier(false);

List<String> images = [
  '/assets/img/galleries/68486609_1171700466355347_2764202133791178752_o.jpg',
  '/assets/img/galleries/69169850_1173642672827793_6279335701074935808_o.jpg',
  '/assets/img/galleries/69388625_1171697006355693_1952834682173259776_o.jpg',
  '/assets/img/galleries/70316786_1171571026368291_3552353685151416320_o.jpg',
  '/assets/img/galleries/70398852_1171703746355019_2539602935080288256_o.jpg',
  '/assets/img/galleries/70450172_1172522102939850_1429070601611378688_o.jpg',
  '/assets/img/galleries/70459740_1171330109725716_4823369949831495680_o.jpg',
  '/assets/img/galleries/70476482_1171681123023948_7081319641288540160_o.jpg',
  '/assets/img/galleries/70477008_1171571706368223_9126131121120083968_o.jpg',
  '/assets/img/galleries/70508047_1171319003060160_3026056248194760704_o.jpg',
  '/assets/img/galleries/70598744_1171311306394263_4612954472593752064_o.jpg',
  '/assets/img/galleries/70640297_1171332219725505_4889040850190860288_o.jpg',
  '/assets/img/galleries/70663474_1172575182934542_7998864907871191040_o.jpg',
  '/assets/img/galleries/70701613_1171603379698389_2184779550565597184_o.jpg',
  '/assets/img/galleries/70720931_1171536346371759_352463016517697536_o.jpg',
  '/assets/img/galleries/70725500_1172539126271481_5540165807889186816_o.jpg',
  '/assets/img/galleries/70731207_1171576503034410_5513922539803377664_o.jpg',
  '/assets/img/galleries/70746126_1172529812939079_474252474962673664_o.jpg',
  '/assets/img/galleries/70762646_1171346293057431_642836237752729600_o.jpg',
  '/assets/img/galleries/70831703_1174199259438801_2083087554063630336_o.jpg',
  '/assets/img/galleries/70884794_1173600132832047_4645870582259253248_o.jpg',
  '/assets/img/galleries/70896615_1171559193036141_6783838150394380288_o.jpg',
  '/assets/img/galleries/70947614_1172577749600952_4591012283542405120_o.jpg',
  '/assets/img/galleries/70954830_1171534803038580_5392270546081677312_o.jpg',
  '/assets/img/galleries/71012628_1172589779599749_8606694589476110336_o.jpg',
  '/assets/img/galleries/71015843_1171532759705451_1326261539950297088_o.jpg',
  '/assets/img/galleries/71029007_1172526276272766_2183943436397182976_o.jpg',
  '/assets/img/galleries/71030080_1171334259725301_7994853756309078016_o.jpg',
  '/assets/img/galleries/71088605_1173817099477017_2834290133136572416_o.jpg',
  '/assets/img/galleries/71119181_1172591226266271_2447258664315125760_o.jpg',
  '/assets/img/galleries/71180504_1174165246108869_4234980037532581888_o.jpg',
  '/assets/img/galleries/71189426_1171700973021963_5791812726355394560_o.jpg',
  '/assets/img/galleries/71223095_1171700606355333_1998368512401211392_o.jpg',
  '/assets/img/galleries/71239770_1171311503060910_5500455279004745728_o.jpg',
  '/assets/img/galleries/71259051_1172789009579826_1273763592050573312_o.jpg',
  '/assets/img/galleries/71767894_1171702999688427_7950864001183776768_o.jpg',
];

String munLogo = 'assets/kiitMUN.png';

String eMunBlack = 'assets/emun.jpeg';

String eMunWhite = 'assets/emun.jpeg';

String tagLine = '#ConcordToConquer';

List<About> abouts = [
  new About(
    name: 'KIIT',
    description:
        "One of India's top universities, Kalinga Institute of Industrial Technology (KIIT), is famous for the caliber of its teaching and research. It was established as an industrial training institute in Bhubaneswar in 1992–1993, in a leased home with 12 pupils and 2 teachers. In the age of unpopular schooling and much cautious embracing of globalization, Prof. Achyuta Samanta had a vision for a school that would emphasize academic excellence and offer uncountable chances for students to acquire comprehensive knowledge with very little financial support. The dedication, tenacity, and fortitude of our Founder and the contributions of the industrious staff and well-wishers has led KIIT Deemed to be University to announce itself as one of the Premier Education Hubs of India.\n\nWith just three programmes to begin with—Engineering, MBA, and MCA—KIIT's dedication to quality led to the Ministry of HRD, Government of India, awarding it Deemed to be University status under Section 3 of UGC Act, 1956, in 2004. This made KIIT the earliest Institute to achieve the distinction of obtaining University status in less than 6 years, which has been proudly inscribed in the Limca Book of Records. It has been ranked No. 1 among self-financing institutions of the country in the Atal Ranking of Institutions on Innovation Achievements (ARIIA), 2022 of the Ministry of Education, Government of India. It is India's 1st QS 5 Stars Rated University (QS World University Ranking) and is the only University of India to hold the Prestigious ISAS badge (International Associations of University) and the only University of India to win the The Awards Asia for Leadership and Management by Times Higher Education Rankings for its unstinting commitment to its staff and students. Recently, KIIT ranked 8th globally for Reducing Inequalities by the Times Higher Education Impact Rankings 2022 and also ranked 20th by NIRF, Govt. of India.\n30,000 students are educated at KIIT, who come from 65 different nations and all around India. Through its 23 schools, it offers more than 115 academic programmes, and more than 195 international organizations collaborate with it in the workplace. More than 100 multinational corporations and numerous national companies obtain their personnel from KIIT for placement. For its outstanding contribution in the field of sports and games, KIIT has been awarded as the best Sports University of India (Sportstar Aces Award). The University has a long history of holding numerous international and national seminars, congresses, workshops, and even important sporting events in practically every topic of interest. With its expansive 25 Square Kilometer Academic Township, 23 World Class Campuses, 2500+ illustrious Faculty and Researchers, 16 Sports Complexes, largest indoor and outdoor stadiums of any university, 15 Food Courts, and greenest campus in India, KIIT offers a holistic approach to human development that is unmatched in the nation.\n\nIn terms of social and economic empowerment, KIIT University's outreach programme is enormous. Sports have received virtually no support in terms of developing athletes and building sports facilities. The accomplishments of the students and their sense of community on campus and in their workplaces after graduation have motivated us to push even harder to achieve greater levels of excellence. Instead of resting on its past success and rapid expansion, KIIT looks forward to reaching greater heights in academics, research, and global rankings.",
    // 'Established as a modest institute in the idyllic city of Bhubaneswar in June 1992, Kalinga Institute of Industrial Technology is now a profound institute for learning with a vision, to build an imperishable society through education which revolves around boundless learning, research and development. With our motto, “Knowledge is that which liberates”, it is a multidisciplinary varsity with an avant-garde infrastructure, comprising of twenty-three lush green world class campuses with academic wings, amphitheaters, auditoriums, conference rooms and smart class rooms.\n\nHaving been granted the status of Deemed To Be University by the Ministry of HRD, Govt. of India in 2004, KIIT has been accorded the accreditation of the ‘A’ grade, by NAAC of UGC. KIIT offers more than 100 academic programs ranging from engineering to management, law to film studies. With 1800 faculties, 27000 students and 25 sq.km academic township, KIIT lets its students to explore new dimensions, enrich themselves and experience the best.\n\nInculcating global prospective, KIIT stands 8th among the reputed private universities in India, proclaimed as an ‘A’ category, by the Ministry of HRD, Govt. of India, accredited by IET, UK as well as the ‘Tier-1’ accreditation (Washington Accord) for all  engineering  streams by the NBA, and is also a younger member of Association of Commonwealth Universities.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fkiit.png?alt=media&token=21926ee7-578f-427a-bb64-63cf81bc6c85',
  ),
  new About(
    name: 'KISS',
    description:
        "The Kalinga Institute of Social Sciences (KISS) is a residential institution providing free education, accommodation , medical care, vocational, athletic & artistic training to 70,000 indigenous children. Of these, 30,000 students study at the main campus in Bhubaneswar, 20,000 are alumni and 10,000 study at 10 satellite centers of KISS across Odisha. It has indirectly impacted over a million tribal children and youth. The students come from 62 different tribal groups within the region, of which 13 are Particularly Vulnerable Tribal Groups (PVTGs).\n\nKISS was established in 1992 with the aim of using accessible, free education to empower children from marginalized communities. It has now grown to symbolize a revolution for tribal populations of India to eradicate poverty through education. Over the course of its more than 28-year history, KISS has peacefully intervened through education and empowerment to arrest dropouts, child marriage, gender-based harassment, left-wing extremism, proselytising, illiteracy, and superstition on a huge scale. It has raised awareness of the value of education, the empowerment of girls, upskilling and vocational empowerment, entrepreneurship, and cooperation with tribal groups as guardians of the environment and the natural world.\n\nSince 2015, UN-ECOSOC has granted KISS Special Consultative Status, making it the first unique tribal Deemed to Be University in the world. While making sure that the model prioritizes indigenous ownership of education, to maintain the history, legacy, and customs of India's different tribal tribes, and to fully realize the Sustainable Development Goals 2030, KISS proudly adheres to the 3E approach—Educate, Enable, Empower.",
    // 'Kalinga Institute of Social Sciences, the first tribal Deemed to Be University in India which started with 125 poor tribal children in 1993, in a rented house at Bhubaneswar. A sister concern of Kalinga Institute of Information Technology (KIIT), Kalinga Institute of Social Sciences (KISS) with more than 27,000 children and 62 indigenous tribes of Odisha, has been a home for over 37,000 students. KISS is a free of cost, fully residential educational institute, exclusively for penurious tribal children.\n\nThese children are provided with free holistic education, skill development, career opportunities, food, accommodation, health care, and other basic necessities. With our Founder, Dr. Achyuta Samanta’s vision, KISS works to eradicate poverty, illiteracy and unemployment through quality education. KISS has always nurtured a vision of a world which is free of hunger, poverty and illiteracy. UNESCO, UNICEF, UNFPA, as well as the US Federal Government have associated themselves with KISS for several initiatives and programs that have been undertaken by the institute.\n\nKISS aspires to work more and plans to open branches in all thirty districts of Odisha and also all the states of India. A branch of KISS, KISS-DELHI is successfully operating in NCR with the collaboration of Government Of Delhi.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fkiss.png?alt=media&token=753f241f-7684-404f-8c0d-c9214e61da28',
  ),
  new About(
    name: 'Founder',
    description:
        "Prof. Achyuta Samanta is an educationist, philanthropist, and social worker. He is the founder of Kalinga Institute of Industrial Technology (KIIT) and Kalinga Institute of Social Sciences (KISS), both educational institutions of global repute and recognition. KIIT is one of the most prominent universities in India and globe for professional education having more than 30,000 students from all over India and 65 other countries. KISS is a home for 60,000 indigenous children all absolutely free.\n\nBesides Education and tribal upliftment, healthcare and rural development, Prof. Samanta has contributed immensely to art, culture, literature, film, media, society and national integration. It is really incredible that the child who lost his father at the age of four, brought up amidst severe poverty and deprivation with seven siblings and a widow mother in a quaint village in Odisha has accomplished this monumental work without any favour or backing in such a short span of time for the society. He has converted the remote village ‘Kalarabanka’, Cuttack into a Smart Village and the entire Manpur Panchayat into a model Panchayat (cluster of villages).\n\nHe has been conferred with more than 50 International and National awards and over 200 state awards besides two highest Civilian Awards from Royal Kingdom of Bahrain and Mongolia. He has been conferred with 49 Honorary Doctorate awards from universities in India and abroad. He is the first Odia to be a member of both UGC and AICTE. He is currently the Member of Parliament (Lok Sabha) from Kandhamal, Odisha and also the President of Volleyball Federation of India. Besides, he is the founder of Parliamentarians for Indigenous People and Designated President ( India) of Democracy without Borders.\n\nAs a social reformer, he has been propagating “Art of Giving” (philosophy of life), a concept aimed at bringing peace and happiness around the globe, Kanyakiran to promote zero tolerance against gender based violence, Education for all for creating awareness on the importance of Education and many more like New Mind, New Dreams, India Against Negativity, Art of Appreciation to name a few. Despite all his achievements, he leads a simple lifestyle in a two room rented apartment as a bachelor, keeps on marching towards the cause of spreading smiles among millions and achieving zero poverty, zero hunger, zero illiteracy.",
    // 'Prof. Achyuta Samanta is an educationist, philanthropist, and social worker. He is the founder of Kalinga Institute of Industrial Technology (KIIT) and Kalinga Institute of Social Sciences (KISS), both educational institutions of global repute and recognition. KIIT is an Institution of Eminence and one of the most prominent universities in India and globe for professional education having more than 30,000 students from all over India and 53 other countries. KISS is a home for 60,000 indigenous children all absolutely free.\n\nBesides Education and tribal upliftment, healthcare and rural development, Shri. Samanta has contributed immensely to art, culture, literature, film, media, society and national integration. It is really incredible that the child who lost his father at the age of four, brought up amidst severe poverty and deprivation with seven siblings and a widow mother in a quaint village in Odisha has accomplished this monumental work without any favour or backing in such a short span of time for the society. He has converted the remote village ‘Kalarabanka’, Cuttack into a Smart Village and the entire Manpur Panchayat into a model Panchayat (cluster of villages).\n\nHe has been conferred with more than 50 International and National awards and over 200 state awards besides two highest Civilian Awards from Royal Kingdom of Bahrain and Mongolia. He has been conferred with 44 Honorary Doctorate awards from universities in India and abroad. He is the first Odia to be a member of both UGC and AICTE. He is currently the Member of Parliament (Lok Sabha) from Kandhamal, Odisha and also the President of Volleyball Federation of India.\n\nAs a social reformer, he has been propagating “Art of Giving” (philosophy of life), a concept aimed at bringing peace and happiness around the globe.\n\nDespite all his achievements, he leads a simple lifestyle, keeps on marching towards the cause of spreading smile among millions and achieving zero poverty, zero hunger, zero illiteracy.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FAchyuta-Samanta-Photo-2.jpg?alt=media&token=83bb3ea8-2527-462a-9b2e-68ca6c985ae6',
  ),
  new About(
    name: 'Art of Giving',
    description:
        "Art of Giving is all about creating an unconditional and sustainable abundance of love, peace and happiness, and contentment for others through gestures of kindness and generosity. It was founded by Shri Achyuta Samanta on 17 May 2013. The key to peace and happiness lies in unlocking the Art of Giving in each individual. It is a not-for-profit initiative for spreading, supporting, and promoting the practice of the art of giving around the world.\n\nVISION: To bring together the sense of peace and happiness among people of all ages, especially children and youth through genuine acts of giving back to society by the practice of empathy and compassion to the distressed without any discrimination.\n\nMISSION: To make people aware and spread the philosophy of the Art of Giving across all sections of human society worldwide through activities of sharing love, care, compassion, wisdom, knowledge, skills, and talents.",
    // 'Art of Giving is all about creating an unconditional and sustainable abundance of love, peace and happiness and contentment for others through gestures of kindness and generosity. It was founded by Shri Achyuta Samanta on 17 May 2013. The key to peace and happiness lies in unlocking the Art of Giving in each individual. It is a not-for-profit initiative for spreading, supporting and promoting the practice of the art of giving around the world.\n\nVISION:To bring together the sense of peace and happiness among people of all ages, especially children and youth through genuine acts of giving back to the society by the practice of empathy and compassion to the distressed without any discrimination.\n\nMISSION:To make people aware and spread the philosophy of the Art of Giving across all sections of human society worldwide through activities of sharing love, care, compassion, wisdom, knowledge, skills and talents.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FAOG-Logo.png?alt=media&token=88f2e793-48d2-4c57-a0f4-c6b384e0ad52',
  ),
  new About(
    name: 'Incredible India',
    description:
        "One of the oldest civilizations in the world, India is a mosaic of multicultural experiences. With a rich heritage and myriad attractions, the country is among the most popular tourist destinations in the world. It covers an area of 32, 87,263 sq. km, extending from the snow-covered Himalayan heights to the tropical rain forests of the south. As the 7th largest country in the world, India stands apart from the rest of Asia, marked off as it is by mountains and the sea, which give the country a distinct geographical entity. Fringed by the Great Himalayas in the north, it stretches southwards and at the Tropic of Cancer, tapers off into the Indian Ocean between the Bay of Bengal on the east and the Arabian Sea on the west. As you travel the expanse of the country, you are greeted by diverse nuances of cuisines, faiths, arts, crafts, music, nature, lands, tribes, history, and adventure sports. India has a mesmeric conflation of the old and the new. As the bustling old bazaars rub shoulders with swanky shopping malls, and majestic monuments accompany luxurious heritage hotels, the quintessential traveler can get the best of both worlds. Head to the mountains, enjoy a beach retreat, or cruise through the golden Thar, India has options galore for all. India is home to the finest architectural heritage, serene ghats, spectacular landscapes, and the largest tiger reserve.",
    // 'One of the oldest civilisations in the world, India is a mosaic of multicultural experiences. With a rich heritage and myriad attractions, the country is among the most popular tourist destinations in the world. It covers an area of 32, 87,263 sq. km, extending from the snow-covered Himalayan heights to the tropical rain forests of the south. As the 7th largest country in the world, India stands apart from the rest of Asia, marked off as it is by mountains and the sea, which give the country a distinct geographical entity.\n\nFringed by the Great Himalayas in the north, it stretches southwards and at the Tropic of Cancer, tapers off into the Indian Ocean between the Bay of Bengal on the east and the Arabian Sea on the west. As you travel the expanse of the country, you are greeted by diverse nuances of cuisines, faiths, arts, crafts, music, nature, lands, tribes, history and adventure sports. India has a mesmeric conflation of the old and the new. As the bustling old bazaars rub shoulders with swanky shopping malls, and majestic monuments accompany luxurious heritage hotels, the quintessential traveller can get the best of both worlds. Head to the mountains, enjoy a beach retreat or cruise through the golden Thar, India has options galore for all.\n\nIndia is a home to the finest architectural heritage, serene ghats, spectacular landscapes and largest tiger reserve.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fii.png?alt=media&token=63a0af24-c17f-427e-acde-13d9489e017b',
  ),
  new About(
    name: 'Previous Editions',
    description:
        "One of India's top universities, Kalinga Institute of Industrial Technology (KIIT), is famous for the caliber of its teaching and research. It was established as an industrial training institute in Bhubaneswar in 1992–1993, in a leased home with 12 pupils and 2 teachers. In the age of unpopular schooling and much cautious embracing of globalization, Prof. Achyuta Samanta had a vision for a school that would emphasize academic excellence and offer uncountable chances for students to acquire comprehensive knowledge with very little financial support.\n\nWith just three programmes to begin with—Engineering, MBA, and MCA—KIIT's dedication to quality led to the Ministry of HRD, Government of India, awarding it Deemed to be University status under Section 3 of UGC Act, 1956, in 2004. This made KIIT the earliest Institute to achieve the distinction of obtaining University status in less than 6 years, which has been proudly inscribed in the Limca Book of Records. It has been ranked No. 1 among self-financing institutions of the country in the Atal Ranking of Institutions on Innovation Achievements (ARIIA), 2022 of the Ministry of Education, Government of India. It is India's 1st QS 5 Stars Rated University (QS World University Ranking) and is the only University of India to hold the Prestigious ISAS badge (International Associations of University) and the only University of India to win the The Awards Asia for Leadership and Management by Times Higher Education Rankings for its unstinting commitment to its staff and students. Recently, KIIT ranked 8th globally for Reducing Inequalities by the Times Higher Education Impact Rankings 2022 and also ranked 20th by NIRF, Govt. of India.on.\n\n30,000 students are educated at KIIT, who come from 65 different nations and all around India. Through its 23 schools, it offers more than 115 academic programmes, and more than 195 international organizations collaborate with it in the workplace. More than 100 multinational corporations and numerous national companies obtain their personnel from KIIT for placement. For its outstanding contribution in the field of sports and games, KIIT has been awarded as the best Sports University of India (Sportstar Aces Award). The University has a long history of holding numerous international and national seminars, congresses, workshops, and even important sporting events in practically every topic of interest. With its expansive 25 Square Kilometer Academic Township, 23 World Class Campuses, 2500+ illustrious Faculty and Researchers, 16 Sports Complexes, largest indoor and outdoor stadiums of any university, 15 Food Courts, and greenest campus in India, KIIT offers a holistic approach to human development that is unmatched in the nation. Instead of resting on its past success and rapid expansion, KIIT looks forward to reaching greater heights in academics, research, and global rankings.",
    // 'KIIT International MUN has been hosting a chain of successful editions since its inception in 2013. Having established the stronghold in its debut edition, KIIT MUN has been able to uphold the calibre of its diplomats and its commitment to making an impact, and ever since, the event has been setting a benchmark a little higher with every edition. The anticipation keeps escalating with each year and we have come a long way- starting with a meagre number of participants in 2013 to 2,500 in 2016, we kept things consistent and the growth static up till 2019 with the same enthusiasm. The enormous world is divided by its selfish interests and we strive to make it smaller, uniting it in the process through participation from not just the renowned institutions and organisations in our nation, but from countries and nations from every nook and corner of the world.\n\nIn its previous editions, KIIT International MUN, the largest MUN of its kind in South Asia, has been graced by the presence of eminent personalities who are renowned in all walks of life. KIIT International MUN has been a stage for various comedians like Bishwa Kalyan Rath, Kenny Sebastian, Rahul Subramanian, Abish Mathew, and Gaurav Kapur, the platform shared by the likes of Mr Kamal Singh, the Executive Director of UN Global Compact Network India, Allen Gammel OBE, Director of the British Council India, Debanjan Chakrabarti – Director British Council, East India, and by a plethora of foreign diplomats and emissaries like Mr Hector Cueva Jacome, Ambassador of Ecuador in India; Mr Fleming Raul Duarte Ramos, Ambassador of Paraguay to India; Mr Claudio Ansorena Montero, Ambassador of Costa Rica to India and Mrs Barbara Wickham, Director of British Council in India, political personalities like Akhilesh Yadav, and other distinguished speakers and diplomats. Since the very first edition, the significance and popularity of the conference have grown exponentially; hosting esteemed personalities to conduct resourceful workshops, deliberating about global concerns for an entire day with representatives of other nations and celebrating together through music and dance, amidst smiles. Even amidst the global pandemic, KIIT International MUN adapted to the virtual mode of organising the conference in 2021, successfully bringing together around 450 delegates from every nook and corner of the nation. Not letting the circumstances and the non-feasibility of organising the conference physically deter, KIIT International eMUN was made a success. From diplomats and dignitaries who graced the occasion virtually to a stand-up comedy show featuring Mr Gaurav Kapur, the spirit of MUN was upheld triumphantly.\n\nKIIT International Model United Nations has successfully catered to diplomacy and merriment of participants and has played a pivotal role in bringing about a revolution in the MUN circuit that the dilemmas that were dissected into by young delegates, seemed a bit more surmountable. With a beautiful legacy, KIIT International MUN looks forward to be organised with more devout enthusiasm and participation than ever before, taking into account each success, and looking out to ameliorate and uphold the very spirit of a united world.',
    imageUrl: '',
  ),
];

const galleryList = [
  '/assets/img/galleries/1.jpg',
  '/assets/img/galleries/2.jpg',
  '/assets/img/galleries/3.jpg',
  '/assets/img/galleries/6.jpg',
  '/assets/img/galleries/68486609_1171700466355347_2764202133791178752_o.jpg',
  '/assets/img/galleries/69169850_1173642672827793_6279335701074935808_o.jpg',
  '/assets/img/galleries/69388625_1171697006355693_1952834682173259776_o.jpg',
//'/assets/img/galleries/70304577_1171536479705079_6276567749271486464_o.jpg',
  '/assets/img/galleries/70316786_1171571026368291_3552353685151416320_o.jpg',
  '/assets/img/galleries/70398852_1171703746355019_2539602935080288256_o.jpg',
  '/assets/img/galleries/70450172_1172522102939850_1429070601611378688_o.jpg',
  '/assets/img/galleries/70459740_1171330109725716_4823369949831495680_o.jpg',
  '/assets/img/galleries/70476482_1171681123023948_7081319641288540160_o.jpg',
  '/assets/img/galleries/70477008_1171571706368223_9126131121120083968_o.jpg',
  '/assets/img/galleries/70508047_1171319003060160_3026056248194760704_o.jpg',
  '/assets/img/galleries/70598744_1171311306394263_4612954472593752064_o.jpg',
  '/assets/img/galleries/70640297_1171332219725505_4889040850190860288_o.jpg',
  '/assets/img/galleries/70663474_1172575182934542_7998864907871191040_o.jpg',
  '/assets/img/galleries/70701613_1171603379698389_2184779550565597184_o.jpg',
  '/assets/img/galleries/70720931_1171536346371759_352463016517697536_o.jpg',
  '/assets/img/galleries/70725500_1172539126271481_5540165807889186816_o.jpg',
  '/assets/img/galleries/70731207_1171576503034410_5513922539803377664_o.jpg',
  '/assets/img/galleries/70746126_1172529812939079_474252474962673664_o.jpg',
  '/assets/img/galleries/70762646_1171346293057431_642836237752729600_o.jpg',
//'/assets/img/galleries/70783643_1171324406392953_4981888692986576896_o.jpg',
//'/assets/img/galleries/70788707_1174164629442264_4307940755818676224_o.jpg',
//'/assets/img/galleries/70823062_1171342459724481_1465209762109980672_o.jpg',
  '/assets/img/galleries/70831703_1174199259438801_2083087554063630336_o.jpg',
//'/assets/img/galleries/70846880_1171563973035663_7420587766653648896_o.jpg',
  '/assets/img/galleries/70884794_1173600132832047_4645870582259253248_o.jpg',
  '/assets/img/galleries/70896615_1171559193036141_6783838150394380288_o.jpg',
  '/assets/img/galleries/70947614_1172577749600952_4591012283542405120_o.jpg',
  '/assets/img/galleries/70954830_1171534803038580_5392270546081677312_o.jpg',
  '/assets/img/galleries/71012628_1172589779599749_8606694589476110336_o.jpg',
  '/assets/img/galleries/71015843_1171532759705451_1326261539950297088_o.jpg',
  '/assets/img/galleries/71029007_1172526276272766_2183943436397182976_o.jpg',
  '/assets/img/galleries/71030080_1171334259725301_7994853756309078016_o.jpg',
  '/assets/img/galleries/71088605_1173817099477017_2834290133136572416_o.jpg',
  '/assets/img/galleries/71119181_1172591226266271_2447258664315125760_o.jpg',
  '/assets/img/galleries/71180504_1174165246108869_4234980037532581888_o.jpg',
  '/assets/img/galleries/71189426_1171700973021963_5791812726355394560_o.jpg',
  '/assets/img/galleries/71223095_1171700606355333_1998368512401211392_o.jpg',
  '/assets/img/galleries/71239770_1171311503060910_5500455279004745728_o.jpg',
  '/assets/img/galleries/71259051_1172789009579826_1273763592050573312_o.jpg',
//'/assets/img/galleries/71272240_1173611636164230_6031492470070575104_o.jpg',
//'/assets/img/galleries/71350062_1172179692974091_8203118155011194880_o.jpg',
//'/assets/img/galleries/71583941_1171545209704206_1120443511670308864_o.jpg',
//'/assets/img/galleries/71645968_1172521726273221_4482618033524703232_o.jpg',
//'/assets/img/galleries/71677626_1172499799608747_84683556642619392_o.jpg',
//'/assets/img/galleries/71688298_1172499976275396_6410043001980059648_o.jpg',
//'/assets/img/galleries/71715647_1171635909695136_4735296439926652928_o.jpg',
  '/assets/img/galleries/71767894_1171702999688427_7950864001183776768_o.jpg',
//'/assets/img/galleries/72113371_1173817186143675_6561523805565485056_o.jpg',
];

List<String> testimonials = [
  "Shouldering the responsibility of heading the Secretariat of KIIT MUN 2022 as the Secretary General is a matter of great pride for me. Being a student involved with MUN since the very first year of my graduation, I have seen the conference and the passion among participants grow with every subsequent edition. KIIT International MUN being the result collaborative teamwork has helped me develop organizational skills that I am sure to take away with me into the real world. I hope this offline edition following two editions chaired online will be able to make its mark, living up to the legacy of KIIT International MUN.",
  "Being the DSG of the gathering this year has been a staggering inclination if you were  to ask me, I can guarantee that this will be a groundbreaking encounter for everybody out there considering the way that KIIT MUN will be quite possibly one of the most monstrous and phenomenal procedure this year as in 3 years this is the first occasion that KIIT MUN will be held offline.",
  "MUN has been one of my favorite activities since my school days. Right when I enrolled in KIIT, KIITMUN was something that got me excited and energized. It has been a long journey  from delegating in KIITMUN to organizing it. I genuinely hope each and every participant  this year will have an incredible and enriching learning experience. ",
  "There are a couple of things in life that are an essential piece of me. KIITMUN is one of those things. Right from my freshman year until my senior year, KIITMUN has assisted me with developing personally and made me a superior version of myself. ",
  "KIITMUN is one of the largest MUN conferences in Asia. It began in the year 2013 and has been developing from that point onward. This conference has exclusively propelled endless energetic and youthful personalities and I truly wish that in this edition we will be able to reach out to more youngsters and make the experience a far more significant one. ",
];

List<String> imagesOfTop5 = [
  "https://kiitmun.org/assets/img/members/sagnik-ghosh.png",
  "https://kiitmun.org/assets/img/members/manas-mishra.png",
  "https://kiitmun.org/assets/img/members/rhea-sinha.png",
  "https://kiitmun.org/assets/img/members/surarchi-kumar.png",
  "https://kiitmun.org/assets/img/members/om-chaitanya.png",
];

List<String> committeeNames = [
  "UNCTAD",
  "WHA",
  "UNHRC",
  "IP",
  "DISEC",
  "UNCCPCJ",
  "IPCC",
  "SPECPOL",
  "WB",
  "UNCSW",
  "UNIAEC",
  "UNSC",
  "JCC",
  "OIC",
  "UNPBC",
];

List<String> committeeImage = [
  "https://kiitmun.org/assets/img/posters/UNCTAD.jpg",
  "https://kiitmun.org/assets/img/posters/WHA.png",
  "https://kiitmun.org/assets/img/posters/UNHRC-01.jpg",
  "https://kiitmun.org/assets/img/posters/IP_FINAL.jpg",
  "https://kiitmun.org/assets/img/posters/DISEC-01.png",
  "https://kiitmun.org/assets/img/posters/UNCCPCJ.jpg",
  "https://kiitmun.org/assets/img/posters/IPCC.jpg",
  "https://kiitmun.org/assets/img/posters/SPECPOL.jpg",
  "https://kiitmun.org/assets/img/posters/WB.jpg",
  "https://kiitmun.org/assets/img/posters/UNCSW.png",
  "https://kiitmun.org/assets/img/posters/UNIAEA.jpg",
  "https://kiitmun.org/assets/img/posters/SC.jpg",
  "https://kiitmun.org/assets/img/posters/JCC.jpg",
  "https://kiitmun.org/assets/img/posters/OIC.jpg",
  "https://kiitmun.org/assets/img/posters/UNPBC.jpg",
];

List<String> logo = [
  "assets/committees/UNCTAD.png",
  "assets/committees/WHA.png",
  "assets/committees/UNHRC.png",
  "assets/committees/IP.png",
  "assets/committees/DISEC.png",
  "assets/committees/UNCCPCJ.png",
  "assets/committees/IPCC.png",
  "assets/committees/SPECPOL.png",
  "assets/committees/WB.png",
  "assets/committees/UNCSW.png",
  "assets/committees/UNIAEA.png",
  "assets/committees/UNSC.png",
  "assets/committees/JCC.png",
  "assets/committees/OIC.png",
  "assets/committees/UNPBC.png",
];

List<String> fullForms = [
  "United Nations Conference on Trade and Development",
  "World Health Association",
  "United Nations Human Rights Council",
  "International Press",
  "Disarmament and International Security Committee",
  "United Nations Commission on Crime Prevention and Criminal Justice",
  "Intergovernmental Panel on Climate Change",
  "Special Political and Decolonization Committee",
  "World Bank",
  "United Nations Commission on the Status of Women",
  "United Nations International Atomic Energy Agency",
  "United Nation Security Council",
  "Joint Crisis Committee",
  "Organisation of Islamic Cooperation",
  "United Nations Peacebuilding Commission",
];

List<String> level = [
  "Beginner",
  "Beginner",
  "Beginner",
  "Beginner",
  "Beginner",
  "Beginner",
  "Intermediate",
  "Intermediate",
  "Intermediate",
  "Intermediate",
  "Intermediate",
  "Advanced",
  "Advanced",
  "Advanced",
  "Advanced",
];

List<String> delegate = [
  "Double",
  "Double",
  "Double",
  "Single",
  "Single",
  "Single",
  "Double",
  "Single",
  "Double",
  "Single",
  "Single",
  "Single",
  "Single",
  "Single",
  "Single",
];

List<String> agenda = [
  "https://kiitmun.org/assets/img/agendas/unctad.png",
  "https://kiitmun.org/assets/img/agendas/wha.png",
  "https://kiitmun.org/assets/img/agendas/unhrc.png",
  "IP",
  "https://kiitmun.org/assets/img/agendas/disec.png",
  "https://kiitmun.org/assets/img/agendas/unccpcj.png",
  "https://kiitmun.org/assets/img/agendas/ipcc.png",
  "https://kiitmun.org/assets/img/agendas/specpol.png",
  "https://kiitmun.org/assets/img/agendas/wb.png",
  "https://kiitmun.org/assets/img/agendas/uncsw.png",
  "https://kiitmun.org/assets/img/agendas/uniaea.png",
  "https://kiitmun.org/assets/img/agendas/sc.png",
  "https://kiitmun.org/assets/img/agendas/jcc.png",
  "https://kiitmun.org/assets/img/agendas/oic.png",
  "https://kiitmun.org/assets/img/agendas/unpbc.png",
];

List<String> eb = [
  'https://kiitmun.org/assets/img/EB/unctad.png',
  "https://kiitmun.org/assets/img/EB/wha.png",
  "https://kiitmun.org/assets/img/EB/unhrc.png",
  "https://kiitmun.org/assets/img/EB/IP.png",
  "https://kiitmun.org/assets/img/EB/disec.png",
  "https://kiitmun.org/assets/img/EB/unccpcj.png",
  "https://kiitmun.org/assets/img/EB/ipcc.png",
  "https://kiitmun.org/assets/img/EB/specpol.png",
  "https://kiitmun.org/assets/img/EB/WB.png",
  "https://kiitmun.org/assets/img/EB/uncsw.png",
  "https://kiitmun.org/assets/img/EB/uniaea.png",
  "",
  "https://kiitmun.org/assets/img/EB/jcc.png",
  "https://kiitmun.org/assets/img/EB/OIC.png",
  "https://kiitmun.org/assets/img/EB/unpbc.png",
];

List<String> studyGuide = [
  "https://kiitmun.org/study_docs/unctad_merged.pdf",
  "https://kiitmun.org/study_docs/wha_merged.pdf",
  "https://kiitmun.org/study_docs/unhrc_merged.pdf",
  "https://kiitmun.org/study_docs/ip_merged.pdf",
  "https://kiitmun.org/study_docs/disec_merged.pdf",
  "https://kiitmun.org/study_docs/unccpcj_merged.pdf",
  "https://kiitmun.org/study_docs/ipcc_merged.pdf",
  "https://kiitmun.org/study_docs/specpol_merged.pdf",
  "https://kiitmun.org/study_docs/wb_merged.pdf",
  "https://kiitmun.org/study_docs/uncsw_merged.pdf",
  "https://kiitmun.org/study_docs/iaea_merged.pdf",
  "https://kiitmun.org/study_docs/unsc_merged.pdf",
  "https://kiitmun.org/study_docs/jcc_merged.pdf",
  "https://kiitmun.org/study_docs/oic_merged.pdf",
  "https://kiitmun.org/study_docs/unpbc_merged.pdf",
];

List<String> collabs = [
  "assets/Collaborators/Asset1.png",
  "assets/Collaborators/Asset2.png",
  "assets/Collaborators/Asset3.png",
  "assets/Collaborators/Asset4.png",
  "assets/Collaborators/Asset5.png",
  "assets/Collaborators/Asset6.png",
  "assets/Collaborators/Asset7.png",
  "assets/Collaborators/Asset8.png",
  "assets/Collaborators/Asset9.png",
  "assets/Collaborators/Asset10.png",
  "assets/Collaborators/Asset11.png",
  "assets/Collaborators/Asset12.png",
  "assets/Collaborators/Asset13.png",
  "assets/Collaborators/Asset14.png",
];
