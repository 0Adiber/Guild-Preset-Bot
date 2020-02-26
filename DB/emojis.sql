-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Feb 2020 um 21:39
-- Server-Version: 10.1.33-MariaDB
-- PHP-Version: 7.2.6

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
('1-blob', 'Blobs', '1-blob.png'),
('JTV09qj', 'Rage Faces', 'JTV09qj.png'),
('all-the-things', 'Rage Faces', 'all-the-things.png'),
('amusing', 'Remixes', 'amusing.png'),
('angry-face', 'Rage Faces', 'angry-face.gif'),
('angry-face-2', 'Rage Faces', 'angry-face-2.gif'),
('angry-face-3', 'Rage Faces', 'angry-face-3.gif'),
('angry-face-4', 'Rage Faces', 'angry-face-4.gif'),
('angry-face-5', 'Rage Faces', 'angry-face-5.gif'),
('are-you-kidding-me', 'Rage Faces', 'are-you-kidding-me.gif'),
('bad-pokerface', 'Rage Faces', 'bad-pokerface.gif'),
('bandit', 'Cats', 'bandit.png'),
('beer-guy', 'Rage Faces', 'beer-guy.png'),
('blob-cooke', 'Blobs', 'blob-cooke.png'),
('blob-corn', 'Blobs', 'blob-corn.png'),
('blob-fear-sweat', 'Blobs', 'blob-fear-sweat.png'),
('blob-hero', 'Blobs', 'blob-hero.png'),
('blob-hyperthink', 'Blobs', 'blob-hyperthink.png'),
('blob-kitten-knife', 'Blobs', 'blob-kitten-knife.png'),
('blob-muscle', 'Blobs', 'blob-muscle.png'),
('blob-ninja', 'Blobs', 'blob-ninja.png'),
('blob-rick', 'Blobs', 'blob-rick.png'),
('blob-ross', 'Blobs', 'blob-ross.png'),
('blob-salute-ban', 'Blobs', 'blob-salute-ban.png'),
('blob-spear', 'Blobs', 'blob-spear.png'),
('bobthecat', 'Cats', 'bobthecat.png'),
('bolt', 'Cats', 'bolt.png'),
('breezy', 'Cats', 'breezy.png'),
('callie', 'Cats', 'callie.png'),
('cereal-guy-squint', 'Rage Faces', 'cereal-guy-squint.png'),
('challenge-accepted', 'Rage Faces', 'challenge-accepted.gif'),
('challenge-accepted-drunk', 'Rage Faces', 'challenge-accepted-drunk.gif'),
('cocoa', 'Cats', 'cocoa.png'),
('crying-cool', 'Remixes', 'crying-cool.png'),
('crying-face', 'Rage Faces', 'crying-face.gif'),
('crying-laughing', 'Remixes', 'crying-laughing.png'),
('cuteness-overload', 'Rage Faces', 'cuteness-overload.png'),
('deprina', 'Rage Faces', 'deprina.gif'),
('derp', 'Rage Faces', 'derp.gif'),
('devil-troll', 'Rage Faces', 'devil-troll.gif'),
('dottie', 'Cats', 'dottie.png'),
('evil-blob', 'Blobs', 'evil-blob.png'),
('ewbte', 'Rage Faces', 'ewbte.gif'),
('fap-fap', 'Rage Faces', 'fap-fap.gif'),
('feel-like-a-sir', 'Rage Faces', 'feel-like-a-sir.png'),
('ffffffuuuuu', 'Rage Faces', 'ffffffuuuuu.gif'),
('forever-alone', 'Rage Faces', 'forever-alone.gif'),
('forever-alone-happy', 'Rage Faces', 'forever-alone-happy.gif'),
('forever-pepe', 'Pepes', 'forever-pepe.png'),
('fortune', 'Cats', 'fortune.png'),
('fred', 'Cats', 'fred.png'),
('freddy-mercury', 'Rage Faces', 'freddy-mercury.png'),
('fuck-yeah', 'Rage Faces', 'fuck-yeah.png'),
('gabriel', 'Cats', 'gabriel.png'),
('gay-troll', 'Rage Faces', 'gay-troll.gif'),
('ginger', 'Cats', 'ginger.png'),
('girl-me-gusta', 'Rage Faces', 'girl-me-gusta.gif'),
('god-why', 'Remixes', 'god-why.png'),
('goofy', 'Remixes', 'goofy.png'),
('gozer', 'Cats', 'gozer.png'),
('gtfo', 'Rage Faces', 'gtfo.gif'),
('happy-face', 'Rage Faces', 'happy-face.gif'),
('happy-face-2', 'Rage Faces', 'happy-face-2.gif'),
('happy-grin', 'Rage Faces', 'happy-grin.gif'),
('haters-gonna-hate', 'Rage Faces', 'haters-gonna-hate.gif'),
('heart-druel', 'Remixes', 'heart-druel.png'),
('hitting-a-yeet', 'Remixes', 'hitting-a-yeet.png'),
('i-know-that-feel', 'Rage Faces', 'i-know-that-feel.png'),
('i-lied', 'Rage Faces', 'i-lied.gif'),
('i-see-what-you-did-there', 'Rage Faces', 'i-see-what-you-did-there.png'),
('jiggly-pepe', 'Pepes', 'jiggly-pepe.png'),
('lXh4wyC', 'Rage Faces', 'lXh4wyC.png'),
('lazy-face', 'Rage Faces', 'lazy-face.gif'),
('lexy', 'Cats', 'lexy.png'),
('long-neck-reaction', 'Rage Faces', 'long-neck-reaction.gif'),
('mack', 'Cats', 'mack.png'),
('marshmallow', 'Cats', 'marshmallow.png'),
('me-gusta', 'Rage Faces', 'me-gusta.gif'),
('meh-derp', 'Rage Faces', 'meh-derp.gif'),
('milk-face', 'Rage Faces', 'milk-face.gif'),
('misty', 'Cats', 'misty.png'),
('nerd-troll-face', 'Rage Faces', 'nerd-troll-face.gif'),
('neutral-monocle', 'Rage Faces', 'neutral-monocle.gif'),
('nooooooo', 'Rage Faces', 'nooooooo.gif'),
('not-okay', 'Rage Faces', 'not-okay.gif'),
('not-okay-smile', 'Rage Faces', 'not-okay-smile.gif'),
('obama-not-bad', 'Rage Faces', 'obama-not-bad.png'),
('oh-stop-it-you', 'Rage Faces', 'oh-stop-it-you.png'),
('ok-drops', 'Remixes', 'ok-drops.png'),
('patches', 'Cats', 'patches.png'),
('peaches', 'Cats', 'peaches.png'),
('pepe', 'Pepes', 'pepe.png'),
('pepe-babe', 'Pepes', 'pepe-babe.png'),
('pepe-beats', 'Pepes', 'pepe-beats.png'),
('pepe-beer', 'Pepes', 'pepe-beer.png'),
('pepe-charizard', 'Pepes', 'pepe-charizard.png'),
('pepe-charmander', 'Pepes', 'pepe-charmander.png'),
('pepe-cool', 'Pepes', 'pepe-cool.png'),
('pepe-cool-2', 'Pepes', 'pepe-cool-2.png'),
('pepe-cry', 'Pepes', 'pepe-cry.png'),
('pepe-feels-good', 'Pepes', 'pepe-feels-good.png'),
('pepe-girl', 'Pepes', 'pepe-girl.png'),
('pepe-girl-2', 'Pepes', 'pepe-girl-2.png'),
('pepe-grin', 'Pepes', 'pepe-grin.png'),
('pepe-grin-2', 'Pepes', 'pepe-grin-2.png'),
('pepe-hiphop', 'Pepes', 'pepe-hiphop.png'),
('pepe-hmm', 'Pepes', 'pepe-hmm.png'),
('pepe-joker', 'Pepes', 'pepe-joker.png'),
('pepe-kiss', 'Pepes', 'pepe-kiss.png'),
('pepe-minion', 'Pepes', 'pepe-minion.png'),
('pepe-nuke', 'Pepes', 'pepe-nuke.png'),
('pepe-oh', 'Pepes', 'pepe-oh.png'),
('pepe-oh-2', 'Pepes', 'pepe-oh-2.png'),
('pepe-pleased', 'Pepes', 'pepe-pleased.png'),
('pepe-power', 'Pepes', 'pepe-power.png'),
('pepe-red', 'Pepes', 'pepe-red.png'),
('pepe-sad', 'Pepes', 'pepe-sad.png'),
('pepe-saur', 'Pepes', 'pepe-saur.png'),
('pepe-scream', 'Pepes', 'pepe-scream.png'),
('pepe-sexy', 'Pepes', 'pepe-sexy.png'),
('pepe-shrek', 'Pepes', 'pepe-shrek.png'),
('pepe-smile', 'Pepes', 'pepe-smile.png'),
('pepe-smoke', 'Pepes', 'pepe-smoke.png'),
('pepe-suit', 'Pepes', 'pepe-suit.png'),
('pepe-uhoh', 'Pepes', 'pepe-uhoh.png'),
('pepe-white', 'Pepes', 'pepe-white.png'),
('pepetrick', 'Pepes', 'pepetrick.png'),
('pepper', 'Cats', 'pepper.png'),
('pffffft', 'Rage Faces', 'pffffft.gif'),
('pickles', 'Cats', 'pickles.png'),
('piingblob', 'Blobs', 'piingblob.png'),
('pika-pepe', 'Pepes', 'pika-pepe.png'),
('pika-pepe-2', 'Pepes', 'pika-pepe-2.png'),
('pokerface', 'Rage Faces', 'pokerface.gif'),
('princess', 'Cats', 'princess.png'),
('pumpkin', 'Cats', 'pumpkin.png'),
('pusheen-blob', 'Blobs', 'pusheen-blob.png'),
('rainbow-dumb', 'Remixes', 'rainbow-dumb.png'),
('rascal', 'Cats', 'rascal.png'),
('sad-face', 'Rage Faces', 'sad-face.gif'),
('sad-face-2', 'Rage Faces', 'sad-face-2.gif'),
('seriously-face', 'Rage Faces', 'seriously-face.gif'),
('seriously-girl', 'Rage Faces', 'seriously-girl.gif'),
('shadow', 'Cats', 'shadow.png'),
('shooter', 'Remixes', 'shooter.png'),
('slowpepe', 'Pepes', 'slowpepe.png'),
('smokey', 'Cats', 'smokey.png'),
('snowball', 'Cats', 'snowball.png'),
('socks', 'Cats', 'socks.png'),
('speckles', 'Cats', 'speckles.png'),
('sunny', 'Cats', 'sunny.png'),
('suprised-face', 'Rage Faces', 'suprised-face.gif'),
('suprised-omg', 'Rage Faces', 'suprised-omg.png'),
('suprised-rainbow-face', 'Rage Faces', 'suprised-rainbow-face.png'),
('suspicious-face', 'Rage Faces', 'suspicious-face.gif'),
('sweet-jesus', 'Rage Faces', 'sweet-jesus.png'),
('sweet-jesus-dog', 'Rage Faces', 'sweet-jesus-dog.png'),
('tabitha', 'Cats', 'tabitha.png'),
('the-madman', 'Remixes', 'the-madman.png'),
('thinking-face', 'Rage Faces', 'thinking-face.gif'),
('tongue-face', 'Rage Faces', 'tongue-face.gif'),
('troll-dad', 'Rage Faces', 'troll-dad.gif'),
('troll-face', 'Rage Faces', 'troll-face.gif'),
('trololol', 'Rage Faces', 'trololol.gif'),
('true-story', 'Rage Faces', 'true-story.gif'),
('tubbs', 'Cats', 'tubbs.png'),
('wink-face', 'Rage Faces', 'wink-face.gif'),
('xerxes', 'Cats', 'xerxes.png'),
('y-u-no', 'Rage Faces', 'y-u-no.png'),
('yao-ming-face', 'Rage Faces', 'yao-ming-face.gif'),
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
