INSERT INTO users (username, email, hashpassword, isActivated, id_permissions) VALUES
('john_doe', 'john.doe@example.com', '123', TRUE, 1),
('jane_smith', 'jane.smith@example.com', '456', TRUE, 2),
('alex_jones', 'alex.jones@example.com', '789', TRUE, 2),
('emma_wilson', 'emma.wilson@example.com', 'abc', TRUE, 3),
('mike_brown', 'mike.brown@example.com', 'def', TRUE, 3);



INSERT INTO permissions (name) VALUES
('Admin'),
('Editor'),
('Viewer');

INSERT INTO articles (title, author, creation_date, description, cover, id_users) VALUES
('Introduction à l''assembleur Atari ST', 'John Doe', '2024-05-01', 'Découvrez les bases de la programmation en assembleur pour l''Atari ST.', 'intro_asm_atari_st.jpg', 1),
('Optimisation du code en assembleur pour l''Atari ST', 'Jane Smith', '2024-05-03', 'Apprenez des techniques avancées pour optimiser votre code en assembleur sur l''Atari ST.', 'optimisation_asm_atari_st.jpg', 2),
('Gestion des interruptions sur l''Atari ST en assembleur', 'Alex Jones', '2024-05-05', 'Comprenez comment gérer les interruptions matérielles et logicielles en programmation assembleur sur l''Atari ST.', 'gestion_interrupts_asm_atari_st.jpg', 3),
('Programmation graphique en assembleur pour l''Atari ST', 'Emma Wilson', '2024-05-07', 'Explorez les techniques pour créer des graphismes et des animations en assembleur sur l''Atari ST.', 'graphiques_asm_atari_st.jpg', 4),
('Développement de jeux en assembleur pour l''Atari ST', 'Mike Brown', '2024-05-09', 'Découvrez les bases du développement de jeux en assembleur sur la plate-forme Atari ST.', 'jeux_asm_atari_st.jpg', 5);


INSERT INTO tags (color, label) VALUES
('#FF5733', 'Introduction'),
('#33FF57', 'Optimisation'),
('#3366FF', 'Gestion des interruptions'),
('#FF33FF', 'Programmation graphique'),
('#FFFF33', 'Développement de jeux');


INSERT INTO to_have (id_articles, id_tags) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

INSERT INTO contents (subtitle, text_1, text_2, text_3, place) VALUES
('Introduction à l''assembleur 68000', 'L''assembleur 68000 est un langage de bas niveau utilisé sur la plate-forme Atari ST pour programmer directement le processeur Motorola 68000. Il offre un contrôle précis sur le matériel et est souvent utilisé pour des tâches critiques nécessitant des performances optimales. Dans cet article, nous plongerons dans les bases de l''assembleur 68000, y compris la syntaxe du langage, les registres du processeur et les instructions fondamentales.', 'Nous couvrirons également des concepts avancés tels que les modes d''adressage, les instructions de saut conditionnel et les opérations arithmétiques. À la fin de cet article, vous serez prêt à écrire vos premiers programmes en assembleur 68000 et à comprendre les avantages de la programmation de bas niveau.', 'Apprenez comment écrire vos premiers programmes en assembleur 68000 et découvrez les avantages de programmer directement le matériel, tels que la vitesse d''exécution et le contrôle total sur le système.', 1),
('Optimisation du code en assembleur 68000', 'L''optimisation du code est un aspect crucial de la programmation en assembleur 68000 sur Atari ST. En raison des ressources limitées de la plate-forme, il est essentiel d''écrire un code efficace et optimisé pour maximiser les performances. Dans cet article, nous examinerons des techniques avancées pour améliorer les performances et l''efficacité de votre code assembleur.', 'Nous aborderons des sujets tels que la réduction du nombre de cycles d''horloge, la minimisation de la taille du code et l''utilisation efficace des registres du processeur. À la fin de cet article, vous serez en mesure de produire un code assembleur 68000 plus rapide, plus compact et plus efficace.', 'Découvrez comment minimiser les cycles d''horloge, réduire la taille du code et exploiter pleinement les fonctionnalités du processeur pour créer des applications plus rapides et plus efficaces sur Atari ST.', 2),
('Gestion des interruptions en assembleur 68000', 'La gestion des interruptions est essentielle pour les programmes sur Atari ST, permettant de répondre aux événements matériels et logiciels de manière efficace. En assembleur 68000, vous devez gérer les interruptions pour des tâches telles que la saisie utilisateur, les temporisations et les communications avec les périphériques. Dans ce guide, nous aborderons les concepts fondamentaux de la gestion des interruptions en assembleur 68000.', 'Nous explorerons les vecteurs d''interruption, les priorités d''interruption et les routines de gestion des interruptions. Vous apprendrez à créer des routines de gestion des interruptions robustes et à synchroniser les tâches dans vos programmes. À la fin de cet article, vous aurez une compréhension approfondie de la gestion des interruptions sur Atari ST.', 'Apprenez à utiliser les vecteurs d''interruption, à gérer les priorités et à synchroniser les tâches dans vos programmes pour garantir une réponse rapide et fiable aux événements sur Atari ST.', 3);


INSERT INTO to_herite (id_contents, id_templates) VALUES
(1, 1),
(2, 2),
(3, 3);


INSERT INTO templates (IsSubtitle, place, isTextLeft, isTextRight, isImageLeft, isImageRight, isAttachement) VALUES
(TRUE, 1, FALSE, FALSE, TRUE, FALSE, FALSE),
(FALSE, 2, TRUE, FALSE, FALSE, TRUE, FALSE),
(FALSE, 3, FALSE, TRUE, TRUE, FALSE, TRUE);



INSERT INTO images (filename, alternative) VALUES
('intro_asm_atari_st.jpg', 'Illustration pour l''introduction à l''assembleur Atari ST.'),
('optimisation_asm_atari_st.jpg', 'Illustration pour l''optimisation du code en assembleur Atari ST.'),
('gestion_interrupts_asm_atari_st.jpg', 'Illustration pour la gestion des interruptions en assembleur Atari ST.'),
('graphiques_asm_atari_st.jpg', 'Illustration pour la programmation graphique en assembleur Atari ST.'),
('jeux_asm_atari_st.jpg', 'Illustration pour le développement de jeux en assembleur Atari ST.'),
('assembly_code_example.png', 'Exemple de code assembleur pour Atari ST.');



INSERT INTO to_contain (id_contents, id_images) VALUES
(1, 1),
(1, 6),
(2, 2),
(2, 6),
(3, 3),
(3, 6);

INSERT INTO to_use (id_articles, id_contents) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 3);


INSERT INTO disk_units (label, letter, icon) VALUES
('système', 'A:', 'atari-unitdisk.webp'),
('données', 'B:', 'atari-unitdisk.webp'),
('sauvegarde', 'C:', 'atari-unitdisk.webp'),
('temporaire', 'D:', 'atari-unitdisk.webp');


INSERT INTO menu (name, link) VALUES
('Accueil', '/accueil'),
('Coding', '/coding'),
('Gaming', '/gaming'),
('Musique', '/music'),
('Gfx', '/gfx');
