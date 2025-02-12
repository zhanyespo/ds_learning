# Define the base directory for the repo
$baseDir = "C:\Temp\DS\ds_learning"  # Your desired repo location

# Define the first project name
$projectName = "titanic_prediction"

# Define main folders
$folders = @(
    "notebooks",
    "scripts",
    "data/raw",
    "data/processed",
    "models",
    "reports/figures",
    "projects/$projectName/notebooks",
    "projects/$projectName/scripts",
    "projects/$projectName/data/raw",
    "projects/$projectName/data/processed",
    "projects/$projectName/models",
    "projects/$projectName/reports/figures"
)

# Create the folders
foreach ($folder in $folders) {
    $fullPath = "$baseDir\$folder"
    if (!(Test-Path -Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "Created: $fullPath"
    } else {
        Write-Host "Already exists: $fullPath"
    }
}

# Create README files
$readmeFiles = @(
    "$baseDir\README.md",
    "$baseDir\projects\$projectName\README.md"
)

foreach ($file in $readmeFiles) {
    if (!(Test-Path -Path $file)) {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Write-Host "Created README: $file"
    } else {
        Write-Host "README already exists: $file"
    }
}

# Create .gitignore
$gitignorePath = "$baseDir\.gitignore"
if (!(Test-Path -Path $gitignorePath)) {
    @"
# Ignore virtual environments
venv/
__pycache__/

# Ignore Jupyter Notebook checkpoints
.ipynb_checkpoints/

# Ignore large datasets and model files
data/raw/
data/processed/
models/

# Ignore system files
.DS_Store
Thumbs.db
"@ | Out-File -Encoding UTF8 $gitignorePath
    Write-Host "Created .gitignore"
} else {
    Write-Host ".gitignore already exists"
}

# Create requirements.txt
$requirementsPath = "$baseDir\requirements.txt"
if (!(Test-Path -Path $requirementsPath)) {
    New-Item -ItemType File -Path $requirementsPath -Force | Out-Null
    Write-Host "Created requirements.txt"
} else {
    Write-Host "requirements.txt already exists"
}

Write-Host "✅ Folder structure for Data Science projects created at: $baseDir"
