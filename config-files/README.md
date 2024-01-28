# Addition note
For nvim, please change permission of
```
.local/state/nvim/swap/
```
from `755` (I think?) to `775` because nvim cant access to swap folder. (MacOS security shit?)
```
chmod -R 775 ~/.local/state/nvim/swap/
```
