import 'package:flutter/foundation.dart';
import 'package:mun/models/about.dart';

DateTime now = new DateTime.now();
// DateTime eventDate = DateTime.now().add(Duration(seconds: 10));
DateTime eventDate = new DateTime(2021, 1, 29, 8);
int days, hours, minutes, seconds;
bool done = false;

ValueNotifier valueNotifier = ValueNotifier(false);

List<String> images = [
  //'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2F1.jpg?alt=media&token=06173b37-fde0-4a63-8873-5cf26c6525e5',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2F2.jpg?alt=media&token=8f9a54e9-f1cc-458b-a9c8-380144dd22c7',
  //'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2F3.jpg?alt=media&token=b22c35e9-f489-4ae2-9d9f-ccaac1caea30',
  //'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2F4.jpg?alt=media&token=3694a801-15fe-4625-8450-e4cd6546dfb4',
  //'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2F5.jpg?alt=media&token=adef6170-b1ee-49e2-b05b-9d0d7c748d9d',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2F6.jpg?alt=media&token=0b4391a2-b214-4bb2-8506-31139462e880',
  //'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2FInternational-Flags-Small.jpg?alt=media&token=c8623b7c-2210-49fb-be5c-1baeb2af0576',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/carousel%2FInternational-Flags.jpg?alt=media&token=50e08258-b315-40d9-8ef8-8d0dc49d2020',
];

String munLogo = 'assets/kiitMUN.png';

String eMunBlack = 'assets/emun_black.png';

String eMunWhite = 'assets/emun_white.jpg';

List<About> abouts = [
  new About(
    name: 'KIIT',
    description:
        'Established as a modest institute in the idyllic city of Bhubaneswar in June 1992, Kalinga Institute of Industrial Technology is now a profound institute for learning with a vision, to build an imperishable society through education which revolves around boundless learning, research and development. With our motto, “Knowledge is that which liberates”, it is a multidisciplinary varsity with an avant-garde infrastructure, comprising of twenty-three lush green world class campuses with academic wings, amphitheaters, auditoriums, conference rooms and smart class rooms.\n\nHaving been granted the status of Deemed To Be University by the Ministry of HRD, Govt. of India in 2004, KIIT has been accorded the accreditation of the ‘A’ grade, by NAAC of UGC. KIIT offers more than 100 academic programs ranging from engineering to management, law to film studies. With 1800 faculties, 27000 students and 25 sq.km academic township, KIIT lets its students to explore new dimensions, enrich themselves and experience the best.\n\nInculcating global prospective, KIIT stands 8th among the reputed private universities in India, proclaimed as an ‘A’ category, by the Ministry of HRD, Govt. of India, accredited by IET, UK as well as the ‘Tier-1’ accreditation (Washington Accord) for all  engineering  streams by the NBA, and is also a younger member of Association of Commonwealth Universities.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fkiit.png?alt=media&token=21926ee7-578f-427a-bb64-63cf81bc6c85',
  ),
  new About(
    name: 'KISS',
    description:
        'Kalinga Institute of Social Sciences, the first tribal Deemed to Be University in India which started with 125 poor tribal children in 1993, in a rented house at Bhubaneswar. A sister concern of Kalinga Institute of Information Technology (KIIT), Kalinga Institute of Social Sciences (KISS) with more than 27,000 children and 62 indigenous tribes of Odisha, has been a home for over 37,000 students. KISS is a free of cost, fully residential educational institute, exclusively for penurious tribal children.\n\nThese children are provided with free holistic education, skill development, career opportunities, food, accommodation, health care, and other basic necessities. With our Founder, Dr. Achyuta Samanta’s vision, KISS works to eradicate poverty, illiteracy and unemployment through quality education. KISS has always nurtured a vision of a world which is free of hunger, poverty and illiteracy. UNESCO, UNICEF, UNFPA, as well as the US Federal Government have associated themselves with KISS for several initiatives and programs that have been undertaken by the institute.\n\nKISS aspires to work more and plans to open branches in all thirty districts of Odisha and also all the states of India. A branch of KISS, KISS-DELHI is successfully operating in NCR with the collaboration of Government Of Delhi.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fkiss.png?alt=media&token=753f241f-7684-404f-8c0d-c9214e61da28',
  ),
  new About(
    name: 'Founder',
    description:
        'Prof. Achyuta Samanta is an educationist, philanthropist, and social worker. He is the founder of Kalinga Institute of Industrial Technology (KIIT) and Kalinga Institute of Social Sciences (KISS), both educational institutions of global repute and recognition. KIIT is an Institution of Eminence and one of the most prominent universities in India and globe for professional education having more than 30,000 students from all over India and 53 other countries. KISS is a home for 60,000 indigenous children all absolutely free.\n\nBesides Education and tribal upliftment, healthcare and rural development, Shri. Samanta has contributed immensely to art, culture, literature, film, media, society and national integration. It is really incredible that the child who lost his father at the age of four, brought up amidst severe poverty and deprivation with seven siblings and a widow mother in a quaint village in Odisha has accomplished this monumental work without any favour or backing in such a short span of time for the society. He has converted the remote village ‘Kalarabanka’, Cuttack into a Smart Village and the entire Manpur Panchayat into a model Panchayat (cluster of villages).\n\nHe has been conferred with more than 50 International and National awards and over 200 state awards besides two highest Civilian Awards from Royal Kingdom of Bahrain and Mongolia. He has been conferred with 44 Honorary Doctorate awards from universities in India and abroad. He is the first Odia to be a member of both UGC and AICTE. He is currently the Member of Parliament (Lok Sabha) from Kandhamal, Odisha and also the President of Volleyball Federation of India.\n\nAs a social reformer, he has been propagating “Art of Giving” (philosophy of life), a concept aimed at bringing peace and happiness around the globe.\n\nDespite all his achievements, he leads a simple lifestyle, keeps on marching towards the cause of spreading smile among millions and achieving zero poverty, zero hunger, zero illiteracy.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FAchyuta-Samanta-Photo-2.jpg?alt=media&token=83bb3ea8-2527-462a-9b2e-68ca6c985ae6',
  ),
  new About(
    name: 'Art of Giving',
    description:
        'Art of Giving is all about creating an unconditional and sustainable abundance of love, peace and happiness and contentment for others through gestures of kindness and generosity. It was founded by Shri Achyuta Samanta on 17 May 2013. The key to peace and happiness lies in unlocking the Art of Giving in each individual. It is a not-for-profit initiative for spreading, supporting and promoting the practice of the art of giving around the world.\n\nVISION:To bring together the sense of peace and happiness among people of all ages, especially children and youth through genuine acts of giving back to the society by the practice of empathy and compassion to the distressed without any discrimination.\n\nMISSION:To make people aware and spread the philosophy of the Art of Giving across all sections of human society worldwide through activities of sharing love, care, compassion, wisdom, knowledge, skills and talents.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FAOG-Logo.png?alt=media&token=88f2e793-48d2-4c57-a0f4-c6b384e0ad52',
  ),
  new About(
    name: 'Incredible India',
    description:
        'One of the oldest civilisations in the world, India is a mosaic of multicultural experiences. With a rich heritage and myriad attractions, the country is among the most popular tourist destinations in the world. It covers an area of 32, 87,263 sq. km, extending from the snow-covered Himalayan heights to the tropical rain forests of the south. As the 7th largest country in the world, India stands apart from the rest of Asia, marked off as it is by mountains and the sea, which give the country a distinct geographical entity.\n\nFringed by the Great Himalayas in the north, it stretches southwards and at the Tropic of Cancer, tapers off into the Indian Ocean between the Bay of Bengal on the east and the Arabian Sea on the west. As you travel the expanse of the country, you are greeted by diverse nuances of cuisines, faiths, arts, crafts, music, nature, lands, tribes, history and adventure sports. India has a mesmeric conflation of the old and the new. As the bustling old bazaars rub shoulders with swanky shopping malls, and majestic monuments accompany luxurious heritage hotels, the quintessential traveller can get the best of both worlds. Head to the mountains, enjoy a beach retreat or cruise through the golden Thar, India has options galore for all.\n\nIndia is a home to the finest architectural heritage, serene ghats, spectacular landscapes and largest tiger reserve.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fii.png?alt=media&token=63a0af24-c17f-427e-acde-13d9489e017b',
  ),
  new About(
    name: 'Previous Version',
    description:
        'KIIT International MUN has hosted a chain of successful editions since its maiden conference in 2013. Establishing the stronghold in its maiden year itself, KIITMUN was able to uphold the calibre of its diplomats and its commitment to making an impact, and since then the event has been setting the benchmark a little higher with every edition. The anticipation keeps escalating each year - starting with a few participants in 2013 to 2,500 in 2016 to over 2000 in 2019 - we have come a long way since. Our enormous world is divided by its selfish interests and we strive to make it smaller and united by bringing in participation from not just the renowned institutions and organizations of our nation, but from countries that span every corner of the world.\n\nIn its previous editions, KIIT International MUN had been graced by eminent personalities from all walks of life. It has been a stage for veteran comedians like Biswa Kalyan Rath, Kenny Sebastian,Rahul Subramanian and Abish Mathew shared at the same time by the likes of Mr. Kamal Singh, the Executive Director of UN Global Compact Network India; Allen Gammel OBE, Director of the British Council India; Padma Bhushan Mr. Rajat Sharma; Mr. Suhel Seth, distinguished Speaker and Actor; Mr. Akhilesh Yadav, Former Chief Minister, Uttar Pradesh; Debanjan Chakrabarti – Director British Council, East India; Mr. Punya Prasun Bajpai, the news anchor and executive editor at Aaj Tak, Mr. Hector Cueva Jacome, Ambassador of Ecuador in India; Mr. Fleming Raul Duarte Ramos, Ambassador of Paraguay to India; Mr. Claudio Ansorena Montero, Ambassador of Costa Rica to India and Mrs. Barbara Wickham, Director of British Council in India. Since its first edition, the popularity and significance of the conference have grown exponentially; hosting eminent personalities to conducting resourceful working shops, inclemently deliberating about global concerns for an entire day with representatives of other nations and dancing, singing and celebrating with the same people at the end of the day.\n\nKIIT International Model UN has successfully catered to diplomacy and merriment of the participants alike and has played such a pivotal role in bringing about a revolution in the Model United Nations circuit that the dilemmas that were dissected into by these young delegates seemed a bit more surmountable.',
    imageUrl: '',
  ),
  new About(
    name: 'KIIT MUN Society',
    description:
        'For great ideas and plausible resolutions, one needs human interaction, arguments and debates. The KIIT MUN Society is an exemplary representation of the same. Founded in 2013 by the ambitious alumni of KIIT – Snehadeep Kayet, Ashesh Das and Siddhant Sadangi – the society has, since its inception, kept the fire of diplomacy and debate aflame.\n\nThe formation of KIITMUN Society marked a revolution in the MUN circuit of the country, and by simulating KIIT MUN 2013, the community grabbed the attention of the potential and enthusiastic MUNers across the country which is evident by the participation of around one thousand delegates in the maiden edition of the event.The optimism of the society lies in the individual characters.\n\nSince 2013, the society has aspired to grow in terms of both quality and achievements. Erudite personalities like Soumya Basu, Abhradeep Mukherjee, and Shankha Das have exhibited their profound potential as leaders and mentors with their indomitable spirits and knowledge. They displayed pragmatic approach while arranging various events and the annual KIIT International MUN, and thereby retained the legacy that was initiated in the year 2013.\n\nVarious students of KIIT, pursuing studies in different fields of education, and belonging to varied streams like Law, Biotechnology, Medicine, Arts, along with Engineering, have cumulatively joined in this endeavour to make the society reach its pinnacle of success. Apart from administering the KIIT MUN annually, the society also takes the initiative to arrange periodic sessions for the ardent MUN enthusiasts.\n\nThe society tries to mould them by imparting knowledge about international relations in a global context. These sessions convey various facts and figures encompassing the working bodies, as well as the various committees of the United Nations. Additionally, KIIT MUN Society actively organizes workshops to portray a detailed picture of the actual working procedure of the MUN, thereby helping individuals to incorporate the basic information of the United Nations as well.\n\nThe KIIT MUN Society – the name itself, brings upon an emotion indescribable.  It is not just a student body, but, is a second family for the people associated with it. With the promise of carrying forward the legacy in the coming years, the society –currently is in its seventh year, is in the process of organizing KIIT International MUN 2019, under the guidance of the present kingpins of the society.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/mun_stuffs%2Fmun_society.jpg?alt=media&token=94fe10f8-2856-4114-96a3-f173f1a5c055',
  ),
];
