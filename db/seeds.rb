# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    first_name: "Mr",
    last_name: "Test",
    email: "email@email",
    password: "pass"
)
User.create(
    first_name: "Dr",
    last_name: "No",
    email: "dr@no",
    password: "pass"
)

BankDetail.create(
    user_id: 1,
    account_holder_name: "Mr Test",
    bank_name: "To Big To Fail",
    account_name: "Current"
)
BankDetail.create(
    user_id: 1,
    account_holder_name: "Mr Test",
    bank_name: "High Street Money",
    account_name: "123"
)
BankDetail.create(
    user_id: 2,
    account_holder_name: "Dr No"
    bank_name: "To Big To Fail",
    account_name: "Current"
)

CardDetail.create(
    user_id: 1,
    card_holder_name: "Mr Test", 
    card_provider: "Plastic Money",
    card_type: "Credit"
)
CardDetail.create(
    user_id: 1,
    card_holder_name: "Mr Test", 
    card_provider: "Yakie Express",
    card_type: "Credit"
)
CardDetail.create(
    user_id: 2,
    card_holder_name: "Dr No", 
    card_provider: "VISA",
    card_type: "Debit"
)

PaypalDetail.create(
    user_id: 1,
    account_email: "email@email"
)

Company.create(
    name: "Flix",
    company_number: "AC123452"
)
Company.create(
    name: "Black Forest",
    company_number: "39209328"
)
Company.create(
    name: "Phones",
    company_number: "BD154283"
)

Currency.create(
    base: "GBP",
    date: "2019-04-15",
    rates_GBP: 1,
    rates_USD: 1.302423,
    rates_EUR: 1.152432
)