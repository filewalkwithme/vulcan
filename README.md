# vulcan

## How to run

```
./run.sh
```

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
