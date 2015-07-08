param($installPath, $toolsPath, $package, $project)

  #Get all of the T4 files in the package extension .tt
  $files = $package.GetFiles() | Where-Object {$_.EffectivePath -match "tt$"}

  foreach ($file in $files)
  {
     $fileName = $file.EffectivePath
	 if ($fileName -match "runme.tt$") { continue }

     $ProjectItem = $project.ProjectItems | Where-Object {$_.Name -eq $fileName}

     #Set CustomTool to empty not TextTemplatingFileGenerator
     $CustomTool = $ProjectItem.Properties | where-object {$_.Name -eq "CustomTool"}
     $CustomTool.Value = ""
  }