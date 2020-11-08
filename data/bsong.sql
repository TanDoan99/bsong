-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2020 at 03:19 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bsong`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Nhạc Hải Ngoại'),
(2, 'Nhạc Việt'),
(3, 'Nhạc thiếu nhi'),
(4, 'Nhạc Pop'),
(5, 'Nhạc Rock'),
(6, 'Nhạc Đỏ'),
(7, 'Nhạc trẻ'),
(8, 'Nhạc Vàng'),
(9, 'Nhạc Chiến Khu'),
(10, 'Nhạc Chế'),
(11, 'Nhạc Bolero '),
(12, 'Nhạc Xuân'),
(13, 'Nhạc Chiến Thắng');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_send` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `song_id` int(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `comment`, `date_send`, `song_id`) VALUES
(1, 'Tân', 'ok good', '2020-11-07 01:46:42', 1),
(5, 'Đoàn Ngọc Tân', '333', '2020-11-07 02:01:22', 14),
(6, 'Đoàn Ngọc Tân', 'ok ', '2020-11-07 11:16:35', 16),
(8, 'Administrator', 'được kkkk', '2020-11-07 14:32:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `website`, `message`) VALUES
(1, 'Lâm Ngọc Khương', 'chatwithme9x@gmail.com', 'https://ngockhuong.com', 'Liên hệ admin trang'),
(2, 'Trần Văn Sơn', 'sontv@vinaenter.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(3, 'Hoa Hồng', 'chatwithme9x@gmail.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(4, 'Hoa Hồng đen', 'chatwithme99x@gmail.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(5, 'hoa cà', 'chat@gmail.com', 'http://vinaenter.edu.vn', 'Liên hệ admin trang'),
(6, 'Anh', 'adminanh@gmail.com', 'anh.com', 'Nội dung liên hệ'),
(7, 'Tân', 'sdffps@gmail.com', 'https://www.facebook.com/', 'Tân');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `picture` text COLLATE utf8_unicode_ci NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `name`, `preview_text`, `detail_text`, `date_create`, `picture`, `counter`, `cat_id`) VALUES
(1, 'Nơi Ấy Con Tìm Về', 'Cũng đã một tuần trôi qua,...nhanh thật!. Ngày nào còn ở nhà chỉ ăn học và vui chơi nhưng giờ con đã nhập ngũ...!\r\nThật sự giờ đây con rất nhớ nhà, nhớ ba, nhớ mẹ, và đặc biệt con rất nhớ ngoại...không biết giờ này ngoại ra sao? ngoại có ăn uống bình thường không?....khuya này trời mưa, không biết ngoại có đau nhức nữa không?...', '<p>Cũng đã một tuần trôi qua,...nhanh thật!. Ngày nào còn ở nhà chỉ ăn học và vui chơi nhưng giờ con đã nhập ngũ...!<br />Thật sự giờ đây con rất nhớ nhà, nhớ ba, nhớ mẹ, và đặc biệt con rất nhớ ngoại...không biết giờ này ngoại ra sao? ngoại có ăn uống bình thường không?....khuya này trời mưa, không biết ngoại có đau nhức nữa không?...<br />biết bao nhiêu câu hỏi và sự lo lắng thế nhưng con vẫn không quên nhiệm vụ của mình. Từ khi nhập ngũ con mới hiểu cảm giác thiếu thốn tình cảm gia đình. Con còn nhớ hôm trước lúc con lên đường mẹ đã vào phòng con để nhìn con ngủ và mẹ đã khóc nhiều lắm...mẹ biết không? lúc đó con vẫn thức nhưng không biết nói gì...! lúc đó con mới hiểu mẹ thương con đến mức nào...!!!</p><p>Tuổi thơ con gắn liền với Ngoại, từ lúc nhỏ đến lớn con luôn có Ngoại bên cạnh, lo cho con từng miếng ăn, giấc ngủ, cũng như nuôi lớn, dạy dỗ con nên người. Giờ Ngoại đã lớn tuổi và cũng không khỏe mạnh như xưa...con thương Ngoại nhiều lắm...Ngày con đi, Ngoại không nói gì nhưng hai hàng lệ Ngoại vẫn rơi...!!!</p><p>Về phần Ba, Ba chỉ động viên con sớm hoàn thành tốt nhiệm vụ rồi về. Nhưng con biết, ba lo cho con nhiều hơn thế...phải không Ba?...</p><p>Ngày còn ở nhà con đã không trân trọng khoản thời gian đó nên giờ con mới thật sự hối hận, một sự hối hận muộn màng...! từ lúc nhập ngũ, con cảm nhận về cuộc sống nhiều hơn, thương gia đình mình nhiều hơn<br />Con tự hứa với lòng, con phải hoàn thành tốt mọi nhiệm vụ được giao để khi ra quân con sẽ sống thật tốt, sống trọn vẹn từng phút giây với gia đình mình vì con không muốn phải thêm một lần hối hận nữa...</p><p>Cả nhà ơi...Đợi con nhé...!</p><p><a href="https://l.facebook.com/l.php?u=http%3A%2F%2Fmp3.zing.vn%2Fbai-hat%2FNoi-Ay-Con-Tim-Ve-Ho-Quang-Hieu%2FZW6A7F6F.html&h=ATP_DCkNRbbSu8RP-f-8meMv4zNDsK9RoluK692H_FpdU49URiS9XjezQHanbJ0AaX4Jv2hgwnRbqfTkwAIi0I3a96DE1xIm2cI1VB5m0shUU0GhM_C_NPv1M_JioW1F11Jhpm3yuZ7D2NhN_i-8tuGYiw&enc=AZNES1mZ6gULShcvUSomVl9dhveqpYPr5EL7aqGPgEyeHkPkWUKfqlFyr0k4TEMHDu3IuQvV4NeB4NlOPk7XiBhu226kRIevrWEpukxCqh1pTOQFLlf2Ra5_5uvZhFmI3N716k4FH7SdJl0gnPbryGf--wytg6uZJ4rV4vEhdxOj8C7EOAI9AwTXarfp54Hf3WrSNXSnYASu33skgj28BnQ0&s=1" onclick="LinkshimAsyncLink.referrer_log(this, "http:\\/\\/mp3.zing.vn\\/bai-hat\\/Noi-Ay-Con-Tim-Ve-Ho-Quang-Hieu\\/ZW6A7F6F.html", "\\/si\\/ajax\\/l\\/render_linkshim_log\\/?u=http\\u00253A\\u00252F\\u00252Fmp3.zing.vn\\u00252Fbai-hat\\u00252FNoi-Ay-Con-Tim-Ve-Ho-Quang-Hieu\\u00252FZW6A7F6F.html&h=ATP_DCkNRbbSu8RP-f-8meMv4zNDsK9RoluK692H_FpdU49URiS9XjezQHanbJ0AaX4Jv2hgwnRbqfTkwAIi0I3a96DE1xIm2cI1VB5m0shUU0GhM_C_NPv1M_JioW1F11Jhpm3yuZ7D2NhN_i-8tuGYiw&enc=AZNES1mZ6gULShcvUSomVl9dhveqpYPr5EL7aqGPgEyeHkPkWUKfqlFyr0k4TEMHDu3IuQvV4NeB4NlOPk7XiBhu226kRIevrWEpukxCqh1pTOQFLlf2Ra5_5uvZhFmI3N716k4FH7SdJl0gnPbryGf--wytg6uZJ4rV4vEhdxOj8C7EOAI9AwTXarfp54Hf3WrSNXSnYASu33skgj28BnQ0&d");" rel="nofollow noopener" target="_blank">http://mp3.zing.vn/…/Noi-Ay-Con-Tim-Ve-Ho-Qua…/ZW6A7F6F.html</a></p><p>"Ngày con cất tiếng khóc chào đời <br />Ngày mẹ đã nói niềm vui trào dâng ngập trời. <br />Bằng yêu thương của cha đã dành, <br />để trong mái ấm từng ngày qua con lớn lên. <br />Là lời ru mẹ đưa bên cánh võng cho con say <br />giấc ngủ, <br />là lời cha từng ngày ấm êm mong sao cho con nên người. <br />Thời gian lấy đi mùa xuân của mẹ,và con lấy đi sức sống mẹ cha. <br />ĐK: <br />Cuộc đời con sẽ không quên <br />tình yêu thương mẹ cha đã dành cho con người ơi, tình yêu bao la, <br />theo con như như câu ru xưa cho vơi đi nỗi nhọc nhằn trong đời của người. <br />Đường tương lai nhiều chông gai và những lúc gian nan làm con ngã quỵ, <br />để con nhớ rằng nơi ấy một góc bình yên luôn có mẹ cha chờ con tìm về..."</p>', '2020-11-07 15:12:49', 'hoa6-10381450780044.jpg', 5850, 4),
(2, 'Càng Khó Càng Yêu', '"Nhớ lắm Tặng a món quà tinh thần ... \r\n01.04 Ngày kĩ niệm :x \r\nDù ngày mai đời đổi thay \r\nChỉ yêu anh và yêu thôi, \r\nNguyện yêu mãi muôn đời chẳng quên"', '<p>"Nhớ lắm Tặng a món quà tinh thần ... <br />01.04 Ngày kĩ niệm :x <br />Dù ngày mai đời đổi thay <br />Chỉ yêu anh và yêu thôi, <br />Nguyện yêu mãi muôn đời chẳng quên"</p><p>Đây là những lời tự đáy lòng của một cô gái có người yêu đang thực hiện nghĩa vụ bảo vệ đất nước</p><p>Là người chứng kiến hai bạn từ lúc mới quen đến tận bây giờ, không biết đã trãi qua biết bao nhiêu lần vui, buồn, giận dõi,... Thế nhưng hai bạn vẫn bên nhau không xa rời. Bởi vì đó gọi là "Tình Yêu"</p>', '2020-10-25 03:57:29', 'download-10366611416238.png', 8503, 4),
(3, 'Vẫn Mong Chờ', 'Vẫn như mọi đêm, anh ngồi đây bên cạnh là chiếc điện thoại và những dòng tin nhắn cũ. Cũng lâu rồi em nhỉ...à phải rồi...cũng gần 3 năm chúng ta không gặp nhau rồi còn gì....!', '<p>Vẫn như mọi đêm, anh ngồi đây bên cạnh là chiếc điện thoại và những dòng tin nhắn cũ. Cũng lâu rồi em nhỉ...à phải rồi...cũng gần 3 năm chúng ta không gặp nhau rồi còn gì....!<br />3 năm...không dài nhưng cũng chẳng ngắn. anh không biết em có còn nhớ anh, nhớ những ký ức của ngày xưa không? nhưng với anh, hằng đêm vẫn đọc lại những dòng tin nhắn ta đã nhắn cho nhau, rồi khẽ mỉm cười hạnh phúc...cứ như anh vẫn đang nhắn tin với em nư ngày xưa vậy...!</p><p>Em biết không! mỗi ngày trôi qua với anh dù cho có khó khăn, vất vã, áp lực đến đâu đi nữa thì anh vẫn cố gắng vượt qua tất cả vì anh biết rằng: "anh đã yêu, đang yêu và sẽ mãi yêu một người đó là em...". Ngày đó anh vẫn còn nhớ rất rõ khi ta gặp nhau lần đầu tiên, đó là ngày nhập học đầu tiên của năm lớp 9. Lúc ấy với anh em chỉ là một cô bạn mới quen vừa hòa đồng vừa thân thiện và đặc biệt là nụ cười mà đến giờ anh vẫn không quên được. Những ngày tháng học chung với em tuy cuộc sống anh có nhiều biến cố và nhiều chuyện không vui trong gia đình cũng như học tập, thế nhưng sự xuất hiện của em đã khiến anh thêm ý chí và niềm vui trong cuộc sống. em còn nhớ không, anh từng vì em mà lần đầu tiên đứng ra cản thằng cá biệt nhất lớp khi nó ghẹo em; cũng có lần vì em anh phan cả đôi giày của mình cho thằng cứ theo dê em hoài...ha ha...nhớ lại ngày đó anh cũng trẻ con thật...</p><p>Lên cấp 3, tuy anh và em vẫn học chung trường nhưng lại khác lớp. đây cũng là giai đoạn anh biết anh đã yêu em nhiều như thế nào...nhưng cũng là giai đoạn anh đau khổ vì em nhiều nhất...nhưng thôi...anh chỉ muốn nhớ những kỷ niệm đẹp về em thôi, còn những nỗi đau anh gửi gió cuốn đi hết rồi...vì anh biết : "tình yêu phải trãi qua sóng gió, phải xa nhau, phải đau khổ thì mới có được hạnh phúc, niềm vui trọn vẹn phải không em".</p><p>“ Rồi đôi ta xa nhau trên đường về vắng em <br />Từng làn mây vẫn trôi như ngày xưa kỷ niệm <br />Trên những cung đàn xưa vấn vương nổi buồn nào <br />Mà bài ca tình yêu, giờ đây đành dang dỡ <br />Dòng thời gian trôi nhanh, anh vẫn chờ bóng em <br />Đường về 2 hình bóng nay sao chỉ 1 mình <br />Bước chân đi mình anh, cô đơn trong lặng thầm <br />Gọi tên em anh chờ 1 hình dung <br />Đk: <br />Có lẽ trong màn đêm càng làm anh nhớ em <br />Có lẽ em bây giờ đang vui bên hạnh phúc mới <br />Khóe môi anh lại gọi thầm tên của em thôi <br />Những tình yêu ngày xưa, bao ngày qua vẫn giữ nguyên <br />Nước mắt anh bao đêm, cứ lặng thầm khẽ rơi <br />Nhớ mong em từng ngày trên đường anh vẫn bước <br />Trái tim anh chờ mong khi cơn mưa ngừng rơi <br />Ta sẽ bên cạnh nhau, và yêu lại từ đầu..”</p><p><br />Anh không biết em còn nhớ lời hứa ngày đó với anh hay không?. Có thể em đã quên lời hứa đó và đã có người yêu, có người yêu thương chăm sóc...Thế nhưng anh vẫn không ngừng hy vọng, không ngừng đặt niềm tin vào em...vì anh biết rằng "trái tim anh muốn gì..." Hãy đợi anh em nhé...vì chỉ còn khoản 3 tháng nữa thôi là anh sẽ được gặp lại em rồi...anh thật sự rất mong chờ ngay ấy sẽ đến, khi đó anh sẽ chạy đến và ôm chằm lấy em thật chặt để em mãi không rời xa anh....thế nhưng cũng có thể khi anh gặp em thì em đã tay trong tay với người con trai khác...!!! chắc lúc đó anh sẽ buồn lắm, tuyệt vọng lắm, muốn khóc lắm...! nhưng em đừng lo, nếu điều ấy xãy ra anh sẽ cố gắng tươi cười và chúc phúc cho em, anh sẽ không khóc trước mặt em đâu...vì anh không muốn em phải buồn vì anh....</p><p>Đợi anh em nhé, dù ý nghĩa của sự chờ mong là tình yêu hay tình bạn thì anh vẫn vậy, vẫn là anh của ngày nào...em nhé !</p><p>SP.<br /><a href="https://l.facebook.com/l.php?u=http%3A%2F%2Fmp3.zing.vn%2Fbai-hat%2FVan-Cho-Mong-Tan-Khanh%2FZWZDDF6E.html&h=ATMon4oAHiclnG8QJAVparnJZCgvzaTzkRiPoL4v4OcsY5mas5CHJqaAe414JEtj-0crhHtVMK86CKrQyCZSmMWtPygC9yv9zDJYqAPpmrPDcQORHTbIoVvWkNQoJmjTIG5dLInDPIU3jsHtstKO5L0F-A&enc=AZPZxTF7dDT0Lyscloc8OX6LY-mPQht5iTE-IwPkuIWe4iBK3GhADlkpLrcWX7aE7dMCD6_UgFVoC62E2HvnG3dtywE99gbzAEz7PxGToJR6gaK90yq__hhu8uniUWUQEQUHgvMvnaPEr-h4utK-mBQcc_amotl7UVYxIhNIrf1D08xSXLd0kIVKyGzI4rERG0vlyAosFgk4b3OEIQyUsODR&s=1" onclick="LinkshimAsyncLink.referrer_log(this, "http:\\/\\/mp3.zing.vn\\/bai-hat\\/Van-Cho-Mong-Tan-Khanh\\/ZWZDDF6E.html", "\\/si\\/ajax\\/l\\/render_linkshim_log\\/?u=http\\u00253A\\u00252F\\u00252Fmp3.zing.vn\\u00252Fbai-hat\\u00252FVan-Cho-Mong-Tan-Khanh\\u00252FZWZDDF6E.html&h=ATMon4oAHiclnG8QJAVparnJZCgvzaTzkRiPoL4v4OcsY5mas5CHJqaAe414JEtj-0crhHtVMK86CKrQyCZSmMWtPygC9yv9zDJYqAPpmrPDcQORHTbIoVvWkNQoJmjTIG5dLInDPIU3jsHtstKO5L0F-A&enc=AZPZxTF7dDT0Lyscloc8OX6LY-mPQht5iTE-IwPkuIWe4iBK3GhADlkpLrcWX7aE7dMCD6_UgFVoC62E2HvnG3dtywE99gbzAEz7PxGToJR6gaK90yq__hhu8uniUWUQEQUHgvMvnaPEr-h4utK-mBQcc_amotl7UVYxIhNIrf1D08xSXLd0kIVKyGzI4rERG0vlyAosFgk4b3OEIQyUsODR&d");" rel="nofollow noopener" target="_blank">http://mp3.zing.vn/bai…/Van-Cho-Mong-Tan-Khanh/ZWZDDF6E.html</a></p>', '2020-11-07 14:11:31', 'hoa7-4785766589413.jpg', 18527, 2),
(4, 'Chờ em', 'chờ em, chờ những kỹ niệm hay chờ những niềm đau !!!.', '<p>chờ em, chờ những kỹ niệm hay chờ những niềm đau !!!.<br />\r\nNhững đêm thức trắng như hôm nay anh vẫn làm công việc cũ....đó là Chờ em......<br />\r\nEm biết không, đêm nay anh đã nghe một bản nhạc rất hay, hay lắm. Anh nghe và hát theo lời có sẵn, nhưng.....chỉ hát được nữa bài thì anh ngừng hát theo.....vì sao em biết không !!!.....vì .....nước mắt anh đang rơi.........<br />\r\n"Mơ từng chiều về để hồn vẫn mơ<br />\r\nHình bóng chưa phai mờ theo năm tháng<br />\r\nDù người đã đi về nơi phương xa<br />\r\nĐể giờ đây con tim cứ ứơc mơ, cứ ngóng chờ<br />\r\nHàng cây nghiêng lao xao cánh chim ơi còn bay về chốn nao</p>\r\n\r\n<p>Đau, ngày vội tàn để đời mãi đau<br />\r\nTừng phút trôi qua chờ trong nỗi nhớ<br />\r\nDẫu trong ta cuộc tình đã lỡ<br />\r\nNgười ơi khi nào cho ta<br />\r\nThời gian ko buông tha để cho ta chờ em mãi thôi</p>\r\n\r\n<p>Không gian bao la đường về chiếc bóng cô đơn mình ta bước<br />\r\nĐôi chân đau thương chông gai cháy sáng lên trên đời ta<br />\r\nKhi xưa bên em lòng ta vui mỗi khi em cười<br />\r\nGiờ còn lại gì nhìn quanh chỉ nỗi đau thôi</p>\r\n\r\n<p>Trót yêu em là anh trọn đời mãi thương nhớ<br />\r\nKhi con tim bây giờ vẫn luôn luôn mong chờ<br />\r\nDù hai ta cách xa<br />\r\nCầu mong 1 ngày cho ta nghe tiếng em<br />\r\nTrở về cho đời ta thôi đâu ngày tháng<br />\r\nNgười yêu hỡi xin quay về nơi đây.</p>\r\n\r\n<p>Anh chờ em trọn đời đến muôn kiếp...<br />\r\nCầu mong một ngày cho ta nghe tiếng em<br />\r\nTrở về cho ta thôi đau vì nhớ<br />\r\nNgười yêu ơi anh sẽ còn chờ em......"</p>\r\n\r\n<p>Anh cứ nghĩ đây là bài hát dành riêng cho anh vậy.....Anh ngốc lắm phải không? vì cứ mãi chờ một người không quay về.............!!!!!</p>\r\n\r\n<p>em giờ đã có cuộc sống riêng, có người yêu và đang rất hạnh phúc nhỉ...!! Anh không biết nữa vì đó chỉ là những suy đoán của riêng anh mà thôi. Còn anh....anh vẫn như ngày nào; vẫn là chàng ngốc mỗi lần chạy xe ngang qua con hẻm vào nhà em là lại nhìn vào...., vẫn là chàng ngốc lên face chỉ lặng lẻ vào face của em để biết em hiện như thế nào....., vẫn là chàng ngốc thức tới khuya nghe nhạc rồi nhớ về những kỹ niệm đã cùng có với em....., vẫn là chàng ngốc từ chối tình cảm những cô gái khác vì vẫn nhớ em.....!!!!!!</p>\r\n\r\n<p>ngốc.....ngốc.....ngốc.....!!!! Đó có lẻ là từ thích hợp nhất đối với tình cảm anh dành cho em......Em biết không, ngày đó khi em nhắn anh đừng làm phiền cuộc sống của em nữa.......anh đau lắm. Đến khi em chấp nhận quen anh thì anh lại buông lời cay đắng....chia tay.....có lẽ em nghĩ rằng anh muốn trả thù em nhưng không phải em à.....khi lớn anh biết suy nghĩ, anh muốn em và anh chỉ lo học hành, để lấy công danh, sự nghiệp trước rồi hãy yêu nhau sau....anh giấu em vì nghĩ em sẽ hiểu, vì nghĩ em sẽ chờ anh................nhưng................<br />\r\n.......................anh sai rồi,.............thời gian và sự cô đơn sẽ làm thay đỗi con người, thay đỗi tình yêu.........!!!!!!!!!!!<br />\r\nEm quen anh ấy khi gần hết năm hai, anh biết chứ..........khi đó anh đã làm điều rất ngu ngốc phải không em.............giờ thì cũng đã hơn 3 nă mình không gặp nhau rồi em nhỉ....đến giờ phút này tim anh vẫn còn hình bóng em, biết sau được khi tim anh trót yêu em rồi........................................!!!!!!!!!!!!!!!!!</p>\r\n', '2020-10-25 03:57:08', 'download2-10345489274055.png', 18756, 2),
(5, 'Em Chờ Anh', 'Vẫn như mọi đêm, anh ngồi đây bên cạnh là chiếc điện thoại và những dòng tin nhắn cũ. Cũng lâu rồi em nhỉ...à phải rồi...cũng gần 3 năm chúng ta không gặp nhau rồi còn gì....!', '<p>"Nhớ lắm Tặng a món quà tinh thần ... <br /> 01.04 Ngày kĩ niệm :x <br /> Dù ngày mai đời đổi thay <br /> Chỉ yêu anh và yêu thôi, <br /> Nguyện yêu mãi muôn đời chẳng quên"</p>  <p>Đây là những lời tự đáy lòng của một cô gái có người yêu đang thực hiện nghĩa vụ bảo vệ đất nước</p>  <p>Là người chứng kiến hai bạn từ lúc mới quen đến tận bây giờ, không biết đã trãi qua biết bao nhiêu lần vui, buồn, giận dõi,... Thế nhưng hai bạn vẫn bên nhau không xa rời. Bởi vì đó gọi là "Tình Yêu"</p>', '2020-10-26 02:14:43', 'download3-4722790925285.png', 15689, 8),
(6, 'Người Hãy Quên Tôi Đi', 'có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !có phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !', '<p>Vẫn như mọi đêm, anh ngồi đây bên cạnh là chiếc điện thoại và những dòng tin nhắn cũ. Cũng lâu rồi em nhỉ...à phải rồi...cũng gần 3 năm chúng ta không gặp nhau rồi còn gì....!<br /> 3 năm...không dài nhưng cũng chẳng ngắn. anh không biết em có còn nhớ anh, nhớ những ký ức của ngày xưa không? nhưng với anh, hằng đêm vẫn đọc lại những dòng tin nhắn ta đã nhắn cho nhau, rồi khẽ mỉm cười hạnh phúc...cứ như anh vẫn đang nhắn tin với em nư ngày xưa vậy...!</p>  <p>Em biết không! mỗi ngày trôi qua với anh dù cho có khó khăn, vất vã, áp lực đến đâu đi nữa thì anh vẫn cố gắng vượt qua tất cả vì anh biết rằng: "anh đã yêu, đang yêu và sẽ mãi yêu một người đó là em...". Ngày đó anh vẫn còn nhớ rất rõ khi ta gặp nhau lần đầu tiên, đó là ngày nhập học đầu tiên của năm lớp 9. Lúc ấy với anh em chỉ là một cô bạn mới quen vừa hòa đồng vừa thân thiện và đặc biệt là nụ cười mà đến giờ anh vẫn không quên được. Những ngày tháng học chung với em tuy cuộc sống anh có nhiều biến cố và nhiều chuyện không vui trong gia đình cũng như học tập, thế nhưng sự xuất hiện của em đã khiến anh thêm ý chí và niềm vui trong cuộc sống. em còn nhớ không, anh từng vì em mà lần đầu tiên đứng ra cản thằng cá biệt nhất lớp khi nó ghẹo em; cũng có lần vì em anh phan cả đôi giày của mình cho thằng cứ theo dê em hoài...ha ha...nhớ lại ngày đó anh cũng trẻ con thật...</p>  <p>Lên cấp 3, tuy anh và em vẫn học chung trường nhưng lại khác lớp. đây cũng là giai đoạn anh biết anh đã yêu em nhiều như thế nào...nhưng cũng là giai đoạn anh đau khổ vì em nhiều nhất...nhưng thôi...anh chỉ muốn nhớ những kỷ niệm đẹp về em thôi, còn những nỗi đau anh gửi gió cuốn đi hết rồi...vì anh biết : "tình yêu phải trãi qua sóng gió, phải xa nhau, phải đau khổ thì mới có được hạnh phúc, niềm vui trọn vẹn phải không em".</p>  <p>“ Rồi đôi ta xa nhau trên đường về vắng em <br /> Từng làn mây vẫn trôi như ngày xưa kỷ niệm <br /> Trên những cung đàn xưa vấn vương nổi buồn nào <br /> Mà bài ca tình yêu, giờ đây đành dang dỡ <br /> Dòng thời gian trôi nhanh, anh vẫn chờ bóng em <br /> Đường về 2 hình bóng nay sao chỉ 1 mình <br /> Bước chân đi mình anh, cô đơn trong lặng thầm <br /> Gọi tên em anh chờ 1 hình dung <br /> Đk: <br /> Có lẽ trong màn đêm càng làm anh nhớ em <br /> Có lẽ em bây giờ đang vui bên hạnh phúc mới <br /> Khóe môi anh lại gọi thầm tên của em thôi <br /> Những tình yêu ngày xưa, bao ngày qua vẫn giữ nguyên <br /> Nước mắt anh bao đêm, cứ lặng thầm khẽ rơi <br /> Nhớ mong em từng ngày trên đường anh vẫn bước <br /> Trái tim anh chờ mong khi cơn mưa ngừng rơi <br /> Ta sẽ bên cạnh nhau, và yêu lại từ đầu..”</p>  <p><br /> Anh không biết em còn nhớ lời hứa ngày đó với anh hay không?. Có thể em đã quên lời hứa đó và đã có người yêu, có người yêu thương chăm sóc...Thế nhưng anh vẫn không ngừng hy vọng, không ngừng đặt niềm tin vào em...vì anh biết rằng "trái tim anh muốn gì..." Hãy đợi anh em nhé...vì chỉ còn khoản 3 tháng nữa thôi là anh sẽ được gặp lại em rồi...anh thật sự rất mong chờ ngay ấy sẽ đến, khi đó anh sẽ chạy đến và ôm chằm lấy em thật chặt để em mãi không rời xa anh....thế nhưng cũng có thể khi anh gặp em thì em đã tay trong tay với người con trai khác...!!! chắc lúc đó anh sẽ buồn lắm, tuyệt vọng lắm, muốn khóc lắm...! nhưng em đừng lo, nếu điều ấy xãy ra anh sẽ cố gắng tươi cười và chúc phúc cho em, anh sẽ không khóc trước mặt em đâu...vì anh không muốn em phải buồn vì anh....</p>  <p>Đợi anh em nhé, dù ý nghĩa của sự chờ mong là tình yêu hay tình bạn thì anh vẫn vậy, vẫn là anh của ngày nào...em nhé !</p>  <p>SP.<br /> <a href="https://l.facebook.com/l.php?u=http%3A%2F%2Fmp3.zing.vn%2Fbai-hat%2FVan-Cho-Mong-Tan-Khanh%2FZWZDDF6E.html&h=ATMon4oAHiclnG8QJAVparnJZCgvzaTzkRiPoL4v4OcsY5mas5CHJqaAe414JEtj-0crhHtVMK86CKrQyCZSmMWtPygC9yv9zDJYqAPpmrPDcQORHTbIoVvWkNQoJmjTIG5dLInDPIU3jsHtstKO5L0F-A&enc=AZPZxTF7dDT0Lyscloc8OX6LY-mPQht5iTE-IwPkuIWe4iBK3GhADlkpLrcWX7aE7dMCD6_UgFVoC62E2HvnG3dtywE99gbzAEz7PxGToJR6gaK90yq__hhu8uniUWUQEQUHgvMvnaPEr-h4utK-mBQcc_amotl7UVYxIhNIrf1D08xSXLd0kIVKyGzI4rERG0vlyAosFgk4b3OEIQyUsODR&s=1" onclick="LinkshimAsyncLink.referrer_log(this, "http:\\/\\/mp3.zing.vn\\/bai-hat\\/Van-Cho-Mong-Tan-Khanh\\/ZWZDDF6E.html", "\\/si\\/ajax\\/l\\/render_linkshim_log\\/?u=http\\u00253A\\u00252F\\u00252Fmp3.zing.vn\\u00252Fbai-hat\\u00252FVan-Cho-Mong-Tan-Khanh\\u00252FZWZDDF6E.html&h=ATMon4oAHiclnG8QJAVparnJZCgvzaTzkRiPoL4v4OcsY5mas5CHJqaAe414JEtj-0crhHtVMK86CKrQyCZSmMWtPygC9yv9zDJYqAPpmrPDcQORHTbIoVvWkNQoJmjTIG5dLInDPIU3jsHtstKO5L0F-A&enc=AZPZxTF7dDT0Lyscloc8OX6LY-mPQht5iTE-IwPkuIWe4iBK3GhADlkpLrcWX7aE7dMCD6_UgFVoC62E2HvnG3dtywE99gbzAEz7PxGToJR6gaK90yq__hhu8uniUWUQEQUHgvMvnaPEr-h4utK-mBQcc_amotl7UVYxIhNIrf1D08xSXLd0kIVKyGzI4rERG0vlyAosFgk4b3OEIQyUsODR&d");" rel="nofollow noopener" target="_blank">http://mp3.zing.vn/bai…/Van-Cho-Mong-Tan-Khanh/ZWZDDF6E.html</a></p>', '2020-10-26 02:14:20', 'hinh1-4699849522888.png', 888, 8),
(7, 'Cứ Xa Nhau', 'Chẳng lẽ cứ xa nhau là không thể trở lại với nhau nữa và chẳng lẻ những kỹ niệm ngày xưa sẽ mãi trôi xa....!', '', '2020-10-26 02:14:07', 'download-4686626820130.png', 999, 8),
(8, 'Nhớ để quên', 'Chẳng lẽ cứ xa nhau là không thể trở lại với nhau nữa và chẳng lẻ những kỹ niệm ngày xưa sẽ mãi trôi xa....!', '<p>Chẳng lẽ cứ xa nhau là không thể trở lại với nhau nữa và chẳng lẻ những kỹ niệm ngày xưa sẽ mãi trôi xa....!<br />\r\nPhải rồi....mới đó cũng vài năm rồi nhỉ...và giờ anh cười, cười vì anh vẫn không thể xóa tên em...<br />\r\nAnh ngốc thật nhỉ?. Mang theo yêu dấu và nỗi đau về em khi mà em đã ra đi...ước rằng hôm qua chỉ là cơn mơ để anh được mãi mơ về em và mãi không muốc thức giấc...<br />\r\n"Thế nước mắt cứ khẽ lại rơi, nỗi đau riêng trong tim không nói nên lời. Hỡi nước mắt hỡi kỹ niệm ơn hãy cho ta một lần về phút ban đầu....."<br />\r\nCa từ này anh vẫn mãi không quên, anh cài từ khi hai ta hai lối. Anh vẫn sẽ nhớ, sẽ đi, đi về phía không em...</p>\r\n', '2020-10-26 02:13:57', 'download4-4676485907154.png', 9000, 2),
(9, 'Only Love', 'có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !có phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !', '<p>có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !<br />\r\ncó phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !<br />\r\ntrong màn đêm , ca từ của " Only Love" ngân vang cũng chính là lúc tâm trạng bồi hồi và dạt dào cảm xúc với những rung động vệ một người tôi từng rất yêu....!<br />\r\nchắc giờ này em đang say giấc nồng sau một ngày dài hạnh phúc...à không ! đúng hơn là em đang tận hưởng một cuộc sống hạnh phúc với tình yêu của mình....<br />\r\nTôi vui, tôi cười khi nhìn em hạnh phúc từ phía sau - một nơi mà chẳng bao giờ em biết - " nơi phía sau hạnh phúc".<br />\r\nem biết không, từ ngày không còn gặp em nữa , cuộc sống của anh thay đỗi rất nhiều. Anh không còn nghẹn ngào, bối rối khi thấy em bên người ấy nữa, cũng không còn từng đêm nhớ về hình ảnh của em, của những kỹ niệm ngày ta còn cấp sách đến trường. Trong anh giờ chỉ còn ký ức - một ký ức về mối tình đầu không phai.<br />\r\ntừ khi xa em, anh đã thử rất nhiều cách để quên em: " Anh lao vào công việc, vào việc học và hơn cả anh đã ép bản thân yêu một người con gái khác với hy vọng xóa được hình ảnh của em..." Nhưng em à! giờ anh nhận ra điều đó là không thể...!!!<br />\r\nCuộc sống bộn bề với những lo toan không thể khiến anh quên em, khi yêu người con gái khác anh lại chỉ thấy hình ảnh của em nhiều hơn....Anh ngốc lắm phải không! khi biết được có người con trai khác tốt hơn anh yêu em anh đã đầu hàng và chúc phúc cho hai người....Thật sự giờ nghỉ lại lúc đó anh thấy mình rất hèn và yếu đuối<br />\r\nnhưng nếu anh được quay lại lúc đó thì anh vẫn sẽ hành động như vậy, em biết vì sao không ? vì Anh yêu Em.<br />\r\nVà anh vẫn tin sẽ có ngày chúng ta gặp lại nhau, cười nói vui đùa cùng nhau như hai người bạn thân của ngày trước.....<br />\r\nphải không em - người lạ từng quen !</p>\r\n', '2020-10-26 02:13:42', 'download1-4661517380068.png', 5555, 1),
(10, 'Đổi thay', '“Nhớ…tiếng mưa rơi ngày xưu…lúc đôi ta còn nhau, khi tình yêu… bắt đầu…….”\r\nNhững ca từ quen thuộc của ngày nào bổng vang lên giữa một buổi chiều mưa nhẹ rơi…Đã từ rất lâu rồi tôi mới được nghe lại bài hát này. Bài hát khiến tôi nhớ về kỷ niệm một thời mà tôi cứ nghỡ như chuyện mới vừa xãy ra hôm qua vậy…!!!.', '<p>“Nhớ…tiếng mưa rơi ngày xưu…lúc đôi ta còn nhau, khi tình yêu… bắt đầu…….”<br />\r\nNhững ca từ quen thuộc của ngày nào bổng vang lên giữa một buổi chiều mưa nhẹ rơi…Đã từ rất lâu rồi tôi mới được nghe lại bài hát này. Bài hát khiến tôi nhớ về kỷ niệm một thời mà tôi cứ nghỡ như chuyện mới vừa xãy ra hôm qua vậy…!!!.<br />\r\nNgày đó tôi gặp gở và làm quen với em trong ngày đầu năm học. Ngày ấy tôi chỉ xem em như một người bạn bình thường, đến cả tên của em tôi còn nhớ nhầm vài ngày sau đó. Lúc đó tôi ngồi chung bàn với em hơn một tháng và luôn bị tụi bạn ghép đôi tôi với em…<br />\r\nVà rồi …!!! chuyện gì đến cũng đến…gần cuối năm học tôi nhận ra …Tôi đã yêu em…!!! và nhìn vào mắt em tôi biết …em cũng yêu tôi…!!!<br />\r\nĐến một ngày nọ, tôi lấy hết cam đảm để bài tỏ tình cảm của mình với em…nhưng…!! em nói…!!! muốn có thời gian suy nghĩ …và… trước mắt chúng ta nên là bạn thân…!!!<br />\r\nPhải…! tôi đồng ý làm bạn thân của em …nhưng… khoản cách giữa tôi và em ngày càng lớn…!!!<br />\r\nCho đến một ngày, …ngày mà tôi nhận được tin nhắn của em với nội dung:… “Đừng làm phiền tôi nữa”….!!!<br />\r\n“Rồi một hôm mưa vẫn rơi, cho niềm nhớ chẳng vơi, dù trên phố hoen mắt môi,..nghe nỗi buồn …giăng kín lối….<br />\r\nCòn đâu nữa…<br />\r\nlời đã hứa,…<br />\r\ngiờ vút bay,…<br />\r\ntình đã mãi xa tầm tay…<br />\r\nkhi con tim em…<br />\r\nđã trót mang đổi thay.<br />\r\nCòn trong anh, từng nỗi nhớ,…<br />\r\ndù trái tim nghe tan vỡ,…<br />\r\ntừng chiều nghe tiếng mưa…<br />\r\nnghỡ em về……”<br />\r\nĐó là lần đầu tiên tôi khóc vì một người con gái tôi yêu…!!!. Khi ấy, mọi thứ xung quanh tôi như tối sầm lại… tôi không còn nở nụ cười trên môi như mọi ngày…và cũng không còn niềm tin , không còn hy vọng…!<br />\r\nChẳng phải ngày đó em rất vui khi ở cạnh tôi sao? Chẳng phải em nói chúng ta là bạn thân sao? Và chẳng phải em không biết tôi rất yêu em sao?....<br />\r\nLúc đó tôi tự hỏi: “ là do tôi Thay Đổi…hay…do em đã Đổi Thay…..???”<br />\r\n( to be continued…)</p>\r\n', '2020-10-26 02:15:30', 'favicon-4769826451535.ico', 100, 10),
(11, 'Đổi thay Không', '“Nhớ…tiếng mưa rơi ngày xưu…lúc đôi ta còn nhau, khi tình yêu… bắt đầu…….”\r\nNhững ca từ quen thuộc của ngày nào bổng vang lên giữa một buổi chiều mưa nhẹ rơi…Đã từ rất lâu rồi tôi mới được nghe lại bài hát này. Bài hát khiến tôi nhớ về kỷ niệm một thời mà tôi cứ nghỡ như chuyện mới vừa xãy ra hôm qua vậy…!!!.', '<p>“Nhớ…tiếng mưa rơi ngày xưu…lúc đôi ta còn nhau, khi tình yêu… bắt đầu…….”<br />\r\nNhững ca từ quen thuộc của ngày nào bổng vang lên giữa một buổi chiều mưa nhẹ rơi…Đã từ rất lâu rồi tôi mới được nghe lại bài hát này. Bài hát khiến tôi nhớ về kỷ niệm một thời mà tôi cứ nghỡ như chuyện mới vừa xãy ra hôm qua vậy…!!!.<br />\r\nNgày đó tôi gặp gở và làm quen với em trong ngày đầu năm học. Ngày ấy tôi chỉ xem em như một người bạn bình thường, đến cả tên của em tôi còn nhớ nhầm vài ngày sau đó. Lúc đó tôi ngồi chung bàn với em hơn một tháng và luôn bị tụi bạn ghép đôi tôi với em…<br />\r\nVà rồi …!!! chuyện gì đến cũng đến…gần cuối năm học tôi nhận ra …Tôi đã yêu em…!!! và nhìn vào mắt em tôi biết …em cũng yêu tôi…!!!<br />\r\nĐến một ngày nọ, tôi lấy hết cam đảm để bài tỏ tình cảm của mình với em…nhưng…!! em nói…!!! muốn có thời gian suy nghĩ …và… trước mắt chúng ta nên là bạn thân…!!!<br />\r\nPhải…! tôi đồng ý làm bạn thân của em …nhưng… khoản cách giữa tôi và em ngày càng lớn…!!!<br />\r\nCho đến một ngày, …ngày mà tôi nhận được tin nhắn của em với nội dung:… “Đừng làm phiền tôi nữa”….!!!<br />\r\n“Rồi một hôm mưa vẫn rơi, cho niềm nhớ chẳng vơi, dù trên phố hoen mắt môi,..nghe nỗi buồn …giăng kín lối….<br />\r\nCòn đâu nữa…<br />\r\nlời đã hứa,…<br />\r\ngiờ vút bay,…<br />\r\ntình đã mãi xa tầm tay…<br />\r\nkhi con tim em…<br />\r\nđã trót mang đổi thay.<br />\r\nCòn trong anh, từng nỗi nhớ,…<br />\r\ndù trái tim nghe tan vỡ,…<br />\r\ntừng chiều nghe tiếng mưa…<br />\r\nnghỡ em về……”<br />\r\nĐó là lần đầu tiên tôi khóc vì một người con gái tôi yêu…!!!. Khi ấy, mọi thứ xung quanh tôi như tối sầm lại… tôi không còn nở nụ cười trên môi như mọi ngày…và cũng không còn niềm tin , không còn hy vọng…!<br />\r\nChẳng phải ngày đó em rất vui khi ở cạnh tôi sao? Chẳng phải em nói chúng ta là bạn thân sao? Và chẳng phải em không biết tôi rất yêu em sao?....<br />\r\nLúc đó tôi tự hỏi: “ là do tôi Thay Đổi…hay…do em đã Đổi Thay…..???”<br />\r\n( to be continued…)</p>\r\n', '2020-10-26 02:13:23', 'hoa8-4642870978947.jpg', 2000, 5),
(12, 'Only Love No', 'có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !có phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !', '<p>có phải một ngày nào đó em cũng mãi xa cuộc đời tôi !<br />\r\ncó phải tôi vẫn luôn là người ngộ nhận về một câu chuyện tình yêu tuyệt đẹp !<br />\r\ntrong màn đêm , ca từ của " Only Love" ngân vang cũng chính là lúc tâm trạng bồi hồi và dạt dào cảm xúc với những rung động vệ một người tôi từng rất yêu....!<br />\r\nchắc giờ này em đang say giấc nồng sau một ngày dài hạnh phúc...à không ! đúng hơn là em đang tận hưởng một cuộc sống hạnh phúc với tình yêu của mình....<br />\r\nTôi vui, tôi cười khi nhìn em hạnh phúc từ phía sau - một nơi mà chẳng bao giờ em biết - " nơi phía sau hạnh phúc".<br />\r\nem biết không, từ ngày không còn gặp em nữa , cuộc sống của anh thay đỗi rất nhiều. Anh không còn nghẹn ngào, bối rối khi thấy em bên người ấy nữa, cũng không còn từng đêm nhớ về hình ảnh của em, của những kỹ niệm ngày ta còn cấp sách đến trường. Trong anh giờ chỉ còn ký ức - một ký ức về mối tình đầu không phai.<br />\r\ntừ khi xa em, anh đã thử rất nhiều cách để quên em: " Anh lao vào công việc, vào việc học và hơn cả anh đã ép bản thân yêu một người con gái khác với hy vọng xóa được hình ảnh của em..." Nhưng em à! giờ anh nhận ra điều đó là không thể...!!!<br />\r\nCuộc sống bộn bề với những lo toan không thể khiến anh quên em, khi yêu người con gái khác anh lại chỉ thấy hình ảnh của em nhiều hơn....Anh ngốc lắm phải không! khi biết được có người con trai khác tốt hơn anh yêu em anh đã đầu hàng và chúc phúc cho hai người....Thật sự giờ nghỉ lại lúc đó anh thấy mình rất hèn và yếu đuối<br />\r\nnhưng nếu anh được quay lại lúc đó thì anh vẫn sẽ hành động như vậy, em biết vì sao không ? vì Anh yêu Em.<br />\r\nVà anh vẫn tin sẽ có ngày chúng ta gặp lại nhau, cười nói vui đùa cùng nhau như hai người bạn thân của ngày trước.....<br />\r\nphải không em - người lạ từng quen !</p>\r\n', '2020-10-26 02:13:14', 'hoa1-4633979883599.jpg', 5000, 6),
(14, 'One Two Three', '1, 2, 3, 4, 5....Once I Caught a Fish Alive 1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''', 'Sao chépLời bài hát: One Two ThreeLời đăng bởi: yankwong\r\n1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''\r\n1, 2, 3\r\nPeter, Paul & Mary\r\nGettin'' down with 3P\r\nEverybody loves ***\r\nCountin''\r\n\r\nBabe, pick a night\r\nTo come out and play\r\nIf it''s alright\r\nWhat do you say?\r\n\r\nMerrier the more\r\nTriple fun that way\r\nTwister on the floor\r\nWhat do you say?\r\n\r\nAre - you in\r\nLivin'' in sin is the new thing (yeah)\r\nAre - you in\r\nI am countin''!\r\n\r\n1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''\r\n1, 2, 3\r\nPeter, Paul & Mary\r\nGettin'' down with 3P\r\nEverybody loves ***\r\nCountin''\r\n\r\nThree is a charm\r\nTwo is not the same\r\nI don''t see the harm\r\nSo are you game?\r\n\r\nLets'' make a team\r\nMake ''em say my name\r\nLovin'' the extreme\r\nNow are you game?\r\n\r\nAre - you in\r\nLivin'' in sin is the new thing\r\nAre - you in\r\nI am countin''!\r\n\r\n1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''\r\n1, 2, 3\r\nPeter, Paul & Mary\r\nGettin'' down with 3P\r\n\r\n1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''\r\n1, 2, 3\r\nPeter, Paul & Mary\r\nGettin'' down with 3P\r\nEverybody loves ***\r\nCountin''\r\n\r\nBabe, pick a night\r\nTo come out and play\r\nIf it''s alright\r\nWhat do you say?\r\n\r\nMerrier the more\r\nTriple fun that way\r\nTwister on the floor\r\nWhat do you say?\r\n\r\nAre - you in\r\nLivin'' in sin is the new thing (yeah)\r\nAre - you in\r\nI am countin''!\r\n\r\n1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''\r\n1, 2, 3\r\nPeter, Paul & Mary\r\nGettin'' down with 3P\r\nEverybody loves ***\r\nCountin''\r\n\r\nThree is a charm\r\nTwo is not the same\r\nI don''t see the harm\r\nSo are you game?\r\n\r\nLets'' make a team\r\nMake ''em say my name\r\nLovin'' the extreme\r\nNow are you game?\r\n\r\nAre - you in\r\nLivin'' in sin is the new thing\r\nAre - you in\r\nI am countin''!\r\n\r\n1, 2, 3\r\nNot only you and me\r\nGot one eighty degrees\r\nAnd I''m caught in between\r\nCountin''\r\n1, 2, 3\r\nPeter, Paul & Mary\r\nGettin'' down with 3P\r\nEverybody loves ***\r\n\r\nWhat we do is innocent\r\nJust for fun and nothin'' meant\r\nIf you don''t like the company\r\nLet''s just do it you and me\r\nYou and me...\r\nOr three....\r\nOr four....\r\n- On the floor!\r\n\r\nEverybody loves ***\r\n\r\nWhat we do is innocent\r\nJust for fun and nothin'' meant\r\nIf you don''t like the company\r\nLet''s just do it you and me\r\nYou and me...\r\nOr three....\r\nOr four....\r\n- On the floor!', '2020-11-01 07:47:47', 'item-2373843108914.png', 0, 10),
(16, 'Tân Đoàn', '33', '33', '2020-11-07 14:08:43', 'banner-3382760826012.jpg', 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`) VALUES
(1, 'admindemo', 'e10adc3949ba59abbe56e057f20f883e', 'Admin Demo'),
(2, 'ngockhuong', 'e10adc3949ba59abbe56e057f20f883e', 'Lâm Ngọc Khương'),
(3, 'khuongln', 'e10adc3949ba59abbe56e057f20f883e', 'Hello World'),
(4, 'manhme', 'e10adc3949ba59abbe56e057f20f883e', 'hihi'),
(5, 'tandoan', 'c8837b23ff8aaa8a2dde915473ce0991', 'Đoàn Ngọc Tân '),
(6, 'admin', '202cb962ac59075b964b07152d234b70', 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
