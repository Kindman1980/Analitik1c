ВЫБРАТЬ
	ЖурналОпераций.ДоговорКонтрагента.Владелец КАК Контрагент
ПОМЕСТИТЬ ИспользуемыеКонтрагенты
ИЗ
	ЖурналДокументов.ЖурналОпераций КАК ЖурналОпераций
ГДЕ
	ЖурналОпераций.Организация = &Организация
	И НЕ ЖурналОпераций.ДоговорКонтрагента.Владелец ЕСТЬ NULL

СГРУППИРОВАТЬ ПО
	ЖурналОпераций.ДоговорКонтрагента.Владелец
;

////////////////////////////////////////////////////////////////////////////////
ВЫБРАТЬ
	Контрагенты.Ссылка КАК Ссылка
ИЗ
	Справочник.Контрагенты КАК Контрагенты
		ЛЕВОЕ СОЕДИНЕНИЕ ИспользуемыеКонтрагенты КАК ИспользуемыеКонтрагенты
		ПО (Контрагенты.Ссылка = ИспользуемыеКонтрагенты.Контрагент)
ГДЕ
	ИспользуемыеКонтрагенты.Контрагент ЕСТЬ NULL
