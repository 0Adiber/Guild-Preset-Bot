-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 27. Feb 2020 um 20:25
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `gpb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emojis`
--

CREATE TABLE `emojis` (
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `eset` varchar(255) COLLATE utf8_bin NOT NULL,
  `file` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `emojis`
--

INSERT INTO `emojis` (`name`, `eset`, `file`) VALUES
('1_blob', 'Blobs', '1_blob.png'),
('JTV09qj', 'Rage Faces', 'JTV09qj.png'),
('all_the_things', 'Rage Faces', 'all_the_things.png'),
('amusing', 'Remixes', 'amusing.png'),
('angry_face', 'Rage Faces', 'angry_face.gif'),
('angry_face_2', 'Rage Faces', 'angry_face_2.gif'),
('angry_face_3', 'Rage Faces', 'angry_face_3.gif'),
('angry_face_4', 'Rage Faces', 'angry_face_4.gif'),
('angry_face_5', 'Rage Faces', 'angry_face_5.gif'),
('are_you_kidding_me', 'Rage Faces', 'are_you_kidding_me.gif'),
('bad_pokerface', 'Rage Faces', 'bad_pokerface.gif'),
('bandit', 'Cats', 'bandit.png'),
('beer_guy', 'Rage Faces', 'beer_guy.png'),
('blob_cooke', 'Blobs', 'blob_cooke.png'),
('blob_corn', 'Blobs', 'blob_corn.png'),
('blob_fear_sweat', 'Blobs', 'blob_fear_sweat.png'),
('blob_hero', 'Blobs', 'blob_hero.png'),
('blob_hyperthink', 'Blobs', 'blob_hyperthink.png'),
('blob_kitten_knife', 'Blobs', 'blob_kitten_knife.png'),
('blob_muscle', 'Blobs', 'blob_muscle.png'),
('blob_ninja', 'Blobs', 'blob_ninja.png'),
('blob_rick', 'Blobs', 'blob_rick.png'),
('blob_ross', 'Blobs', 'blob_ross.png'),
('blob_salute_ban', 'Blobs', 'blob_salute_ban.png'),
('blob_spear', 'Blobs', 'blob_spear.png'),
('bobthecat', 'Cats', 'bobthecat.png'),
('bolt', 'Cats', 'bolt.png'),
('breezy', 'Cats', 'breezy.png'),
('callie', 'Cats', 'callie.png'),
('cereal_guy_squint', 'Rage Faces', 'cereal_guy_squint.png'),
('challenge_accepted', 'Rage Faces', 'challenge_accepted.gif'),
('challenge_accepted_drunk', 'Rage Faces', 'challenge_accepted_drunk.gif'),
('cocoa', 'Cats', 'cocoa.png'),
('crying_cool', 'Remixes', 'crying_cool.png'),
('crying_face', 'Rage Faces', 'crying_face.gif'),
('crying_laughing', 'Remixes', 'crying_laughing.png'),
('cuteness_overload', 'Rage Faces', 'cuteness_overload.png'),
('deprina', 'Rage Faces', 'deprina.gif'),
('derp', 'Rage Faces', 'derp.gif'),
('devil_troll', 'Rage Faces', 'devil_troll.gif'),
('dottie', 'Cats', 'dottie.png'),
('evil_blob', 'Blobs', 'evil_blob.png'),
('ewbte', 'Rage Faces', 'ewbte.gif'),
('fap_fap', 'Rage Faces', 'fap_fap.gif'),
('feel_like_a_sir', 'Rage Faces', 'feel_like_a_sir.png'),
('ffffffuuuuu', 'Rage Faces', 'ffffffuuuuu.gif'),
('forever_alone', 'Rage Faces', 'forever_alone.gif'),
('forever_alone_happy', 'Rage Faces', 'forever_alone_happy.gif'),
('forever_pepe', 'Pepes', 'forever_pepe.png'),
('fortune', 'Cats', 'fortune.png'),
('fred', 'Cats', 'fred.png'),
('freddy_mercury', 'Rage Faces', 'freddy_mercury.png'),
('fuck_yeah', 'Rage Faces', 'fuck_yeah.png'),
('gabriel', 'Cats', 'gabriel.png'),
('gay_troll', 'Rage Faces', 'gay_troll.gif'),
('ginger', 'Cats', 'ginger.png'),
('girl_me_gusta', 'Rage Faces', 'girl_me_gusta.gif'),
('god_why', 'Remixes', 'god_why.png'),
('goofy', 'Remixes', 'goofy.png'),
('gozer', 'Cats', 'gozer.png'),
('gtfo', 'Rage Faces', 'gtfo.gif'),
('happy_face', 'Rage Faces', 'happy_face.gif'),
('happy_face_2', 'Rage Faces', 'happy_face_2.gif'),
('happy_grin', 'Rage Faces', 'happy_grin.gif'),
('haters_gonna_hate', 'Rage Faces', 'haters_gonna_hate.gif'),
('heart_druel', 'Remixes', 'heart_druel.png'),
('hitting_a_yeet', 'Remixes', 'hitting_a_yeet.png'),
('i_know_that_feel', 'Rage Faces', 'i_know_that_feel.png'),
('i_lied', 'Rage Faces', 'i_lied.gif'),
('i_see_what_you_did_there', 'Rage Faces', 'i_see_what_you_did_there.png'),
('jiggly_pepe', 'Pepes', 'jiggly_pepe.png'),
('lXh4wyC', 'Rage Faces', 'lXh4wyC.png'),
('lazy_face', 'Rage Faces', 'lazy_face.gif'),
('lexy', 'Cats', 'lexy.png'),
('long_neck_reaction', 'Rage Faces', 'long_neck_reaction.gif'),
('mack', 'Cats', 'mack.png'),
('marshmallow', 'Cats', 'marshmallow.png'),
('me_gusta', 'Rage Faces', 'me_gusta.gif'),
('meh_derp', 'Rage Faces', 'meh_derp.gif'),
('milk_face', 'Rage Faces', 'milk_face.gif'),
('misty', 'Cats', 'misty.png'),
('nerd_troll_face', 'Rage Faces', 'nerd_troll_face.gif'),
('neutral_monocle', 'Rage Faces', 'neutral_monocle.gif'),
('nooooooo', 'Rage Faces', 'nooooooo.gif'),
('not_okay', 'Rage Faces', 'not_okay.gif'),
('not_okay_smile', 'Rage Faces', 'not_okay_smile.gif'),
('obama_not_bad', 'Rage Faces', 'obama_not_bad.png'),
('oh_stop_it_you', 'Rage Faces', 'oh_stop_it_you.png'),
('ok_drops', 'Remixes', 'ok_drops.png'),
('patches', 'Cats', 'patches.png'),
('peaches', 'Cats', 'peaches.png'),
('pepe', 'Pepes', 'pepe.png'),
('pepe_babe', 'Pepes', 'pepe_babe.png'),
('pepe_beats', 'Pepes', 'pepe_beats.png'),
('pepe_beer', 'Pepes', 'pepe_beer.png'),
('pepe_charizard', 'Pepes', 'pepe_charizard.png'),
('pepe_charmander', 'Pepes', 'pepe_charmander.png'),
('pepe_cool', 'Pepes', 'pepe_cool.png'),
('pepe_cool_2', 'Pepes', 'pepe_cool_2.png'),
('pepe_cry', 'Pepes', 'pepe_cry.png'),
('pepe_feels_good', 'Pepes', 'pepe_feels_good.png'),
('pepe_girl', 'Pepes', 'pepe_girl.png'),
('pepe_girl_2', 'Pepes', 'pepe_girl_2.png'),
('pepe_grin', 'Pepes', 'pepe_grin.png'),
('pepe_grin_2', 'Pepes', 'pepe_grin_2.png'),
('pepe_hiphop', 'Pepes', 'pepe_hiphop.png'),
('pepe_hmm', 'Pepes', 'pepe_hmm.png'),
('pepe_joker', 'Pepes', 'pepe_joker.png'),
('pepe_kiss', 'Pepes', 'pepe_kiss.png'),
('pepe_minion', 'Pepes', 'pepe_minion.png'),
('pepe_nuke', 'Pepes', 'pepe_nuke.png'),
('pepe_oh', 'Pepes', 'pepe_oh.png'),
('pepe_oh_2', 'Pepes', 'pepe_oh_2.png'),
('pepe_pleased', 'Pepes', 'pepe_pleased.png'),
('pepe_power', 'Pepes', 'pepe_power.png'),
('pepe_red', 'Pepes', 'pepe_red.png'),
('pepe_sad', 'Pepes', 'pepe_sad.png'),
('pepe_saur', 'Pepes', 'pepe_saur.png'),
('pepe_scream', 'Pepes', 'pepe_scream.png'),
('pepe_sexy', 'Pepes', 'pepe_sexy.png'),
('pepe_shrek', 'Pepes', 'pepe_shrek.png'),
('pepe_smile', 'Pepes', 'pepe_smile.png'),
('pepe_smoke', 'Pepes', 'pepe_smoke.png'),
('pepe_suit', 'Pepes', 'pepe_suit.png'),
('pepe_uhoh', 'Pepes', 'pepe_uhoh.png'),
('pepe_white', 'Pepes', 'pepe_white.png'),
('pepetrick', 'Pepes', 'pepetrick.png'),
('pepper', 'Cats', 'pepper.png'),
('pffffft', 'Rage Faces', 'pffffft.gif'),
('pickles', 'Cats', 'pickles.png'),
('piingblob', 'Blobs', 'piingblob.png'),
('pika_pepe', 'Pepes', 'pika_pepe.png'),
('pika_pepe_2', 'Pepes', 'pika_pepe_2.png'),
('pokerface', 'Rage Faces', 'pokerface.gif'),
('princess', 'Cats', 'princess.png'),
('pumpkin', 'Cats', 'pumpkin.png'),
('pusheen_blob', 'Blobs', 'pusheen_blob.png'),
('rainbow_dumb', 'Remixes', 'rainbow_dumb.png'),
('rascal', 'Cats', 'rascal.png'),
('sad_face', 'Rage Faces', 'sad_face.gif'),
('sad_face_2', 'Rage Faces', 'sad_face_2.gif'),
('seriously_face', 'Rage Faces', 'seriously_face.gif'),
('seriously_girl', 'Rage Faces', 'seriously_girl.gif'),
('shadow', 'Cats', 'shadow.png'),
('shooter', 'Remixes', 'shooter.png'),
('slowpepe', 'Pepes', 'slowpepe.png'),
('smokey', 'Cats', 'smokey.png'),
('snowball', 'Cats', 'snowball.png'),
('socks', 'Cats', 'socks.png'),
('speckles', 'Cats', 'speckles.png'),
('sunny', 'Cats', 'sunny.png'),
('suprised_face', 'Rage Faces', 'suprised_face.gif'),
('suprised_omg', 'Rage Faces', 'suprised_omg.png'),
('suprised_rainbow_face', 'Rage Faces', 'suprised_rainbow_face.png'),
('suspicious_face', 'Rage Faces', 'suspicious_face.gif'),
('sweet_jesus', 'Rage Faces', 'sweet_jesus.png'),
('sweet_jesus_dog', 'Rage Faces', 'sweet_jesus_dog.png'),
('tabitha', 'Cats', 'tabitha.png'),
('the_madman', 'Remixes', 'the_madman.png'),
('thinking_face', 'Rage Faces', 'thinking_face.gif'),
('tongue_face', 'Rage Faces', 'tongue_face.gif'),
('troll_dad', 'Rage Faces', 'troll_dad.gif'),
('troll_face', 'Rage Faces', 'troll_face.gif'),
('trololol', 'Rage Faces', 'trololol.gif'),
('true_story', 'Rage Faces', 'true_story.gif'),
('tubbs', 'Cats', 'tubbs.png'),
('wink_face', 'Rage Faces', 'wink_face.gif'),
('xerxes', 'Cats', 'xerxes.png'),
('y_u_no', 'Rage Faces', 'y_u_no.png'),
('yao_ming_face', 'Rage Faces', 'yao_ming_face.gif'),
('yeet', 'Remixes', 'yeet.png'),
('zo7s949', 'Rage Faces', 'zo7s949.png');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `emojis`
--
ALTER TABLE `emojis`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `file` (`file`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
