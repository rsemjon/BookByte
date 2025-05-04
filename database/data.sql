BEGIN;

TRUNCATE TABLE public.users RESTART IDENTITY CASCADE;
TRUNCATE TABLE public.product_image RESTART IDENTITY CASCADE;
TRUNCATE TABLE public.products RESTART IDENTITY CASCADE;

-- products
INSERT INTO public.products (id, title, author, description, genre, language, price, in_stock, total_purchased, created_at, updated_at, cover_type)
VALUES
(1, 'Do Androids Dream of Electric Sheep?', 'Philip K. Dick',
 'A post-apocalyptic novel set in a future where Earth has been ravaged by nuclear war. The story follows bounty hunter Rick Deckard, who is tasked with "retiring" rogue androids who have escaped from Mars. As he hunts them down, he grapples with the question of what it means to be human. This novel inspired the movie "Blade Runner" and is a thought-provoking exploration of artificial intelligence, empathy, and identity.',
 'Science Fiction', 'English', 9.99, 26, 10, '2024-08-19 23:03:01', '2024-08-19 23:03:01', 'Papercover'),

(2, '1984', 'George Orwell',
 'Orwell''s dystopian masterpiece paints a terrifying vision of a totalitarian society where surveillance, propaganda, and thought control rule. Winston Smith, a low-ranking member of the oppressive Party, begins to question the system and embarks on a dangerous journey towards truth and freedom. A chilling warning about government overreach and the erosion of personal liberties.',
 'Science Fiction', 'English', 8.75, 33, 320, '2024-02-04 08:22:23', '2024-02-04 08:22:23', 'Hardcover'),

(3, 'The Great Gatsby', 'F. Scott Fitzgerald',
 'Set in the Roaring Twenties, this novel tells the tragic story of Jay Gatsby, a wealthy and mysterious man obsessed with rekindling his past love with Daisy Buchanan. Through the eyes of narrator Nick Carraway, Fitzgerald critiques the American Dream, materialism, and the illusion of happiness. A timeless novel full of lavish parties, unfulfilled longing, and social decay.',
 'Classic', 'English', 7.99, 8, 32, '2024-09-23 11:09:54', '2024-09-23 11:09:54', 'Papercover'),

(4, 'War and Peace', 'Leo Tolstoy',
 'One of the greatest works of world literature, ''War and Peace'' follows the lives of aristocratic families during the Napoleonic Wars. Blending history and fiction, Tolstoy paints an intricate portrait of love, war, fate, and free will. The novel explores the struggles of its characters, including Prince Andrei and Natasha Rostova, against the backdrop of one of history''s most turbulent periods.',
 'Classic', 'Russian', 12.00, 29, 359, '2024-01-11 10:04:23', '2024-01-11 10:04:23', 'Leather'),

(5, 'Crime and Punishment', 'Fyodor Dostoevsky',
 'Dostoevsky’s psychological masterpiece delves into the mind of Raskolnikov, a poor ex-student in St. Petersburg who justifies murdering a greedy pawnbroker in an attempt to prove his superiority. However, his guilt and paranoia slowly consume him, leading to a thrilling exploration of morality, justice, and redemption.',
 'Classic', 'Russian', 11.50, 25, 437, '2024-02-23 12:27:36', '2024-02-23 12:27:36', 'Papercover'),

(6, 'Anna Karenina', 'Leo Tolstoy',
 'Tolstoy’s novel about love, passion, and societal expectations follows Anna Karenina, a woman who risks everything for an affair with the dashing Count Vronsky. Her tragic fate contrasts with the story of Levin, a man searching for meaning in work, faith, and family life. A brilliant analysis of human emotions, hypocrisy, and the constraints of high society.',
 'Classic', 'Russian', 10.20, 5, 571, '2024-03-25 06:26:22', '2024-03-25 06:26:22', 'Papercover'),

(7, 'The Crack', 'Jozef Karika',
 'A gripping horror-thriller about a man who discovers an abandoned house with a mysterious crack in the wall. As he investigates, strange and terrifying events begin to unfold, pulling him into a nightmare beyond imagination. A chilling Slovak horror story that keeps readers on the edge of their seats.',
 'Horror', 'Slovak', 9.20, 32, 445, '2024-10-15 14:07:52', '2024-10-15 14:07:52', 'Hardcover'),

(8, 'Circles on the Water', 'Dominik Dan',
 'Detective Krauz is back in another thrilling murder mystery set in Slovakia. A seemingly random drowning case turns out to be something far more sinister. With twists, corruption, and dangerous criminals, this detective novel will keep you hooked until the last page.',
 'Detective', 'Slovak', 8.40, 2, 291, '2024-02-12 23:34:06', '2024-02-12 23:34:06', 'Hardcover'),

(9, 'How the Power Tastes', 'Ladislav Mnyachko',
 'A powerful novel about the corrupting nature of political power. Mňačko exposes the hypocrisy of the ruling elite and the consequences of absolute authority. A must-read for those interested in political literature and historical fiction.',
 'Classic', 'Slovak', 9.50, 33, 0, '2024-09-23 09:42:12', '2024-09-23 09:42:12', 'Hardcover');

-- images
INSERT INTO public.product_image (id,product_id,image,created_at,updated_at) 
VALUES
    (1, 1,'images/books/sheeps1.jpg', NULL, NULL),
    (2, 1,'images/books/sheeps2.jpg', NULL, NULL),
    (3, 2,'images/books/19841.jpg', NULL, NULL),
    (4, 2,'images/books/19842.jpg', NULL, NULL),
    (5, 3,'images/books/gatsby1.jpg', NULL, NULL),
    (6, 3,'images/books/gatsby2.jpg', NULL, NULL),
    (7, 4,'images/books/war1.jpg', NULL, NULL),
    (8, 4,'images/books/war2.jpg', NULL, NULL),
    (9, 5,'images/books/crime1.jpg', NULL, NULL),
    (10, 5,'images/books/crime2.jpg', NULL, NULL),
    (11, 6,'images/books/anna1.jpg', NULL, NULL),
    (12, 6,'images/books/anna2.jpg', NULL, NULL),
    (13, 7,'images/books/crack1.jpg', NULL, NULL),
    (14, 7,'images/books/crack2.jpg', NULL, NULL),
    (15, 8,'images/books/circle1.jpg', NULL, NULL),
    (16, 8,'images/books/circle2.jpg', NULL, NULL),
    (17, 9,'images/books/power1.jpg', NULL, NULL),
    (18, 9,'images/books/power2.jpg', NULL, NULL);

-- users
INSERT INTO public.users (id, name, email, password, created_at, updated_at, role)
VALUES
    (1, 'User', 'user@gmail.com', '$2y$12$sBpHHTT8rmpARhxGrSbxOO3oiAk3M1sKokHV/r81JJvkuziETYx3q', NOW(), NOW(), 'user'),
    (2, 'Admin', 'admin@gmail.com', '$2y$12$6ZaOp.TK0BNotIGtpIDM5.AFrcctLXWGxF9MzT9M7djyN8szGV3Gm', NOW(), NOW(), 'admin');

SELECT pg_catalog.setval('public.users_id_seq', 2, true);
SELECT pg_catalog.setval('public.products_id_seq', 9, true);
SELECT pg_catalog.setval('public.product_image_id_seq', 18, true);

COMMIT;
