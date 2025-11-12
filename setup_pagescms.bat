@echo off
REM ============================================
REM  Setup Pages CMS structure for Jekyll site
REM  Location: Run inside your repo root folder
REM ============================================

echo.
echo Setting up Pages CMS in the current directory...
echo.

REM Create main CMS folder
mkdir _cms

REM Create Pages CMS config file at repo root
(
echo backend:
echo^  name: github
echo^  repo: YOUR_GITHUB_USERNAME/UCA-Construction-Standards
echo^  branch: main
echo^  auth:
echo^    type: implicit
echo.
echo site:
echo^  name: UCA Construction Standards
echo.
echo collections:
echo^  - name: "standards"
echo^    label: "Construction Standards"
echo^    folder: "_standards"
echo^    create: true
echo^    slug: "{{path}}"
echo^    fields:
echo^      - { name: "layout", label: "Layout", widget: "string", default: "default" }
echo^      - { name: "title", label: "Title", widget: "string" }
echo^      - { name: "permalink", label: "Permalink", widget: "string" }
echo^      - { name: "tags", label: "Tags", widget: "list" }
echo^      - { name: "body", label: "Content", widget: "markdown" }
) > pagescms.config.yml

REM Add meta tag to load config in CMS index.html
(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8" /^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^>
echo     ^<meta name="pagescms-config-path" content="/pagescms.config.yml" /^>
echo     ^<title^>UCA Construction Standards CMS^</title^>
echo ^</head^>
echo ^<body^>
echo     ^<h2^>Loading Pages CMS...^</h2^>
echo     ^<script src="https://unpkg.com/pages-cms@latest/dist/pagescms.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > _cms\index.html

REM Ensure Jekyll includes the CMS folder
echo include:^> _cms >> _config.yml

echo.
echo ✅ Pages CMS setup complete!
echo.
echo To finish:
echo 1. Open pagescms.config.yml and replace YOUR_GITHUB_USERNAME with your actual GitHub username.
echo 2. Commit and push changes to GitHub.
echo 3. Visit: https://YOUR_GITHUB_USERNAME.github.io/UCA-Construction-Standards/_cms/
echo.

pause
