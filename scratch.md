```c
/** @defgroup getRes0Indexes getRes0Indexes
 * Functions for getRes0Indexes
 * @{
 */
/** @brief returns the number of resolution 0 indexes */
int H3_EXPORT(res0IndexCount)();

/** @brief provides all base cells */
void H3_EXPORT(getRes0Indexes)(H3Index *out);
/** @} */

/** @defgroup getPentagonIndexes getPentagonIndexes
 * Functions for getPentagonIndexes
 * @{
 */
/** @brief returns the number of pentagons per resolution */
int H3_EXPORT(pentagonIndexCount)();

/** @brief generates all pentagons at the specified resolution */
void H3_EXPORT(getPentagonIndexes)(int res, H3Index *out);
/** @} */

/** @defgroup h3ToCenterChild h3ToCenterChild
 * Functions for h3ToCenterChild
 * @{
 */
/** @brief returns the center child of the given hexagon at the specified
 * resolution */
H3Index H3_EXPORT(h3ToCenterChild)(H3Index h, int childRes);
```

# icosahedron

- 12 vertices
- 20 faces

# bit representation


|    description    | # bits |
|-------------------|--------|
| reserved          | 1      |
| index mode        | 4      |
| reserved          | 3      |
| cell resolution   | 4      |
| base cell (0:121) | 7      |
| child 1           | 3      |
| ...               | ...    |
| child 15          | 3      |
|                   |        |


