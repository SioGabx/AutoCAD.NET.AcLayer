param($installPath, $toolsPath, $package, $project)
$asms = $package.AssemblyReferences | %{$_.Name} 
foreach ($reference in $project.Object.References) 
{
    if ($asms -contains $reference.Name + ".dll") 
    {
        $reference.CopyLocal = $false;
    }
}
# Save to make sure the change doesn't get lost
$project.Save()