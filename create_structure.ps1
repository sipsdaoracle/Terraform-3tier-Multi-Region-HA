# Define the base path of your project
$basePath = (Get-Location).Path

# Create the project structure
$structure = @{
    "main.tf" = $false
    "variables.tf" = $false
    "outputs.tf" = $false
    "backend.tf" = $false
    "terraform.tfvars" = $false
    "modules/vpc/main.tf" = $false
    "modules/vpc/variables.tf" = $false
    "modules/vpc/outputs.tf" = $false
    "modules/elb/main.tf" = $false
    "modules/elb/variables.tf" = $false
    "modules/elb/outputs.tf" = $false
    "modules/ec2/main.tf" = $false
    "modules/ec2/variables.tf" = $false
    "modules/ec2/outputs.tf" = $false
    "modules/rds/main.tf" = $false
    "modules/rds/variables.tf" = $false
    "modules/rds/outputs.tf" = $false
    "modules/route53/main.tf" = $false
    "modules/route53/variables.tf" = $false
    "modules/route53/outputs.tf" = $false
    "envs/dev/main.tf" = $false
    "envs/dev/variables.tf" = $false
    "envs/dev/terraform.tfvars" = $false
}

# Loop through the structure and create files and directories
foreach ($path in $structure.Keys) {
    $fullPath = Join-Path $basePath $path
    $dir = Split-Path $fullPath -Parent

    # Create the directory if it doesn't exist
    if (-not (Test-Path $dir)) {
        New-Item -Path $dir -ItemType Directory | Out-Null
    }

    # Create the file if it doesn't exist
    if (-not (Test-Path $fullPath)) {
        New-Item -Path $fullPath -ItemType File | Out-Null
    }
}

Write-Host "Project structure created at $basePath"
