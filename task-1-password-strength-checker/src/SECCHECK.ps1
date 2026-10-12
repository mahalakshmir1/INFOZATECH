@'
Write-Host ""
Write-Host "  ███████╗███████╗ ██████╗ ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗" -ForegroundColor Cyan
Write-Host "  ██╔════╝██╔════╝██╔════╝██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝" -ForegroundColor Cyan
Write-Host "  ███████╗█████╗  ██║     ██║     ███████║█████╗  ██║     █████╔╝ " -ForegroundColor Cyan
Write-Host "  ╚════██║██╔══╝  ██║     ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ " -ForegroundColor DarkCyan
Write-Host "  ███████║███████╗╚██████╗╚██████╗██║  ██║███████╗╚██████╗██║  ██╗" -ForegroundColor Cyan
Write-Host "  ╚══════╝╚══════╝ ╚═════╝ ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝" -ForegroundColor DarkCyan
Write-Host ""
Write-Host "  🔒  PASSWORD SECURITY CHECKER  v1.0" -ForegroundColor White
Write-Host "  >> MINECRAFT-INSPIRED SECURITY TOOL <<" -ForegroundColor Green
Write-Host "  >> DEFEND YOUR DIGITAL KINGDOM <<" -ForegroundColor Yellow
Write-Host ""
Write-Host "  --------------------------------------------------------------" -ForegroundColor DarkCyan
Write-Host ""

$password = Read-Host "Enter a TEST password"
$score = 0

if ($password.Length -ge 12) {
    $score++
    Write-Host "Good length!" -ForegroundColor Green
}
else {
    Write-Host "[!] Too short! Use at least 12 characters." -ForegroundColor Red
}

if ($password -cmatch '[A-Z]') {
    $score++
    Write-Host "Uppercase letter found!" -ForegroundColor Green
}
else {
    Write-Host "[!] Add an uppercase letter." -ForegroundColor Red
}

if ($password -cmatch '[a-z]') {
    $score++
    Write-Host "Lowercase letter found!" -ForegroundColor Green
}
else {
    Write-Host "[!] Add a lowercase letter." -ForegroundColor Red
}

if ($password -match '[0-9]') {
    $score++
    Write-Host "Number found!" -ForegroundColor Green
}
else {
    Write-Host "[!] Add a number." -ForegroundColor Red
}

if ($password -match '[^a-zA-Z0-9]') {
    $score++
    Write-Host "Symbol found!" -ForegroundColor Green
}
else {
    Write-Host "[!] Add a symbol." -ForegroundColor Red
}

$blocklist = @(
    "password",
    "password123",
    "12345678",
    "qwerty123",
    "admin123"
)

$isCommon = $blocklist -contains $password.ToLowerInvariant()

if ($isCommon) {
    $score = 0
    Write-Host "WARNING: COMMON PASSWORD DETECTED!" -ForegroundColor Red
}

Write-Host ""
Write-Host "  ================= SECCHECK REPORT =================" -ForegroundColor Cyan
Write-Host "  Score: $score / 5" -ForegroundColor White
Write-Host ""
Write-Host "  ================ HOW TO LEVEL UP ==================" -ForegroundColor Yellow

if ($password.Length -lt 12) {
    Write-Host "  - Use at least 12 characters." -ForegroundColor Red
}

if ($password -cnotmatch '[A-Z]') {
    Write-Host "  - Add an uppercase letter." -ForegroundColor Red
}

if ($password -cnotmatch '[a-z]') {
    Write-Host "  - Add a lowercase letter." -ForegroundColor Red
}

if ($password -notmatch '[0-9]') {
    Write-Host "  - Add a number." -ForegroundColor Red
}

if ($password -notmatch '[^a-zA-Z0-9]') {
    Write-Host "  - Add a symbol." -ForegroundColor Red
}

if ($isCommon) {
    Write-Host "  - Avoid common passwords like password123." -ForegroundColor Red
}

Write-Host ""

if ($isCommon -or $score -le 2) {
    Write-Host "  RATING: WEAK" -ForegroundColor Red
}
elseif ($score -le 4) {
    Write-Host "  RATING: MEDIUM" -ForegroundColor Yellow
}
else {
    Write-Host "  RATING: STRONG" -ForegroundColor Green
}

Write-Host ""
Write-Host "  =============== MISSION COMPLETE ===============" -ForegroundColor Green
Write-Host ""
'@ | Set-Content -Path ".\INFOZATECH\task-1-password-strength-checker\src\SECCHECK.ps1" -Encoding utf8
