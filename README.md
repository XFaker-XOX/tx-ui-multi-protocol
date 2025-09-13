# tx-ui-multi-protocol ✨

> Traffic-unifier micro-service for the **tx-ui** panel. Written in C#/.NET 9, hardened for systemd, and now fully configurable.

## کلیدی‌‌ترین تغییرات نسبت به ریپوی اصلی (3xui-multi-protocol)

1. **پشتیبانی از .NET 9** – دیگر نیازی به نصب نسخه 7 نیست.
2. **قابل تنظیم بودن بازه همگام‌سازی** با متغیر محیطی `SYNC_INTERVAL_SEC` (پیش‌فرض 60 ثانیه).
3. **هندلینگ خطا و لاگ تایم‌استمپ‌دار** – حلقه کرش نمی‌کند، خطاها در journalctl ثبت می‌شوند.
4. **busy_timeout برای SQLite** – از خطای «database is locked» جلوگیری می‌کند.
5. **سخت‌سازی systemd** (`ProtectSystem`, `NoNewPrivileges`, …).
6. README جدید + تصویر تازه.

---

# نصب / Install

```bash
bash <(curl -Ls https://raw.githubusercontent.com/XFaker-XOX/tx-ui-multi-protocol/master/install.sh)
```

اسکریپت به صورت خودکار:

- Runtime یا SDK نسخه 9 را نصب می‌کند (دبیان/اوبونتو 24.04+, سنت‌اواس، فدورا...)
- پروژه را `dotnet publish` کرده و در ‎`/etc/tx-ui-multi-protocol`‎ قرار می‌دهد
- فایل ‎`tx-ui-multi-protocol.service`‎ را در ‎`/etc/systemd/system`‎ نصب و فعال می‌کند

### تنظیم بازه زمانی (اختیاری)

```ini
[Service]
Environment=SYNC_INTERVAL_SEC=120  # هر ۲ دقیقه
```

### توقف / اجرا / حذف

```bash
systemctl stop  tx-ui-multi-protocol   # توقف
systemctl start tx-ui-multi-protocol  # اجرا دوباره
systemctl status tx-ui-multi-protocol # مشاهده وضعیت

# حذف کامل
bash <(curl -Ls https://raw.githubusercontent.com/XFaker-XOX/tx-ui-multi-protocol/master/unistall.sh)
```

## نحوه کار

سرویس هر `SYNC_INTERVAL_SEC` ثانیه به دیتابیس ‎`/etc/x-ui/x-ui.db`‎ سر می‌زند و ترافیک همه کلاینت‌هایی که **Subscription-ID یکسان** دارند را مساوی با بیشترین مقدار بین آن‌ها می‌کند.

![subscription](subscription-img.png)

> Only traffic is unified; ipLimit or other fields remain untouched.

Enjoy! 🎉
