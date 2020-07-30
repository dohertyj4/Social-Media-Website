-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2020 at 03:18 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_media_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'What is going on', 'vladimir_putin', 'jack_doherty', '2020-07-30 08:21:35', 'no', 1),
(2, 'Nice', 'mike_pence', 'jack_doherty', '2020-07-30 08:24:51', 'no', 1),
(3, 'Hi', 'mike_pence', 'donald_trump', '2020-07-30 08:24:56', 'no', 2),
(4, 'Doing well hbu', 'mike_pence', 'justin_trudeau', '2020-07-30 08:25:08', 'no', 4),
(5, 'Whats up', 'donald_trump', 'vladimir_putin', '2020-07-30 08:32:37', 'no', 3),
(6, 'Hi', 'donald_trump', 'jack_doherty', '2020-07-30 08:32:43', 'no', 1),
(7, 'Hi', 'vladimir_putin', 'mike_pence', '2020-07-30 08:34:40', 'no', 5),
(8, 'Hello Jack', 'vladimir_putin', 'jack_doherty', '2020-07-30 08:34:47', 'no', 1),
(9, 'You will not win', 'joe_biden', 'donald_trump', '2020-07-30 08:38:26', 'no', 2);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `user_to`, `user_from`) VALUES
(1, 'mike_pence', 'vladimir_putin'),
(4, 'mike_pence', 'jack_doherty');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(1, 'vladimir_putin', 2),
(2, 'vladimir_putin', 1),
(3, 'justin_trudeau', 3),
(4, 'justin_trudeau', 2),
(5, 'justin_trudeau', 1),
(6, 'justin_trudeau', 4),
(7, 'mike_pence', 5),
(8, 'mike_pence', 4),
(10, 'mike_pence', 2),
(11, 'mike_pence', 3),
(12, 'donald_trump', 5),
(13, 'donald_trump', 4),
(14, 'donald_trump', 3),
(15, 'donald_trump', 1),
(16, 'vladimir_putin', 6),
(17, 'vladimir_putin', 4),
(18, 'jack_doherty', 2),
(19, 'jack_doherty', 3),
(20, 'jack_doherty', 6),
(21, 'jack_doherty', 1),
(22, 'donald_trump', 2),
(23, 'joe_biden', 6),
(24, 'joe_biden', 3),
(25, 'joe_biden', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(1, 'donald_trump', 'vladimir_putin', 'Vladimir Putin liked your post', 'post.php?id=2', '2020-07-30 08:21:14', 'no', 'yes'),
(2, 'jack_doherty', 'vladimir_putin', 'Vladimir Putin liked your post', 'post.php?id=1', '2020-07-30 08:21:17', 'no', 'yes'),
(3, 'jack_doherty', 'vladimir_putin', 'Vladimir Putin commented on your post', 'post.php?id=1', '2020-07-30 08:21:35', 'no', 'yes'),
(4, 'vladimir_putin', 'justin_trudeau', 'Justin Trudeau liked your post', 'post.php?id=3', '2020-07-30 08:23:24', 'no', 'yes'),
(5, 'donald_trump', 'justin_trudeau', 'Justin Trudeau liked your post', 'post.php?id=2', '2020-07-30 08:23:25', 'no', 'yes'),
(6, 'jack_doherty', 'justin_trudeau', 'Justin Trudeau liked your post', 'post.php?id=1', '2020-07-30 08:23:27', 'no', 'yes'),
(7, 'justin_trudeau', 'mike_pence', 'Mike Pence liked your post', 'post.php?id=4', '2020-07-30 08:24:42', 'no', 'no'),
(8, 'vladimir_putin', 'mike_pence', 'Mike Pence liked your post', 'post.php?id=3', '2020-07-30 08:24:43', 'no', 'yes'),
(9, 'donald_trump', 'mike_pence', 'Mike Pence liked your post', 'post.php?id=2', '2020-07-30 08:24:45', 'no', 'yes'),
(10, 'vladimir_putin', 'mike_pence', 'Mike Pence liked your post', 'post.php?id=3', '2020-07-30 08:24:46', 'no', 'yes'),
(11, 'jack_doherty', 'mike_pence', 'Mike Pence commented on your post', 'post.php?id=1', '2020-07-30 08:24:51', 'no', 'yes'),
(12, 'vladimir_putin', 'mike_pence', 'Mike Pence commented on a post you commented on', 'post.php?id=1', '2020-07-30 08:24:51', 'no', 'yes'),
(13, 'donald_trump', 'mike_pence', 'Mike Pence commented on your post', 'post.php?id=2', '2020-07-30 08:24:56', 'no', 'yes'),
(14, 'justin_trudeau', 'mike_pence', 'Mike Pence commented on your post', 'post.php?id=4', '2020-07-30 08:25:08', 'no', 'no'),
(15, 'mike_pence', 'donald_trump', 'Donald Trump liked your post', 'post.php?id=5', '2020-07-30 08:32:27', 'no', 'no'),
(16, 'justin_trudeau', 'donald_trump', 'Donald Trump liked your post', 'post.php?id=4', '2020-07-30 08:32:27', 'no', 'no'),
(17, 'vladimir_putin', 'donald_trump', 'Donald Trump liked your post', 'post.php?id=3', '2020-07-30 08:32:29', 'no', 'yes'),
(18, 'jack_doherty', 'donald_trump', 'Donald Trump liked your post', 'post.php?id=1', '2020-07-30 08:32:31', 'no', 'yes'),
(19, 'vladimir_putin', 'donald_trump', 'Donald Trump commented on your post', 'post.php?id=3', '2020-07-30 08:32:37', 'no', 'yes'),
(20, 'jack_doherty', 'donald_trump', 'Donald Trump commented on your post', 'post.php?id=1', '2020-07-30 08:32:43', 'no', 'yes'),
(21, 'vladimir_putin', 'donald_trump', 'Donald Trump commented on a post you commented on', 'post.php?id=1', '2020-07-30 08:32:43', 'no', 'yes'),
(22, 'mike_pence', 'donald_trump', 'Donald Trump commented on a post you commented on', 'post.php?id=1', '2020-07-30 08:32:43', 'no', 'no'),
(23, 'justin_trudeau', 'vladimir_putin', 'Vladimir Putin liked your post', 'post.php?id=4', '2020-07-30 08:34:33', 'no', 'no'),
(24, 'mike_pence', 'vladimir_putin', 'Vladimir Putin commented on your post', 'post.php?id=5', '2020-07-30 08:34:40', 'no', 'no'),
(25, 'jack_doherty', 'vladimir_putin', 'Vladimir Putin commented on your post', 'post.php?id=1', '2020-07-30 08:34:47', 'no', 'yes'),
(26, 'mike_pence', 'vladimir_putin', 'Vladimir Putin commented on a post you commented on', 'post.php?id=1', '2020-07-30 08:34:47', 'no', 'no'),
(27, 'donald_trump', 'vladimir_putin', 'Vladimir Putin commented on a post you commented on', 'post.php?id=1', '2020-07-30 08:34:47', 'no', 'no'),
(28, 'donald_trump', 'jack_doherty', 'Jack Doherty liked your post', 'post.php?id=2', '2020-07-30 08:36:07', 'no', 'no'),
(29, 'vladimir_putin', 'jack_doherty', 'Jack Doherty liked your post', 'post.php?id=3', '2020-07-30 08:36:08', 'no', 'no'),
(30, 'vladimir_putin', 'jack_doherty', 'Jack Doherty liked your post', 'post.php?id=6', '2020-07-30 08:36:09', 'no', 'no'),
(31, 'vladimir_putin', 'joe_biden', 'Joe Biden liked your post', 'post.php?id=6', '2020-07-30 08:38:10', 'no', 'no'),
(32, 'vladimir_putin', 'joe_biden', 'Joe Biden liked your post', 'post.php?id=3', '2020-07-30 08:38:11', 'no', 'no'),
(33, 'jack_doherty', 'joe_biden', 'Joe Biden liked your post', 'post.php?id=1', '2020-07-30 08:38:12', 'no', 'yes'),
(34, 'donald_trump', 'joe_biden', 'Joe Biden commented on your post', 'post.php?id=2', '2020-07-30 08:38:26', 'no', 'no'),
(35, 'mike_pence', 'joe_biden', 'Joe Biden commented on a post you commented on', 'post.php?id=2', '2020-07-30 08:38:26', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(1, 'Hello everyone this is my first post!', 'jack_doherty', 'none', '2020-07-30 08:17:14', 'no', 'no', 5),
(2, 'Hello this is the president of the United States', 'donald_trump', 'none', '2020-07-30 08:19:19', 'no', 'no', 5),
(3, 'This is Vladimir Putin', 'vladimir_putin', 'none', '2020-07-30 08:20:55', 'no', 'no', 5),
(4, 'How is everyone doing?', 'justin_trudeau', 'none', '2020-07-30 08:23:36', 'no', 'no', 4),
(5, 'This is the vice president Mike Pense.', 'mike_pence', 'none', '2020-07-30 08:24:38', 'no', 'no', 2),
(6, 'This is my profile post<br /> ', 'vladimir_putin', 'none', '2020-07-30 08:34:16', 'no', 'no', 3),
(7, 'I hope I become president<br /> ', 'joe_biden', 'none', '2020-07-30 08:38:02', 'no', 'no', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Hello', 2),
('Post', 1),
('President', 2),
('United', 1),
('Vladimir', 1),
('Putin', 1),
('Doing', 1),
('Vice', 1),
('Mike', 1),
('Pense', 1),
('Profile', 1),
('Postbr', 1),
('Hope', 1),
('Presidentbr', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'Jack', 'Doherty', 'jack_doherty', 'Jjdjack123@gmail.com', 'e5ddb0f184f1744884847470c84d15e9', '2020-07-30', 'assets/images/profile_pics/jack_dohertyfd0fa7620ab7100680a5bf25707b4107n.jpeg', 1, 5, 'no', ',vladimir_putin,donald_trump,'),
(2, 'Donald', 'Trump', 'donald_trump', 'Dtrump@gmail.com', 'e5ddb0f184f1744884847470c84d15e9', '2020-07-30', 'assets/images/profile_pics/donald_trump05c62b5f4007ad5b11308a6abe016a2an.jpeg', 1, 5, 'no', ',vladimir_putin,jack_doherty,'),
(3, 'Joe', 'Biden', 'joe_biden', 'Jbiden@gmail.com', 'e5ddb0f184f1744884847470c84d15e9', '2020-07-30', 'assets/images/profile_pics/joe_bidenab863f4bf8803e75489c1c6ff4d85ea8n.jpeg', 1, 0, 'no', ','),
(4, 'Vladimir', 'Putin', 'vladimir_putin', 'Vputin@gmail.com', 'e5ddb0f184f1744884847470c84d15e9', '2020-07-30', 'assets/images/profile_pics/vladimir_putinaa5b3ddfd4302df6dd5d3c91eb5c2c6an.jpeg', 2, 8, 'no', ',jack_doherty,donald_trump,'),
(5, 'Mike', 'Pence', 'mike_pence', 'Mpence@gmail.com', 'e5ddb0f184f1744884847470c84d15e9', '2020-07-30', 'assets/images/profile_pics/mike_pence2daf5f6bd5dcc53e2a523573eb282d29n.jpeg', 1, 2, 'no', ','),
(6, 'Justin', 'Trudeau', 'justin_trudeau', 'Jtrudeau@gmail.com', 'e5ddb0f184f1744884847470c84d15e9', '2020-07-30', 'assets/images/profile_pics/justin_trudeau5659a748b029f2913f08b60192b7bdd5n.jpeg', 1, 4, 'no', ',');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
