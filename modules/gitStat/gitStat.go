package gitstat

import (
	"os"

	"github.com/ClementBolin/topGo/modules/gitStat/scan"
	"github.com/ClementBolin/topGo/modules/gitStat/ui"
)

// Deleate char at indx
func delChar(s []rune, index int) []rune {
    return append(s[0:index], s[index+1:]...)
}

// clear path string
func clearPath(path string) string {
	for i := 0; i != len(path)-2; i++ {
		c := string(path[i])
		c1 := string(path[i+1])
		if (c == "/" && c1 == "/") {
			path = string(delChar([]rune(path), i))
		}
	}
	return path
}

// GitStat : GitStat module
func GitStat() string {
	var emailFlag string = "clement.bolin@epitech.eu"

	path := scan.ScanUniqueFolderGit(os.Getenv("PWD"), emailFlag)
	if (path[0] == "") {
		return "\n\n\n\n\nYou are not in git Repository, or we don't find commit from " + emailFlag
	}
	path[0] = clearPath(path[0])
	return ui.CreateTableUI(path, emailFlag)
}
	