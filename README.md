
![R (2)](https://github.com/Azumi67/PrivateIP-Tunnel/assets/119934376/a064577c-9302-4f43-b3bf-3d4f84245a6f)
نام پروژه : پنل وایرگارد Wgdashboard
---------------------------------------------------------------

- شما میتوانید از طریق اسکریپت، این پنل را نصب کنید
- دقت نمایید که نام اینترفیس شما به درستی وارد شود. با دستور ip a میتوانید بررسی نمایید. معمولا با eth و یا ens شروع میشود.
- ایپی پرایوتی که دوست دارید را انتخاب کنید.(اگر سرور از دیجیتال اوشن دارین ایپی به غیر از 10.0.0.0 انتخاب نمایید)
- پورت وایرگارد خود را وارد نمایید و بقیه مراحل به صورت خودکار نصب خواهد شد و همچنین سرویس هم برای شما فعال میشود.
- در اخر میتوانید سرور خود را ریبوت کنید.
- پورت پنل و ایپی ورودی به شما باید نمایش داده شود.
```
bash <(curl -s https://raw.githubusercontent.com/OPIran-Official/WGDashboard_Persian/main/install.sh --ipv4)
```

  </details>
</div>

-----------------------------
![con](https://github.com/Azumi67/WGDashboard_Persian/assets/119934376/edd17574-bdb9-4eed-9c1b-64eac3eab189)**Contributors**

- WGdasbhoard Oiriginal Author : [donaldzou](https://github.com/donaldzou/WGDashboard)
- Inspired By Mr Amir Coding : [AMIR](https://t.me/flalo )
- Persian HTML V2 Author : [Armin](https://github.com/A3is)
- Script & Bug fixes : [Opiran](https://github.com/opiran-club)
- Codes Edited & Modified By me & Bug fixes : [Azumi](https://github.com/Azumi67)
- **I really appreciate Mr Amir who allowed me to be inspired by his coding, Opiran for his support and advice and Mr Armin for his beautiful work. Thank you**
-----------------
![check](https://github.com/Azumi67/PrivateIP-Tunnel/assets/119934376/13de8d36-dcfe-498b-9d99-440049c0cf14)
**امکانات و کارهایی که انجام شده**
-

- داشتن حجم و زمان
- پشتیبانی از زبان فارسی
- داشتن اسکریپت اماده برای تانل (UDP2raw + FEC or Without FEC) 
- داشتن اسکریپت برای راحتی نصب پنل توسط Opiran
- تغییر کد های اقا امیر تا جای ممکن
- اضافه شدن کد های نمایش CPU و RAM
- امکان حذف peer های از کار افتاده بدون فعال کردن مجدد آن ها
- بهینه تر شدن نسخه فارسی
- اضافه شدن نسخه جدید فارسی توسط اقا ارمین

-------------------
 <div align="right">
  <details>
    <summary><strong><img src="https://github.com/Azumi67/WGDashboard_Persian/assets/119934376/c1153f92-93bc-42f5-a8b7-c4a1c70209ab" alt="Image"> </strong>نکته</summary>
  
  
------------------------------------ 

- برای استفاده از available ip (ایپی های موجود ) در پنل، ایپی 6 وایرگارد را در اینترفیس wg0 پاک کنید. اینطوری شما میتوانید از این قابلیت هم استفاده کنید.
- اگر به هر دلیلی کانکشن برای شما فعال نشد، ایپی وایرگارد در wg0 و در پنل را بررسی کنید. در wg0 باید 10.66.66.1/24 به طور مثال باشد و در پنل باید 10.66.66.2/32 باشد.
- اگر با یک تانل جواب نگرفتید ، تانل دیگری را تست کنید.
- اگر در دیجیتال اوشن جواب نگرفتید، از ایپی رنج دیگری استفاده کنید یا پرایوت ایپی را در دیجیتال اوشن disable کنید. داخل اینترنت سرچ کنید

  </details>
</div>

----------------------
<div align="right">
  <details>
    <summary><strong>توضیح کوتاه در مورد این پروژه</strong></summary>
  


- این پنل اپدیت نخواهد شد و بیشتر برای یادگیری خودم میباشد. 
- این پروژه در مورد یک پنل وایرگارد است که نسخه اصلی ان به نام WGDashboard میباشد .نویسنده اصلی آن دونالد میباشد. این پروژه که صرفا برای اموزش بوده و تلاش کردم کد های امیر اقا که زحمت اضافه کردن حجم و زمان را کشیده بودند را تا جای ممکن تغییر بدم.
- این پنل را بیشتر شماها دارید و تصمیم گرفتم که به جای اینکه هر روز جواب پیام های شما را بدم، کد های پایتون را تا جای ممکن تغییر بدم و آن را در گیت هاب قرار بدم.(من این پنل را پخش نکردم)
- من در Js اطلاعاتی ندارم اما توانستم با مطالعه، کمی دستورات const برای زمان را تغییر بدم و اگر زمانی انتخاب نکنید سال 1969 را نشان میدهد ( میشه درستش کرد اما مشکلی برای من ایجاد نکرده)
- اگر زمان را انتخاب نکنید کانکشن سال 1969 را نشان میدهد و نامحدود خواهد بود، پس حتما زمان را هم به هنگام ساخت peer، واردنمایید. در غیر اینصورت مشکلی ندارد.
- همیشه cache و سایر موارد در browser خود را پاک کنید اگر در لود پنل به مشکل برخوردید.
- چند تا از دستورات اقای دونالد هم تغییر دادم اما شاید بعدا بیشتر به این تغییرات اضافه کنم.
- مشکل پاک نشدن peers ها بعد از منقضی شدن آن ها، در حال حاضر برطرف شده است.
- دستورات bash اقای دونالد هم تغییر دادم.
- یک bash script هم ادمین اپیران برای نصب پنل اماده خواهد کرد. از ایشان ممنونم.
- بعدا با کمک اقا ارمین، ظاهر پنل زیباتر خواهد شد اما نسخه اول، نسخه Html خودم خواهد بود که من در html به اندازه ایشون خوب نیستم. کمی زمان خواهد برد تا آن نسخه اماده شود.(نسخه دوم آماده شد)
- لطفا اگر دنبال پنل بدون باگ و حرفه ای هستید، به سراغ برنامه نویس های حرفه ای بروید .
- صرفا این کار برای آموزش انجام شده است و هدف دیگری در آن نیست.
  </details>
</div>


--------------

 <div align="right">
  <details>
    <summary><strong><img src="https://github.com/Azumi67/WGDashboard_Persian/assets/119934376/c36bc184-8a4f-40df-80f1-ed94738b6cec" alt="Image"> </strong>نصب پنل از طریق اسکریپت OPIRAN</summary>
  
  
------------------------------------ 
 <div align="right">
  <details>
    <summary><strong><img src="https://github.com/Azumi67/WGDashboard_Persian/assets/119934376/c36bc184-8a4f-40df-80f1-ed94738b6cec" alt="Image"> </strong>اسکریپت تانل</summary>
  
  
------------------------------------ 

- شما میتوانید از طریق اسکریپت، این تانل را برقرار کنید
- میتوانید حتی بدون FEC هم تانل را برقرار کنید اگر سرعت مناسبی دریافت نکردید.
- این اسکریپت با زبان گو نوشته شده است و این اسکریپت پیش نیاز های go را دانلود میکند و سپس اقدام به اجرای آن میکند
- برای یادگیری این تانل به لینک روبرو مراجه کنید . [Here](https://github.com/Azumi67/UDP2RAW_FEC)
```
sudo apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/Azumi67/UDP2RAW_FEC/main/go.sh)
```
- یا تانل از طریق FRP. لینک : [Here](https://github.com/Azumi67/FRP-Wireguard)
```
bash <(curl -Ls https://raw.githubusercontent.com/Azumi67/FRP-Wireguard/main/Wire.sh --ipv4)
```

  </details>
</div>

----------------------------

![147-1472495_no-requirements-icon-vector-graphics-clipart](https://github.com/Azumi67/V2ray_loadbalance_multipleServers/assets/119934376/98d8c2bd-c9d2-4ecf-8db9-246b90e1ef0f)
 **پیش نیازها**

 - لطفا سرور اپدیت شده باشه.
 - میتوانید از اسکریپت اقای [Hwashemi](https://github.com/hawshemi/Linux-Optimizer) و یا [OPIRAN](https://github.com/opiran-club/VPS-Optimizer) هم برای بهینه سازی سرور در صورت تمایل استفاده نمایید. 


----------------------------
 <div align="right">
  <details>
    <summary><strong><img src="https://github.com/Azumi67/FRP_Reverse_Loadbalance/assets/119934376/ae5b07b8-4d5e-4302-a31f-dec2a79a76b5" alt="Image"> ویدیو آموزشی</strong></summary>
------------------------------------   
  
- **ویدیوی آموزشی توسط اپیران**
<div align="right">
  <a href="https://youtu.be/o1eSsbbphAg?si=S60xxVsZRg89cp34">
    <img src="https://img.youtube.com/vi/o1eSsbbphAg/0.jpg" alt="Video Title" width="300">
  </a>
</div>
  </details>
</div>

-----------------------------------------

  ![6348248](https://github.com/Azumi67/PrivateIP-Tunnel/assets/119934376/398f8b07-65be-472e-9821-631f7b70f783)
**نصب به صورت دستی**
-
<div align="right">
  <details>
    <summary><strong>توضیحات آموزش</strong></summary>
  ------------------------------------ 
 - سرور را اپدیت کنید و وایرگارد را نصب کنید.

```
apt update -y
apt install wireguard -y
```
- پرایوت کی بسازید و در یک جا یادداشتش کنید . با دستور زیر میتوانید بسازید
  
```
wg genkey | sudo tee /etc/wireguard/server_private.key
```
- و با دستور زیر میتوانید کلیدی که ساختید را مشاهده کنید

```
cat /etc/wireguard/server_private.key
```


- با دستور زیر وارد مسیر کانفیگ وایرگارد بشوید. [مسیر پیش فرض است]
```
nano /etc/wireguard/wg0.conf
```

- داخلش متن زیر را کپی کنید
```
[Interface]
Address = 10.66.66.1/24, fd42:42:42::1/64
PostUp = iptables -I INPUT -p udp --dport 50820 -j ACCEPT
PostUp = iptables -I FORWARD -i eth0 -o wg0 -j ACCEPT
PostUp = iptables -I FORWARD -i wg0 -j ACCEPT
PostUp = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostUp = ip6tables -I FORWARD -i wg0 -j ACCEPT
PostUp = ip6tables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D INPUT -p udp --dport 50820 -j ACCEPT
PostDown = iptables -D FORWARD -i eth0 -o wg0 -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT
PostDown = iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
PostDown = ip6tables -D FORWARD -i wg0 -j ACCEPT
PostDown = ip6tables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort = 50820
PrivateKey = YOUR_GENERATED_PRIVATE_KEY
SaveConfig = true
```

- میتوانید از ایپی های دیگری استفاده کنید.
- پورت وایرگارد در اینجا 50820 است . میتوانید پورت دیگری انتخاب کنید.
- نام اینترفیس خود را با دستور ip a پیدا کنید . در اینجا به صورت پیش فرض eth0 میباشد.
- دقت کنید برای سرور های دیجیتال اوشن،  از پرایوت ایپی دیگری استفاده نمایید.
- برای ساختن اینترفیس های بیشتر و با پورت های مختلف با همین روش بالا انجام بدید و فقط نام و پورت و ایپی رو عوض کنید
- به صورت پیش فرض Peer Remote Endpoint بر روی یک عدد بی ربط است. حتما از داخل تنظیمات این مقدار را به ایپی 4 خارج یا سرور ایران در صورت تانل تغییر بدهید.
- در پنل وایرگارد داخل  ایپی کاربر وایرگارد، برای کاربر بر اساس ایپی انتخابی بالا ، از 10.66.66.2/32, fd42:42:42::2/128 و برای کاربر دوم از 10.66.66.3/32, fd42:42:42::3/128 استفاده میکنید.
 - پس از اینکه فایل را از گیت هاب در سیستم عامل خودتون دانلود کردید با دستورات زیر پیش نیازها را نصب کنید و پنل را اجرا کنید

```
$ apt update
$ apt install git
$ git clone https://github.com/Azumi67/WGDashboard_Persian.git
$ cd WGDashboard_Persian
$ mv WireguardPersian /root/
$ cd
$ rm -rf WGDashboard_Persian
$ apt-get -y install python3-pip
$ apt install gunicorn -y
$ cd WireguardPersian/src
$ sudo chmod u+x wgd.sh
$ pip install -r requirements.txt
$ sudo ./wgd.sh install
$ sudo chmod -R 755 /etc/wireguard
$ ./wgd.sh start or ./wgd.sh restart
```

- به پنل خودتون با [serverip:8080] وارد شوید. نام کاربری و رمز عبور پنل به صورت پیش فرض admin میباشد.
- دقت کنید که داخل تنظیمات Remote endpoint را به ایپی سرور ایران در صورت تانل تغییر بدهید.
- اگر به مشکل internal error در زمان لود پنل خوردید، سرور را یک بار ریبوت کنید و سپس دستور زیر را دوباره بزنید
```
$ cd WireguardPersian/src
$ ./wgd.sh restart
```
  </details>
</div>

---------------------

 <div align="right">
  <details>
    <summary><strong><img src="https://github.com/Azumi67/WGDashboard_Persian/assets/119934376/81611d4e-c407-411e-a6a1-59db37699da9" alt="Image"> </strong>کانفیگ داشبورد</summary>
  
  
------------------------------------ 


- با دستور زیر یک سرویس درست کنید
- **اگر به هر دلیلی ساخت سرویس باعث شد که پنل شما دچار قطعی و وصلی شود، سرویس خود را در هنگام بروز این مشکل مشاهده کنید و در قسمت issues بفرستید که در صورت نیاز ار روشی دیگر برای اینکار استفاده شود**

```
$ nano /etc/systemd/system/azumidash.service
```
- و محتویات پایین را داخل این سرویس کپی نمایید.
```
[Unit]
After=network.service

[Service]
WorkingDirectory=/root/WireguardPersian/src
ExecStart=/usr/bin/python3 /root/WireguardPersian/src/dashboard.py
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
```

- با دستورات زیر سرویس را فعال و اجرا نمایید
```
$ sudo chmod 664 /etc/systemd/system/azumidash.service
$ sudo systemctl daemon-reload
$ sudo systemctl enable azumidash.service
$ sudo systemctl start azumidash.service
$ sudo systemctl status azumidash.service
```

  </details>
</div>

-----------------

![scri](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/cbfb72ac-eff1-46df-b5e5-a3930a4a6651)
**اسکریپت های کارآمد :**
-
- این اسکریپت ها optional میباشد.


 
 Opiran Scripts
 
```
 bash <(curl -s https://raw.githubusercontent.com/opiran-club/pf-tun/main/pf-tun.sh --ipv4)
```

```
apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/opiran-club/VPS-Optimizer/main/optimizer.sh --ipv4)
```

Hawshemi script

```
wget "https://raw.githubusercontent.com/hawshemi/Linux-Optimizer/main/linux-optimizer.sh" -O linux-optimizer.sh && chmod +x linux-optimizer.sh && bash linux-optimizer.sh
```

---------------------------------
![R23 (1)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/18d12405-d354-48ac-9084-fff98d61d91c)
**سورس ها**



- ![R (9)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/33388f7b-f1ab-4847-9e9b-e8b39d75deaa)[سورس AMIR](https://t.me/flalo )

![R (9)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/33388f7b-f1ab-4847-9e9b-e8b39d75deaa) [سورس Wgdashboard](https://github.com/donaldzou/WGDashboard)

![R (9)](https://github.com/Azumi67/FRP-V2ray-Loadbalance/assets/119934376/33388f7b-f1ab-4847-9e9b-e8b39d75deaa) [سورس  OPIRAN](https://github.com/opiran-club)

![R (9)](https://github.com/Azumi67/6TO4-GRE-IPIP-SIT/assets/119934376/4758a7da-ab54-4a0a-a5a6-5f895092f527)[سورس  Hwashemi](https://github.com/hawshemi/Linux-Optimizer)



-----------------------------------------------------


