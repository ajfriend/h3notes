# H3 Quickstart/ talk outline


##

Convert a lat/lng pair to its corresponding
H3 cell at a given resolution (`0` is the largest,
`15` is the smallest).

`h = h3.geo_to_h3(lat, lng, 9)`

show a few different sizes?

##

Convert an H3 cell to its center point with

```
lat, lng = h3.h3_to_geo(h)
```

or to the sequence of lat/lng pairs giving its
vertices with

```
boundary = h3_to_geo_boundary(h)
```

## Pentagons

H3 uses mostly hexagons, but also a few pentagons to tile the globe.
For any resolution, there are exactly XXX pentagon cells.

For example,

```
p = h3.geo_to_h3(lat, lng, 7)
```

(plot p)

## Neighboring Cells

### ring

### disk

(maybe a plot comparing ring to disk for a few different sizes)

## Distance and path between cells

## Geofences to sets of hexagons. polyfill

## Sets of hexagons to geofences

## Parents and children

## Hexagon set compression

# bit layout

- walk people down the resolutions, showing which child is being selected
    + maybe nubmer the children
- show some hexids that are obviously invalid
- show how to know the resolution
- show how edges work

# Curiosities

- hex area differences
    + where are they largest/smallest
- "hexagons" with more than 6 vertices and why
- pentagons
- skewness




