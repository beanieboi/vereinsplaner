# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

MembershipType.create(
  short: "full",
  name: "Aktive Mitgliedschaft"
)

MembershipType.create(
  short: "discounted",
  name: "ermäßigte Mitgliedschaft"
)

MembershipType.create(
  short: "passive",
  name: "Passive Mitgliedschaft"
)

MembershipType.create(
  short: "support",
  name: "Fördermitgliedschaft"
)

MembershipType.create(
  short: "unknown",
  name: "Unbekannt"
)