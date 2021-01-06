import 'package:flutter/foundation.dart';
import 'package:mun/models/about.dart';

var now = new DateTime.now();
//var eventDate = DateTime.now().add(Duration(seconds: 5));
var tomorrow = DateTime(2020, now.month, now.day + 1, 0, 0, 0, 0, 0);
var eventDate = new DateTime(2021, 1, 29, 8);
int days, hours, minutes, seconds;

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

List<String> agendaImages = [
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20WOMEN.jpg?alt=media&token=7f56e44a-e95d-4f69-8b21-26184dc0c57c',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20WHA.jpg?alt=media&token=79f6444a-1b69-4c00-b8d0-4ac06dd77dff',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20UNSC1.jpg?alt=media&token=d5b27f7b-74c1-4b77-ad11-670fb9c92536',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20UNSC.jpg?alt=media&token=21791dae-6fb4-4345-acfa-a147a1246cef',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20UNPBC.jpg?alt=media&token=0f8690c4-e240-4c43-91c6-550cbb4297e6',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20UNHRC.jpg?alt=media&token=9ff908c4-6d92-49f8-bf72-ac75463a8f6c',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20UNFCCC.jpg?alt=media&token=84a7dfc2-7fa8-4abd-a038-6653930fcb78',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20SPECPOL.jpg?alt=media&token=85f25f78-5aed-4e00-acf9-f0146773fffe',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20HCC.jpg?alt=media&token=1f7f0944-1fa6-4dd7-b2e6-b6f9f73e6ff2',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20ECOSOC2.jpg?alt=media&token=64d1cf7a-2cac-458e-877e-c02c525d66e7',
  'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/committees%2Fagenda_posters%2FAGENDA%20DISEC.jpg?alt=media&token=aee218df-3c30-4f69-bf18-266c453e2f5b',
];

String munLogo = 'assets/kiitMUN.png';

String eMunBlack = 'assets/emun_black.png';

String eMunWhite = 'assets/emun_white.jpg';

List<About> abouts = [
  new About(
    name: 'KIIT',
    description:
        'Established as a modest institute in the idyllic city of Bhubaneswar in June 1992, Kalinga Institute of Industrial Technology is now a profound institute for learning with a vision, to build an imperishable society through education which revolves around boundless learning, research and development.\n\nWith our motto, “Knowledge is that which liberates”, it is a multidisciplinary varsity with an avant-garde infrastructure, comprising of twenty-three lush green world class campuses with academic wings, amphitheaters, auditoriums, conference rooms and smart classrooms.\n\nHaving been granted the status of Deemed To Be University by the Ministry of HRD, Govt. of India in 2004, KIIT has been accorded the accreditation of the ‘A’ grade, by NAAC of UGC. KIIT offers more than 100 academic programs ranging from engineering to management, law to film studies. With 1800 faculties, 27000 students and 25 sq.km academic township, KIIT lets its students to explore new dimensions, enrich themselves and experience the best.\n\nInculcating global prospective, KIIT stands 8th among the reputed private universities in India, proclaimed as an ‘A’ category, by the Ministry of HRD, Govt. of India, accredited by IET, UK as well as the ‘Tier-1’ accreditation (Washington Accord) for all engineering streams by the NBA, and is also a younger member of Association of Commonwealth Universities.\n\nKIIT is committed to high quality research and provides a supportive environment for the students along with a broad scope of programs starting from kindergarten to post graduation.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fkiit.png?alt=media&token=21926ee7-578f-427a-bb64-63cf81bc6c85',
  ),
  new About(
    name: 'KISS',
    description:
        'Kalinga Institute of Social Sciences, the first tribal Deemed to Be University in India which started with 125 poor tribal children in 1993, in a rented house at Bhubaneswar.\n\nA sister concern of Kalinga Institute of Information Technology (KIIT), Kalinga Institute of Social Sciences (KISS) with more than 27,000 children and 62 indigenous tribes of Odisha, has been a home for over 37,000 students. KISS is a free of cost, fully residential educational institute, exclusively for penurious tribal children.\n\nThese children are provided with free holistic education, skill development, career opportunities, food, accommodation, health care, and other basic necessities. With our Founder, Dr. Achyuta Samanta’s vision, KISS works to eradicate poverty, illiteracy and unemployment through quality education.\n\nIt is a centre of learning for the underprivileged section of the society, with the philosophy of ‘Art Of Giving’. KISS has always nurtured a vision of a world which is free of hunger, poverty and illiteracy.\n\nUNESCO, UNICEF, UNFPA, as well as the US Federal Government have associated themselves with KISS for several initiatives and programs that have been undertaken by the institute. KISS aspires to work more and plans to open branches in all thirty districts of Odisha and also all the states of India. A branch of KISS, KISS-DELHI is successfully operating in NCR with the collaboration of Government Of Delhi.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fkiss.png?alt=media&token=753f241f-7684-404f-8c0d-c9214e61da28',
  ),
  new About(
    name: 'Founder',
    description:
        'Achyuta Samanta is the founder and mentor of Kalinga Institute of Industrial Technology (KIIT University) and Kalinga Institute of Social Sciences, a fully free and residential institute for 27,000 tribal children. The 54-year-old genius had commenced both institutes with just Rs 5,000 and a two-room rented house.\n\nThese immense universities stand as a testimony to his undeterred faith in himself and in his vision to educate the underprivileged. His next goal is to set up branches of Kalinga Institute of Social Sciences in 20 districts of Odisha, India within a couple of years and subsequently, in 20 states of India.\n\nProf. Samanta went on to serve KIIT as its first Chancellor and has had the distinction of being the youngest Chancellor of any Indian University. He served University Grants Commission (UGC) as its Member for two consecutive terms (2008-11 & 2011-2014) and was a Member of the Executive Committee of All Indian Council.\n\nKalinga Institute of Social Sciences was granted Deemed University status by the Ministry of Human Resources Development, making it the first exclusively tribal university in the world. His private professional institute, KIIT University, also has more than 27,000 students from 40 countries pursuing different streams including engineering, medicine and law and has a turnover of Rs 1,000 crore per annum.\n\nHe was also the General President of the Indian Science Congress Association 2017-18. He has received a number of awards and created new records in the field of social entrepreneurship. He has been mentioned among the Top 15 Social Entrepreneurs of the World by the American Edge Foundation. He appears in The Limca Book of Records as the youngest chancellor of any University in India.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FAchyuta-Samanta-Photo-2.jpg?alt=media&token=83bb3ea8-2527-462a-9b2e-68ca6c985ae6',
  ),
  new About(
    name: 'Art of Giving',
    description:
        'Art of Giving is all about creating an unconditional and sustainable abundance of love, peace and happiness, and contentment for others through gestures of kindness and generosity. It was founded by Shri Achyuta Samanta on 17 May 2013. The key to peace and happiness lies in unlocking the Art of Giving in each individual. It is a not-for-profit initiative for spreading, supporting, and promoting the practice of the art of giving around the world.\nVISION: To bring together the sense of peace and happiness among people of all ages, especially children and youth through genuine acts of giving back to society by the practice of empathy and compassion to the distressed without any discrimination.\nMISSION: To make people aware and spread the philosophy of the Art of Giving across all sections of human society worldwide through activities of sharing love, care, compassion, wisdom, knowledge, skills, and talents.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FAOG-Logo.png?alt=media&token=88f2e793-48d2-4c57-a0f4-c6b384e0ad52',
  ),
  new About(
    name: 'Incredible India',
    description:
        'Considering its heterogeneity, India is often endearingly referred to not a country but a continent. Stretching from the frozen summits of the Himalayas to the tropical greenery of Kerala, its expansive borders encompass an incomparable range of landscapes, cultures and people. A subcontinent sitting right beneath China and Nepal, India is globally known for its diversity.\n\nBe it geographical or cultural aspects, India has something for everyone. For the ones seeking adventure, to name a few, India offers river rafting in the Brahmaputra river flowing through Arunachal Pradesh, mountaineering in the Garhwal and Kumaon district, and scuba diving in the Andaman and Nicobar islands. For the ones seeking inner peace, India has Dharamshala in Himachal Pradesh, and for the ones simply looking to have a good time, there’s always Goa, Manali and Ooty.\n\nOne of the most striking features of India is its people. With a motto of ‘Atithi Devo Bhava’ which translates to - “The guest is equivalent to God,” Indians are always more than eager to welcome everybody into their country with open arms and warm hearts. The country thrones upon its belief of ‘Unity in Diversity’.\n\nThe fact that it houses over a billion inhabitants with varied cultures, is proof of its heterogeneity. The land of culture, spices and rich, ancient traditions is sure to attract the masses and has to offer its multifarious aspects, which might tantalize one’s taste buds, and enrich minds alike.\n\nThe rich history of the subcontinent includes heroic poetry that grand epics entail and Shastras and Rig Vedas. India is an advanced educational hub of 21st century, delving gradually into cutting edge technology and research, all at an extremely affordable price being headed by global pioneers in their respective fields. The Land of the Nobel Laureate Rabindranath Tagore, promises a mystique Romanticism attached to the very air that Indians breathe.\n\nIndia is abundantly rich in dialects and languages. Twenty-two languages constitutionally enjoy the status of official language but Hindi has been recognized as the lingua franca of the nation. From Kashmir to Kanyakumari, and from Nagaland to Mumbai - Hindi is understood as the national language of India. Though different regions have their different regional affiliation, Hindi remains inclusive.\n\nExperiencing varied climates and diverse cultures, India boasts of an opulent heritage and a prosperous history as colourful as a sun-kissed prism. With 36 UNESCO World Heritage Sites, India stands among the top countries globally in terms of number of world heritage sites.\n\nIt clearly depicts how India, in its artifacts, displays its extravagant culture and background; a background which was delineated again and again by the various dynasts who ever ruled this dreamland. From the thick ice covers of Siachen glaciers, to the arid desert-land of Thar; from the lush green and yellow farmlands of Punjab and Bihar to the subtle backwaters of Kerala; from the delightful beaches of Mumbai, to the extravagance of The Seven-Sisters ; India showcases every variety of landscape throughout its mainland.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2Fii.png?alt=media&token=63a0af24-c17f-427e-acde-13d9489e017b',
  ),
  new About(
    name: 'Previous Version',
    description:
        'The glorious legacy of KIIT International Model United Nations 2017 was further accentuated manifold in the sixth edition of the KIIT International Model United Nations that was organized in October, 2018. KIIT International Model United Nations 2018 experienced a massive footfall of around 2000 delegates over the course of three days.\n\nThe delegates were enthused with great confidence, commendable oratory skills, and remarkable leadership qualities as they indulged in healthy-spirited debates regarding issues and crises that have been occurring on a global scale.\n\nThe discussions incorporated various piquing issues- ranging from environmental threats, the various kinds of warfare, humanitarian projects adopted by various organizations, preservation of indigenous culture, and various other fields. Along with delving deep into the issues being faced, the delegates also educated one another on the policies drawn by their respective committees as they were moderated by a curated panel of Executive Board Members.\n\nThe research that the delegates put into the discussions was indeed laudable and went on to show how cognizant the youth is about the threats posed to all kinds of lives and their habitat. The Social Night served as a revitalizing escape from the vigorous debates that spanned throughout the day.\n\nThe hilarious stand-up comedian, Rahul Subramanian left the delegates in splits as he graced the stage with his classic one-liners and entertaining content. The KIIT International Model United Nations 2018 played such a pivotal role in bringing about a revolution in the Model UN circuit that the dilemmas that were dissected into by these young delegates seemed a bit more surmountable.',
    imageUrl: '',
  ),
  new About(
    name: 'KIIT MUN Society',
    description:
        'For great ideas and plausible resolutions, one needs human interaction, arguments and debates. The KIIT MUN Society is an exemplary representation of the same. Founded in 2013 by the ambitious alumni of KIIT – Snehadeep Kayet, Ashesh Das and Siddhant Sadangi – the society has, since its inception, kept the fire of diplomacy and debate aflame.\n\nThe formation of KIITMUN Society marked a revolution in the MUN circuit of the country, and by simulating KIIT MUN 2013, the community grabbed the attention of the potential and enthusiastic MUNers across the country which is evident by the participation of around one thousand delegates in the maiden edition of the event.The optimism of the society lies in the individual characters.\n\nSince 2013, the society has aspired to grow in terms of both quality and achievements. Erudite personalities like Soumya Basu, Abhradeep Mukherjee, and Shankha Das have exhibited their profound potential as leaders and mentors with their indomitable spirits and knowledge. They displayed pragmatic approach while arranging various events and the annual KIIT International MUN, and thereby retained the legacy that was initiated in the year 2013.\n\nVarious students of KIIT, pursuing studies in different fields of education, and belonging to varied streams like Law, Biotechnology, Medicine, Arts, along with Engineering, have cumulatively joined in this endeavour to make the society reach its pinnacle of success. Apart from administering the KIIT MUN annually, the society also takes the initiative to arrange periodic sessions for the ardent MUN enthusiasts.\n\nThe society tries to mould them by imparting knowledge about international relations in a global context. These sessions convey various facts and figures encompassing the working bodies, as well as the various committees of the United Nations. Additionally, KIIT MUN Society actively organizes workshops to portray a detailed picture of the actual working procedure of the MUN, thereby helping individuals to incorporate the basic information of the United Nations as well.\n\nThe KIIT MUN Society – the name itself, brings upon an emotion indescribable.  It is not just a student body, but, is a second family for the people associated with it. With the promise of carrying forward the legacy in the coming years, the society –currently is in its seventh year, is in the process of organizing KIIT International MUN 2019, under the guidance of the present kingpins of the society.',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/kiit-mun-15f26.appspot.com/o/about%2FkiitMUN.png?alt=media&token=fa20cb72-6722-42fc-b7bf-60fc72aca611',
  ),
];
