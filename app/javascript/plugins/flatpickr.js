import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
});
flatpickr(".time-picker .datepicker", {
  enableTime: true
});
