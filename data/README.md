# Source data

Synthetic patients generated with [Synthea](https://github.com/synthetichealth/synthea): 1,103 patients in Connecticut, about 3 years of history, seed 42. All data is synthetic; none of it describes real people.

Command used:

```
java -jar synthea-with-dependencies.jar -p 1000 -s 42 -cs 42 \
  --exporter.csv.export=true --exporter.fhir.export=false \
  --exporter.hospital.fhir.export=false --exporter.practitioner.fhir.export=false \
  --exporter.years_of_history=3 Connecticut
```

| File | Rows |
| --- | --- |
| patients | 1,103 |
| claims | 40,506 |
| claims_transactions | 331,283 |

Column definitions: [Synthea CSV data dictionary](https://github.com/synthetichealth/synthea/wiki/CSV-File-Data-Dictionary).
