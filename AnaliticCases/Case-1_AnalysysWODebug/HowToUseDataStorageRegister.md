Дано: в базе продуктива ошибка, в продуктиве при этом не доступен отладчик.

Требуется проанализировать состав данных, которые вызывают ошибку.

Ограничения: бэкап делать нельзя.

Тест выполнялся в базе УХ3.1.7.2 при заполнении документа "Экземпляр отчета фактическими данными".

В модуль УправлениеОтчетамиУХ строка 18150, процедуры ПодготовитьТаблицуЗначенийОперандов мы вставляем такой код:

ОбщегоНазначениябп.ЗаписатьДанныеВХранилище("УправлениеОтчетамиУХ.ПодготовитьТаблицуЗначенийОперандов()_18150",мТабПоказателиЗапросы,"Тест1");

ОбщегоНазначениябп.ЗаписатьДанныеВХранилище это процедура записи данных в регистр хранилище данных.

Ниже его структура, фактически мы записываем таблицу значений в ресурс "Данные". 

![image](https://user-images.githubusercontent.com/5235515/118364951-5bd64d80-b5a3-11eb-920c-8ca9dd558a7b.png)

Результат записи тут

![image](https://user-images.githubusercontent.com/5235515/118364802-a86d5900-b5a2-11eb-8a1d-5ea3f39bab75.png)

Далее нам нужно перебросить эту запись в другую базу данных, где отладчик уже доступен, прочитать ресурс данные и увидеть содержимое таблицы значений.

Используем для выгрузки обработку "ВыгрузкаЗагрузкаДанныхXML82.epf (в комплекте поставки конвертации данных 2.0, работает в обычном приложении, можно наложить отбор при выгрузке)

Указываем отбор по владельцу, чтобы выгрузилось только нужное нам значение. Владелец имеет тип значения строка. 

Нужно скопипастить УправлениеОтчетамиУХ.ПодготовитьТаблицуЗначенийОперандов()_18150 

![image](https://user-images.githubusercontent.com/5235515/118365726-bc1abe80-b5a6-11eb-9c6a-d0080589887b.png)

В тестовой базе (где работает отладчик) в режиме обычного приложения, где работает отладчик делаем загрузку этого файла этой же обработкой.

![image](https://user-images.githubusercontent.com/5235515/118365886-2e8b9e80-b5a7-11eb-8016-5b9163973e81.png)

Осталось дело за малым, написать обработку для распаковки данных хранилища значения и прочитать его.

В обработке указываем владельца и ключи

![image](https://user-images.githubusercontent.com/5235515/118366725-1c126480-b5a9-11eb-980b-a3d33f43030a.png)

Далее в отладчике ставим точку останова и видим нужную нам таблицу значений.

![image](https://user-images.githubusercontent.com/5235515/118367013-49f7a900-b5a9-11eb-89d0-1020fff1778d.png)

Содержимое полностью просматривается можно вывести его на форму при необходимости

![image](https://user-images.githubusercontent.com/5235515/118367056-81feec00-b5a9-11eb-978d-b1e637a611d3.png)

Листинг кода простейшей обработки тут.

https://github.com/Kindman1980/Analitik1c/blob/main/AnaliticCases/HowToUseDataStorageRegister_ReadingEPF.txt

Обработка содержит одну команду и 2 поля, владелец (можно скопировать измерение регистра "Хранилище данных" и поле "Ключи" с типом строка. 

2021-05-29
можно сериализовать структуры и класть в таблицы значений также структуры
Строка таблицы значений в структуру - ОбщегоНазначения.СтрокаТаблицыЗначенийВСтруктуру(строкаТЗ);




Stay tuned!!!
