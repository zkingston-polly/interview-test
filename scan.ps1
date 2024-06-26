param (
    [string]$directory,
    [string]$pattern
)

$regex = [regex]::new($pattern)

Get-ChildItem -Path $directory -Filter *.txt | ForEach-Object {
    $file = $_.FullName
    $lines = Get-Content -Path $file
    $found = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($regex.IsMatch($lines[$i])) {
            Write-Output "File: $file, Line Number: $($i + 1)"
        }
    }
}
