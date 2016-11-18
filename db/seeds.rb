# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_manu = User.create(email: 'manufarfaro@gmail.com', password: '123456', password_confirmation: '123456', role: 1, name: 'Emanuel', surname: 'Farfaro', company_name: 'Ualabi Solutions')

client_ualabisolutions = User.create(email: 'blas@ualabisolutions.com', password: 'blas123', password_confirmation: 'blas123', name: 'Blas', surname: 'Moyano', company_name: 'Ualabi Solutions')