

$ScriptBlock = {
    #Insert the code of your workload here
}


$maxConcurrentJobs = 100 #Max. number of simultaneously running jobs

foreach($Object in $Objects) { #Where $Objects is a collection of objects to process. It may be a computers list, for example.
   $Check = $false #Variable to allow endless looping until the number of running jobs will be less than $maxConcurrentJobs.
   while ($Check -eq $false) {
       if ((Get-Job -State 'Running').Count -lt $maxConcurrentJobs) {

           Start-Job -ScriptBlock $ScriptBlock
           $Check = $true #To stop endless looping and proceed to the next object in the list.
       }
   }
}