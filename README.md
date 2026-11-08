# יוחננוף 🌊

לוח התורות של הדירה באשקלון (ימה, מרינה).

האתר: https://tamirsayada.github.io/yochananuf/

הנתונים נשמרים ב-Supabase (פרויקט `yochananuf`), והגישה מוגנת בקוד משפחתי שנבדק בשרת.

## אם האתר לא טוען תורות

כנראה ש-Supabase השבית את הפרויקט (בתוכנית החינמית זה קורה אחרי שבוע בלי פעילות).
נכנסים ל-supabase.com/dashboard → `yochananuf` → **Restore**.
המשימה `keepalive` ב-GitHub Actions כותבת למסד הנתונים כל יום כדי למנוע את זה
(צריך להריץ פעם אחת את `supabase/keepalive.sql` ב-SQL Editor).
