const isLeapYear = (year) => {
  return (
    (year % 4 === 0 && year % 100 !== 0 && year % 400 !== 0) ||
    (year % 100 === 0 && year % 400 === 0)
  );
};

const getFebDays = (year) => {
  return isLeapYear(year) ? 29 : 28;
};

let calendar = document.querySelector('.calendar');
const month_names = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre',
];

let month_picker = document.querySelector('#month-picker');
const dayTextFormate = document.querySelector('.day-text-formate');
const timeFormate = document.querySelector('.time-formate');
const dateFormate = document.querySelector('.date-formate');

month_picker.onclick = () => {
  month_list.classList.remove('hideonce');
  month_list.classList.remove('hide');
  month_list.classList.add('show');
  dayTextFormate.classList.remove('showtime');
  dayTextFormate.classList.add('hidetime');
  timeFormate.classList.remove('showtime');
  timeFormate.classList.add('hideTime');
  dateFormate.classList.remove('showtime');
  dateFormate.classList.add('hideTime');
};

const generateCalendar = (month, year) => {
  let calendar_days = document.querySelector('.calendar-days');
  calendar_days.innerHTML = '';
  let calendar_header_year = document.querySelector('#year');
  let days_of_month = [
      31,
      getFebDays(year),
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
  ];

  let currentDate = new Date();

  month_picker.innerHTML = month_names[month];
  calendar_header_year.innerHTML = year;

  let first_day = new Date(year, month);

  for (let i = 0; i <= days_of_month[month] + first_day.getDay() - 1; i++) {
      let day = document.createElement('div');
      if (i >= first_day.getDay()) {
          day.innerHTML = i - first_day.getDay() + 1;
          if (i - first_day.getDay() + 1 === currentDate.getDate() &&
              year === currentDate.getFullYear() &&
              month === currentDate.getMonth()
          ) {
              day.classList.add('current-date');
          }
      }
      calendar_days.appendChild(day);
  }
};

let month_list = calendar.querySelector('.month-list');

document.querySelector('#pre-year').onclick = () => {
  // Navegar al mes anterior
  currentMonth.value = (currentMonth.value - 1 + 12) % 12;
  
  // Si el mes es diciembre y se mueve a enero, decrementar el año
  if (currentMonth.value === 11) {
      currentYear.value--;
  }
  
  generateCalendar(currentMonth.value, currentYear.value);
};

document.querySelector('#next-year').onclick = () => {
  // Navegar al mes siguiente
  currentMonth.value = (currentMonth.value + 1) % 12;
  
  // Si el mes es enero y se mueve a diciembre, incrementar el año
  if (currentMonth.value === 0) {
      currentYear.value++;
  }
  
  generateCalendar(currentMonth.value, currentYear.value);
};

let currentDate = new Date();
let currentMonth = { value: currentDate.getMonth() };
let currentYear = { value: currentDate.getFullYear() };
generateCalendar(currentMonth.value, currentYear.value);

const todayShowTime = document.querySelector('.time-formate');
const todayShowDate = document.querySelector('.date-formate');

const currshowDate = new Date();
const showCurrentDateOption = {
  year: 'numeric',
  month: 'long',
  day: 'numeric',
  weekday: 'long',
};
const currentDateFormate = new Intl.DateTimeFormat(
  'es-AR',
  showCurrentDateOption
).format(currshowDate);
todayShowDate.textContent = currentDateFormate;

setInterval(() => {
  const timer = new Date();
  const option = {
      hour: 'numeric',
      minute: 'numeric',
      second: 'numeric',
  };
  const formateTimer = new Intl.DateTimeFormat('es-AR', option).format(timer);
  let time = `${`${timer.getHours()}`.padStart(
      2,
      '0'
  )}:${`${timer.getMinutes()}`.padStart(
      2,
      '0'
  )}:${`${timer.getSeconds()}`.padStart(2, '0')}`;
  todayShowTime.textContent = formateTimer;
}, 1000);