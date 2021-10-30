# FreeAirbnb

Application réalisée dans le cadre de la formation The Hacking project.

## Version 1.0

Backend de l'application créé, utilisation en mode console

* Possibilité de créer des utilisateurs (user)
* Possibilité de créer des logements (lodging) / user affecté via administrator
* Possibilité de créer des réservations (reservation) / user affecté via guest
* Validations fonctionnelles (impossibilité de réserver si le logement est déjà réserver aux dates demandées)
* Données factices générées par seed/ gem Faker

## Execution

```
bundle install
rails console
```

* Consultation des données via la gem table_print

```
tp User.all
tp Lodging.all
tp Reservation.all
```

* Consultation des logements par ville

```
tp City.all[2].lodgings
```
