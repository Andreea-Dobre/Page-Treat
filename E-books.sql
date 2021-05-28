CREATE TABLE public."Ebooks"
(
    id integer NOT NULL,
    titlu character varying(150) COLLATE pg_catalog."default" NOT NULL,
    imagine character varying(100) COLLATE pg_catalog."default",
    editie character varying(100) COLLATE pg_catalog."default" NOT NULL,
    pret real NOT NULL,
    numar_pagini integer,
    data_publicare date,
    tip_document character varying(50) COLLATE pg_catalog."default" NOT NULL,
    descriere character varying(1100) COLLATE pg_catalog."default",
    sub_genuri character varying(500)[] COLLATE pg_catalog."default",
    disponibil boolean NOT NULL,
    gen genuri NOT NULL,
    CONSTRAINT "E-books_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."Ebooks"
    OWNER to "Andreea_Dobre";
	
	


insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(1, '1984', '1984.jpg', 'fiction', 'cartonata', 25, 300, '2000-01-17', 'pdf', 'author: George Orwell', null, True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(2, 'Flowers for Algernon', 'algernon.jpg', 'fiction', 'necartonata', 30, 350, '2010-03-15', 'pdf', 'author: Daniel Keyes', '{"animals"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(3, 'All the light we cannot see', 'allthelight.jpg', 'fiction', 'cartonata', 20, 500, '2020-02-18', 'pdf', 'author: Anthony Doeer', '{"war", "WW1"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(4, 'The book thief', 'bookthief.jpeg', 'fiction', 'speciala', 50, 330, '1998-08-08', 'pdf', 'author: Markus Zusak', '{"war", "WW1"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(5, 'Harry Potter', 'harry.jpg', 'kids', 'de film', 50, 450, '1999-05-08', 'pdf', 'autor: J.K. Rowling', '{"fiction", "magic"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(6, 'Lord of the rings - The fellowship of the ring', 'lordoftherings.jpg', 'science-fiction', 'aniversara', 80, 424, '1980-07-30', 'doc', 'author: J.R.R. Tolkien', '{"Smeagol", "Hobit"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(7, 'The complete fiction of H.P. Lovecraft', 'lovecraft.jpg', 'fiction', 'speciala', 100, 1000, '1800-05-17', 'pdf', 'author: H.P. Lovecraft', '{"horror", "not for kids"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(8, 'Me before you', 'mebeforeyou.jpg', 'new', 'de film', 40, 280, '2015-01-01', 'pdf', 'author: Jojo Moyes', '{"romance", "sad-story"}', False);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(9, 'Origin', 'origin.jpeg', 'new', 'cartonata', 70, 370, '12018-11-15', 'pdf', 'author: Dan Brown', null, False);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(10, 'Shadowhunters Series', 'shadowhunters.jpg', 'science-fiction', 'cartonata', 135, null, '2011-09-07', 'pdf', 'author: Cassandra Clare', '{"horror", "romance", "friendship"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(11, 'Nils Holgersson`s wonderful journey through Sweden', 'nils.jpg', 'kids', 'necartonata', 25, 400, '2001-04-03', 'pdf', 'author: Selma Lagerlof', null, False);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(12, 'The treasure of the silver lake', 'treasure.jpg', 'fiction', 'cartonata', 25, 300, '1950-02-07', 'pdf', 'author: Karl May', null, True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(13, 'Exploring the scientific method', 'exploring.jpg', 'scientific', 'cartonata', 40, 500, '2000-04-09', 'pdf', 'author: Steven Gimbel', null, True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(14, 'A brief history of time', 'time.jpg', 'scientific', 'cartonata', 50, 340, '1012-01-05', 'pdf', 'author: Stephen Hawking', null, True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(15, 'Dracula', 'dracula.jpg', 'fiction', 'speciala', 40, 382, '2010-05-07', 'pdf', 'author: Bram Stoker', '{"journal", "supernatural"}', True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(16, 'Every day', 'day.jpg', 'science-fiction', 'cartonata', 25, 259, '2009-06-24', 'pdf', 'author: David Levithan', '{"romance"}',True);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(17, 'The maze runner', 'maze.jpg', 'fiction', 'de film', 29.99, 350, '2015-09-27', 'pdf', 'author: James Dashner', null, False);

insert into 
Ebooks(id, titlu, imagine, gen, editie, pret, numar_pagini, data_publicare, tip_document, descriere, sub_genuri, disponibil)
values
(18, 'The alchemist', 'alchimist.jpg', 'fiction', 'necartonata', 23, 226, '1997-10-23', 'pdf', 'author: Paulo Coelho', null, True);