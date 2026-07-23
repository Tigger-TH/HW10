<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello | HW10</title>
<link rel="stylesheet" href="css/style.css">
</head>
<script runat="server">
    // อ่าน IP จริงของผู้เข้าชม แม้จะมี Cloudflare พร็อกซี่อยู่หน้าเว็บก็ตาม
    string GetClientIp()
    {
        string cfIp = Request.Headers["CF-Connecting-IP"];
        if (!string.IsNullOrEmpty(cfIp)) return cfIp;

        string forwardedFor = Request.Headers["X-Forwarded-For"];
        if (!string.IsNullOrEmpty(forwardedFor))
        {
            return forwardedFor.Split(',')[0].Trim();
        }

        return Request.UserHostAddress;
    }
</script>
<body>

<header class="site-header">
  <div class="container nav-wrap">
    <a class="brand" href="index.html"><em>Tigger</em></a>
    <nav class="nav" aria-label="เมนูหลัก">
      <a href="index.html">Home</a>
      <a href="about.aspx">About</a>
      <a href="cv.html">CV</a>
      <a href="portfolio.html">Portfolio</a>
      <a href="contact.aspx">Contact</a>
      <a href="guestbook.aspx">Guestbook</a>
      <a href="hello.aspx" aria-current="page">Hello</a>
    </nav>
  </div>
</header>
<div class="course-bar"><div class="container">310-2203 Back-End Software Development</div></div>

<main>
  <section class="hero">
    <div class="container">
      <span class="eyebrow">HW10 · Cloud Hosting + IIS</span>
      <h1>สวัสดีจาก ASP.NET</h1>
      <p class="lead">หน้านี้พิสูจน์ว่า IIS บน Cloud VM รัน ASP.NET (C#) ได้จริง โดยแสดงข้อมูลแบบ Dynamic จากฝั่งเซิร์ฟเวอร์ทุกครั้งที่โหลดหน้า</p>

      <div class="server-info-line">
        <p>🕒 เวลาปัจจุบันของเซิร์ฟเวอร์ (Server DateTime): <strong><%= DateTime.Now %></strong></p>
        <p>🌐 IP ของผู้เข้าชม : <strong><%= GetClientIp() %></strong></p>
      </div>
    </div>
  </section>
</main>

<footer class="site-footer">
  <div class="container">
    6810301012 &middot; Homework 10
  </div>
</footer>

</body>
</html>
