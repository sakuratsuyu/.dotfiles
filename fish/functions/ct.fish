function ct
    if test (math (count (ls -a ~/.trash_bin/))-(count (ls ~/.trash_bin/))) -gt 2
        /bin/rm -rf ~/.trash_bin/.*
    end
    if test (count (ls ~/.trash_bin/)) -gt 0
        /bin/rm -rf ~/.trash_bin/*
    end
end
