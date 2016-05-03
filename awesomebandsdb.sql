-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 03, 2016 at 05:59 PM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `awesomebandsdb`

DROP DATABASE IF EXISTS `awesomebandsdb`;
--
CREATE DATABASE IF NOT EXISTS `awesomebandsdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

 DROP USER `guest`@`localhost`; /* Uncomment to run script again */
CREATE USER `guest`@`localhost` IDENTIFIED BY 'guest';
GRANT ALL PRIVILEGES ON awesomebandsdb.* TO `guest`@`localhost`;

USE `awesomebandsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `description`, `email`, `password`) VALUES
(1, 'HankyPanky', ' We’re the country boy band you secretly always knew you wanted. Picture this – 5 guitars, 5 sets of abs, and 5 cowboy hats. Now imagine all that attached to some damn fine vocal chords and you’ve got Hanky Panky! We love weddings, love office parties, and will make your sweet sixteen sweeter than a Georgia peach.', 'hanky-panky@gmail.com', 'password'),
(2, 'Dirty Dozen', 'Hi there, we’re Dirty Dozen. Originally from New Orleans, we moved up to Denver a while back to mix things up a bit and start a new adventure. Let us bring Bourbon street to your next party. You supply the whiskey, we’ll bring the tunes. Book our whole 12 person band, or maybe only some of us. Just let us know what you’re looking for in your request and we’ll do our best to fit it.', 'dirrtty@gmail.com', 'password'),
(3, 'Travis Corse', 'People tell me that if Louie Armstrong had a son that could be 30 years old today, there’s a good chance it would be me. I’m a simple performer – it’s just me and my trumpet - but I’ll make sure your evening is full of class and laughter. If you’re in the mood for a duet just let me know and I’ll bring my very own Ella Fitzgerald.', 'travis.corse.music@gmail.com', 'password'),
(4, 'DJ Dannic', 'Dannic has repeatedly demonstrated to colossal audiences, whilst on tour, his skills and tight technique as a DJ. His ability to read the crowd shone through proving he can mix it with the world’s best, as he delivered sets varying from peak time madness to low slung, sexy, funky grooves. With the pinnacle of the tour being a main stage set at Electric Daisy Carnival Las Vegas, Dannic has undeniably joined the upper echelons of the dance music scene. This unrelenting schedule has been interspersed with dates across the globe and appearances at the summer’s hottest festivals including spell binding sets at Electric Zoo, Ultra Music Festival, Electric Daisy Carnival, Tomorrowland, Mysteryland, Dance Valley and TomorrowWorld.', 'dannic@gmail.com', 'password'),
(5, 'Heritage', 'Rising from the back yards of Okaloosa County, Florida, Heritage delivers an energetic and positive show that will move all ages and genres! The band broke into the pop/reggae scene in 2009 with their debut album, Natural High. The album earned regional success and allowed the band to spread their message of positivity to listeners across the southeastern United States. In 2012 Heritage released it''s second full-length album, "Out Here...", and has never looked back. The group has headlined hundreds of shows and served as support for national acts ZZ Top, Rebelution, 311, Ballyhoo, & more. 2013 has been an even more eventful year including a multi-show stint on the Van''s Warped Tour spanning from West Palm Beach, FL to Milwaukee, WI, an appearance on the Fall Brewhaha 2013 Tour (With Passafire), and multiple performances with Dirty Heads. Heritage sounds like a mixture of soulful roots reggae, rock, so-cal dub, and Hip Hop! The group is an up-and-coming talent that you will not only love to listen to, but also love to see.', 'heritagemusicllc@gmail.com', 'password'),
(6, 'The Brass Quintet', 'The Brass Quintet plays your favorite traditional brass quintet music, modern transcriptions, and even children’s songs!  We are at home playing in a large concert hall, wedding, school assembly, or summer concert in the park.  Each of us is an experienced and passionate educator and we are happy to work with school bands of all levels.', 'contact@TheBrassQuintet.com', 'password'),
(7, 'Jumpin Joe and the Swinging Dix', 'JJSD is a modern twist on a fun tradition. Let us swing the night away with traditional New Orleans Dixieland, as well as modern hits set to the style you can dance to!  Contact us and we’ll show you how we can make your event SWING!', 'joe@JJSDSwing.com', 'password'),
(8, 'Hello Yellow Brick Road', 'Say “Hello” to the hits of Elton John.  We’ve got your rocket, man!  We’ve been called the closest thing to Elton John this side of the Jersey Turnpike.  We’re everything Sir Elton was before he wasn’t as good!  In other words, if you want to hear the REAL Elton, come see the fake Elton, because we’re more real than Elton, who is real, but, well, doesn’t sound as good so, in some sense isn’t as real, but… Whatever.  We’re really good (and we need gigs).', 'John@Elton.com', 'password'),
(9, 'Bruno''s Phat Band', NULL, 'newArtistEmail@email.com', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `booking_date`, `artist_id`, `confirmed`, `user_id`) VALUES
(1, '2016-05-18', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `artist_id`, `body`, `user_id`) VALUES
(2, 1, 'This group really made our event special!', 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`, `artist_id`) VALUES
(1, 'Jazz', 1),
(2, 'Brass', 2),
(3, 'EDM', 4),
(4, 'Jazz', 3),
(5, 'Reggae', 5),
(6, 'Brass', 5),
(7, 'Piano', 8),
(8, 'Country', 7),
(9, 'Alternative', 8);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `url` varchar(400) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `url`, `artist_id`) VALUES
(1, 'http://www.americanbrassquintet.org/images/event_thumb/471572693_6403554.jpg ', 6),
(6, 'http://www.americanbrassquintet.org/images/slideshow/AmerBrass213-Crop-2.jpg', 6),
(7, 'http://www.americanbrassquintet.org/images/slideshow/abq2_mattdine83.jpg', 6),
(8, 'http://content.sitezoogle.com/u/100373/daab9b7ea0c09c1664f78eec7c5bc131a1f79f44/photo/2969198.jpg?1422998446', 7),
(9, 'http://content.sitezoogle.com/u/100373/a5a81f667e231b5a39436db084ac5a6612059937/photo/2969207.jpg?1422998432 ', 7),
(10, 'http://content.sitezoogle.com/u/100373/6eb73caf0fc573c98caa268fe0780e2e406b303a/photo/2969201.jpg?1422998449', 7),
(11, 'http://w.entertainers.co.uk/lookalikes/lookalikes_images/elton-john-ray-johnson/EltonJohn.jpg ', 8),
(12, 'http://1055thehawk.com/wp-content/uploads/2014/04/Chasin-Crazy-1.jpg', 1),
(13, 'http://cdn03.cdn.justjaredjr.com/wp-content/uploads/pictures/2014/06/chasin-crazy/chasin-crazy-all-kinds-crazy-video-hgtv-pics-04.jpg', 1),
(14, 'http://www.arktimes.com/images/blogimages/2010/10/01/1285944575-dirty_dozen.jpg', 2),
(15, 'http://www.grcmc.org/images/uploads/img1434722803192-168-1-140.jpg', 2),
(16, ' http://www.grcmc.org/images/uploads/img1424200011192-168-1-140.jpg', 3),
(17, 'http://abyssjazz.com/wp-content/uploads/2012/05/trombone11.jpg', 3),
(18, 'https://scontent-dfw1-1.xx.fbcdn.net/t31.0-8/12622160_868783356567880_874109115064121725_o.jpg', 4),
(19, 'https://scontent-dfw1-1.xx.fbcdn.net/t31.0-8/13041046_924562527656629_1661737376693596328_o.jpg', 4),
(20, 'https://scontent-dfw1-1.xx.fbcdn.net/hphotos-xpt1/t31.0-8/12977084_919034104876138_2610182041821532334_o.jpg', 4),
(21, '\nhttps://scontent-dfw1-1.xx.fbcdn.net/hphotos-xal1/t31.0-8/12309840_843812055731677_7340138588181627198_o.jpg', 4),
(22, 'https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/12654460_10153955684468711_4988309599132148758_n.jpg?oh=803cd296ee7df5bca8e8e7e3dbfcc4da&oe=57ADE7EF', 5),
(23, 'https://scontent.fsnc1-1.fna.fbcdn.net/t31.0-8/859783_10151876479818711_683711087_o.jpg', 5),
(24, 'https://scontent.fsnc1-1.fna.fbcdn.net/v/t1.0-9/12190062_10153746594818711_6744549201043774992_n.jpg?oh=0e2cc3eb0a9505210dce1d0d72391592&oe=579CABB6', 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `number`, `artist_id`, `user_id`) VALUES
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recording`
--

DROP TABLE IF EXISTS `recording`;
CREATE TABLE `recording` (
  `id` int(11) NOT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recording`
--

INSERT INTO `recording` (`id`, `url`, `artist_id`) VALUES
(1, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/256245284&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 6),
(3, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/256245284&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 1),
(4, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/130205359&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 1),
(5, '\n<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/161578328&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 2),
(6, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/93431119&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 2),
(7, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/9664144&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 3),
(8, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/9813835&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 3),
(9, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/249996264&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 4),
(10, '<iframe width="560" height="315" src="https://www.youtube.com/embed/MaGW09HMydw" frameborder="0" allowfullscreen></iframe>', 4),
(11, '<iframe width="560" height="315" src="https://www.youtube.com/embed/QWFxlpawC4U" frameborder="0" allowfullscreen></iframe>', 5),
(12, '<iframe width="560" height="315" src="https://www.youtube.com/embed/WQY65zTQ2rk" frameborder="0" allowfullscreen></iframe>', 5),
(13, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/58180711&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 7),
(14, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/111025619&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 7),
(15, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/10784202&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 8),
(16, '<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/47309454&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `photo_url` varchar(200) DEFAULT NULL,
  `access_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `first_name`, `last_name`, `photo_url`, `access_level`) VALUES
(1, 'test@test.com', 'password', 'test', 'test', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_calendar_artist_id_idx` (`artist_id`),
  ADD KEY `fk_booking_user_id_idx` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_artist_id_idx` (`artist_id`),
  ADD KEY `fk_comments_user_id_idx` (`user_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genre_artist_id_idx` (`artist_id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_photo_artist_id_idx` (`artist_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rating_artist_id_idx` (`artist_id`),
  ADD KEY `fk_rating_user_id_idx` (`user_id`);

--
-- Indexes for table `recording`
--
ALTER TABLE `recording`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artist_recording_id_idx` (`artist_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `recording`
--
ALTER TABLE `recording`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_booking_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `fk_genre_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rating_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recording`
--
ALTER TABLE `recording`
  ADD CONSTRAINT `fk_recording_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
