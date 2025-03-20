# Fast Dice Notation (FDN) Grammar Specification

## Core Components

### Basic Roll
- `AdB`: Roll A dice with B faces
  - `3d6`: Roll three 6-sided dice
  - `d20`: Roll one 20-sided die (Leading 1s are redundant)
  - `2d%`: Roll two 100-sided dice

### Modifiers
1. **Keep/Drop**
   - `kX`: Keep highest X results
   - `khX`: Keep highest X (explicit)
   - `klX`: Keep lowest X
   - `dX`: Drop highest X
   - `dlX`: Drop lowest X
   - Example: `4d6k3` = Roll 4d6, keep highest 3

2. **Exploding Dice**
   - `!`: Explode on max roll
   - `!>X`: Explode on rolls > X
   - `!<X`: Explode on rolls < X
   - Example: `d6!>4` = Roll d6, explode on 5-6

3. **Reroll**
   - `rX`: Reroll once on X
   - `r>X`: Reroll on > X
   - `r<X`: Reroll on < X
   - `rXx3`: Reroll max 3 times
   - Example: `d20r1x2` = Reroll 1s (max 2 times)

4. **Sorting**
   - `s`: Sort ascending
   - `sd`: Sort descending
   - Example: `5d6s` = Roll 5d6, sort results

5. **Advantage/Disadvantage**
   - `adv`: Roll twice, keep higher
   - `dis`: Roll twice, keep lower
   - Example: `d20adv` = Roll with advantage

6. **FATE/Fudge**
   - `f`: Roll FATE dice (-1, 0, +1)
   - Example: `4f` = Roll four FATE dice

### Arithmetic Operations
- Operators: `+`, `-`, `*`, `/`
- Parentheses for grouping
- Example: `(2d6 + 3) * 1d4`
- All of the operations have normal meanings

### Other Features
- **Comments**: `# This is a comment`
- **Percentile shorthand**: `d%` = `d100`
- **Negative numbers**: `-3d6`
- **Complex expressions**: 
  `4d6k3 + 2d8! + 5 # Heroic attack!`

## Full Order of Operations
1. Parentheses
2. Dice rolls (left to right)
3. Unary minus
4. Multiplication/Division (left to right)
5. Addition/Subtraction (left to right)
6. Modifiers apply to immediate preceding dice

## Examples
```fdn
# Standard D&D attack
1d20adv + 5 # Attack with advantage

# Complex magic item
(3d6! + 2d4r1) * 1d3 # Flaming sword

# Character creation
4d6k3 6 times # Generate 6 stats

# Fate core system
4f + 2 # Skill check

# Monster attack
8d6s # Dragon breath (sorted damage)
```