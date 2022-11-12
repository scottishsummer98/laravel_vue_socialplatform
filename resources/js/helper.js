import Swal from 'sweetalert2'

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 5000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  },
})

export function showSuccess(message) {
  Toast.fire({
    icon: 'success',
    title: message,
  })
}

export function showError(message) {
  Toast.fire({
    icon: 'warning',
    title: message,
  })
}
