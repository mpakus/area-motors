100.times do
  Email::Import.perform
  putc '.'
end