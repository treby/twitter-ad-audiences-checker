twitter-ad-audiences-checker
===

## Getting Started

```
$ bundle install
```

Run command,

```
$ bundle exec ruby bin/twitter-ad-audience.rb
```

You can get a table below:

```
+-------+----------------------------------------+-----------+------------+---------------------+
| id    | name                                   | list_type | reasons    | statuses            |
+-------+----------------------------------------+-----------+------------+---------------------+
| xxxxx | twitter                                | DEVICE_ID | TOO_SMALL  | COMPLETED(ADD)      |
| xxxxx | Hello, twitter                         | DEVICE_ID | TOO_SMALL  | COMPLETED(REPLACE)  |
|       |                                        |           |            | COMPLETED(ADD)      |
|       |                                        |           |            | COMPLETED(ADD)      |
:       :                                        :           :            :                     :
```
