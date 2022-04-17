# vulcan

## Cloning
```
git clone --recurse-submodules git@github.com:filewalkwithme/vulcan.git
```

## How to run

```
./run.sh
```

## Ports

|Service|External Port|
|---|---|
|vulcan-ui|1234|
|vulcan-api|8080|
|nginx|8081|
|vulnerability-db|-|
|vulnerability-db-api|8083|
|vulcan-scan-engine|8084|
|vulcan-persistence (postgres)|5436|
|vulcan-scan-engine (postgres)|5434|
|goaws|4100|
|vulnerability-db (postgres)|5438|
|vulcan-api (postgres)|5432|
|keycloak|8093|

## Architecture

```
┌──────────────────────────────────────────────────────────────────────────────────────────┐
│                                                                                          │
│                       ┌──────────────────┐                                               │
│                       │                  │                                               │
│                       │     Browser      │                                               │
│                       │                  │                                               │
│                       └────────┬─────────┘                                               │
│                                │                                                         │
│                                │                                                         │
│                                │                                                         │
│                       ┌────────▼─────────┐                                               │
│                       │                  │                                               │
│                       │    nginx         │                                               │
│                       │                  │                                               │
│                       └────────┬─────────┘                                               │
│                                │                                                         │
│                                │                                                         │
│               ┌────────────────▼───────────────┐                                         │
│               │                                │                                         │
│               │                                │                                         │
│               │                                │                                         │
│      ┌────────▼─────────┐            ┌─────────▼────────┐                                │
│      │                  │            │                  │        ┌──────────────────┐    │
│      │    vulcan-api    ◄────────────┤    vulcan-ui     │        │                  │    │
│      │                  │            │                  │     ┌──►    Target-#1     │    │
│      └────────▲─────────┘            └──────────────────┘     │  │                  │    │
│               │                                               │  └──────────────────┘    │
│               │                                               │                          │
│               │                                               │  ┌──────────────────┐    │
│    ┌──────────▼─────────────┐                                 │  │                  │    │
│    │                        │                                 ├──►    Target-#2     │    │
│    │ vulnerability-db-api   │         ┌──────────────────┐    │  │                  │    │
│    │                        │         │                  │    │  └──────────────────┘    │
│    └──────────▲─────────────┘         │    vulcan-core   ├────►                          │
│               │                       │                  │    │  ┌──────────────────┐    │
│               │                       └────────┬─────────┘    │  │                  │    │
│               │                                │              ├──►    Target-#3     │    │
│               │                                │              │  │                  │    │
│       ┌───────┴──────────┐                     │              │  └──────────────────┘    │
│       │                  │                     │              │                          │
│       │ vulnerability-db ◄─────────────────────┘              │  ┌──────────────────┐    │
│       │                  │                                    │  │                  │    │
│       └──────────────────┘                                    └──►    Target-#...   │    │
│                                                                  │                  │    │
│                                                                  └──────────────────┘    │
│                                                                                          │
└──────────────────────────────────────────────────────────────────────────────────────────┘
```
