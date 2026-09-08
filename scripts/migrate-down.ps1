$envContent = Get-Content .env
foreach ($line in $envContent) {
    if ($line -match "^DATABASE_URL=(.*)$") {
        $env:DATABASE_URL = $matches[1]
    }
}
migrate -database $env:DATABASE_URL -path migrations down 1