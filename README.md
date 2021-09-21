# bitlocker

A simple script find and open dirve encrypted with BitLocker in ubuntu.

First install these dependencies:
- sudo apt install dislocker

Then run sudo ./unlock.sh. Script will show you BitLocker drive that found.
You will see somthing like this:

```
Unlocking drive...
Device     Boot Start        End    Sectors   Size Id Type
/dev/sdc1  *     2048 1953521663 1953519616 931.5G  7 HPFS/NTFS/exFAT

Enter Password:
```

Now you can enter the password.
