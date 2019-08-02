#########################################
# 管理者として実行
#########################################
function sudo(){
	if( $args.Count -eq 0 ){
		echo "Usage...."
		echo "    sudo コマンド 引数...."
		echo ""
		return
	}

	$ProgramFlag = $True
	[String]$Argument = ""
	foreach( $arg in $args ){
		if( $ProgramFlag ){
			$Program = $arg
			$ProgramFlag = $False
		}
		else{
			$Argument += $arg + " "
		}
	}

	if( $Argument -eq [String]$null ){
		Start-Process $Program -Verb runas
	}
	else{
		Start-Process $Program -Verb runas $Argument
	}
}

