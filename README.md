# Computer Science Department Website - DevOps Term Project

A professional static departmental website developed using DevOps best practices, featuring complete CI/CD pipelines, Docker containerization, and multi-environment deployments.

## 📋 Project Overview

This project demonstrates a complete end-to-end DevOps workflow for developing, testing, containerizing, and deploying a static website for a university Computer Science Department. The website serves as an information portal for students, faculty, and prospective applicants.

### 🎯 Project Objectives

- Implement Git Flow workflow with collaborative development
- Containerize static website using Docker
- Create separate CI/CD pipelines for three environments
- Deploy to Development, Staging/QA, and Production environments
- Implement HTML/CSS linting and automated testing
- Manage secrets securely using GitHub Environments

## 🌐 Live Deployments

| Environment | Branch | URL | Status |
|------------|--------|-----|--------|
| **Production** | `main` | [term-project-prod.onrender.com](https://term-project-prod.onrender.com) | ![Production](https://img.shields.io/badge/status-live-success) |
| **Staging/QA** | `release` | [term-project-staging.onrender.com](https://term-project-staging.onrender.com) | ![Staging](https://img.shields.io/badge/status-live-success) |
| **Development** | `develop` | [term-project-dev.onrender.com](https://term-project-dev.onrender.com) | ![Development](https://img.shields.io/badge/status-live-success) |

## 👥 Team Members

| Sr # | Name | Roll Number | Role | Assigned Web Page | Workflow Created |
|------|------|-------------|------|-------------------|------------------|
| 1 | [Team Lead Name] | [Roll #] | Team Lead | Home Page | CI Pipeline |
| 2 | [Developer Name] | [Roll #] | Developer | Courses Page | CD Development |
| 3 | [Developer Name] | [Roll #] | Developer | Faculty Page | CD Staging |
| 4 | [Developer Name] | [Roll #] | Developer | Admissions Page | CD Production |
| 5 | [Developer Name] | [Roll #] | Developer | Contact Page | HTML/CSS Linting |

## 📄 Website Pages

1. **Home Page** (`index.html`) - Overview of the department, mission statement, and highlights
2. **Courses Page** (`courses.html`) - List of offered courses with descriptions
3. **Faculty Page** (`faculty.html`) - Faculty profiles and specializations
4. **Admissions Page** (`admissions.html`) - Admission criteria and application process
5. **Contact Page** (`contact.html`) - Department contact details and contact form

## 🏗️ Project Structure

```
term-project/
├── .github/
│   └── workflows/
│       ├── ci.yml                 # CI Pipeline (Lint & Build)
│       ├── cd.yml                 # CD Pipeline - Development
│       ├── cd-staging.yml         # CD Pipeline - Staging/QA
│       └── cd-production.yml      # CD Pipeline - Production
├── src/
│   ├── index.html                 # Home page
│   ├── courses.html               # Courses page
│   ├── faculty.html               # Faculty page
│   ├── admissions.html            # Admissions page
│   └── contact.html               # Contact page
├── styles/
│   └── style.css                  # Main stylesheet
├── .htmlhintrc                    # HTML linting configuration
├── .stylelintrc.json              # CSS linting configuration
├── Dockerfile                     # Docker container configuration
└── README.md                      # Project documentation
```

## 🔄 Git Flow Workflow

### Branch Strategy

```
main (production)
  └── release (staging/QA)
       └── develop (development)
            └── feature/* (feature branches)
```

### Branch Descriptions

- **`main`** - Production-ready code, deployed to production environment
- **`release`** - Release candidates, deployed to staging/QA environment
- **`develop`** - Integration branch, deployed to development environment
- **`feature/*`** - Individual feature development branches

### Development Workflow

1. Create feature branch from `develop`
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-feature-name
   ```

2. Develop and commit changes
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

3. Push feature branch and create Pull Request
   ```bash
   git push origin feature/your-feature-name
   ```

4. After PR approval, merge to `develop`
5. Test in development environment
6. Merge `develop` to `release` for staging testing
7. Merge `release` to `main` for production deployment

## 🐳 Docker Containerization

### Dockerfile

The website is containerized using Nginx Alpine for minimal size:

```dockerfile
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY src/ /usr/share/nginx/html/
COPY styles/ /usr/share/nginx/html/styles/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### Build and Run Locally

```bash
# Build Docker image
docker build -t cs-department-website .

# Run container locally
docker run -d -p 8080:80 cs-department-website

# Access at http://localhost:8080
```

## 🔧 CI/CD Pipelines

### CI Pipeline (Continuous Integration)

**Trigger:** Push or PR to `develop`, `release`, or `main`

**Steps:**
1. Checkout repository
2. Setup Node.js environment
3. Install HTMLHint and Stylelint
4. **Lint HTML files** in `src/` directory
5. **Lint CSS files** in `styles/` directory
6. Build Docker image
7. Test Docker container

### CD Pipelines (Continuous Deployment)

#### Development CD Pipeline
- **Trigger:** Push to `develop` branch
- **Environment:** Development
- **Deploys to:** Render.com development service

#### Staging/QA CD Pipeline
- **Trigger:** Push to `release` branch
- **Environment:** Staging
- **Deploys to:** Render.com staging service

#### Production CD Pipeline
- **Trigger:** Push to `main` branch
- **Environment:** Production
- **Deploys to:** Render.com production service

## 🔐 Secrets Management

### GitHub Environments

Three GitHub Environments are configured:
- `development`
- `staging`
- `production`

### Required Secrets (per environment)

| Secret Name | Description |
|------------|-------------|
| `RENDER_API_KEY` | Render.com API key for deployments |
| `RENDER_SERVICE_ID` | Specific Render service ID for each environment |

### Setting Up Secrets

1. Go to Repository Settings → Environments
2. Create three environments: `development`, `staging`, `production`
3. Add secrets to each environment:
   - `RENDER_API_KEY` - Your Render API key
   - `RENDER_SERVICE_ID` - Specific service ID for that environment

## 🧪 Linting Configuration

### HTML Linting (.htmlhintrc)

- Enforces HTML5 standards
- Validates tag pairs and attributes
- Checks for unique IDs and proper doctype
- Requires alt text for images and page titles

### CSS Linting (.stylelintrc.json)

- Extends `stylelint-config-standard`
- Validates color codes
- Checks syntax and formatting

### Running Linters Locally

```bash
# Install linters
npm install -g htmlhint stylelint stylelint-config-standard

# Lint HTML files
htmlhint "src/**/*.html"

# Lint CSS files
stylelint "styles/**/*.css"
```

## 🚀 Deployment Process

### Automatic Deployments

1. **Development:** Push to `develop` → Auto-deploys to dev environment
2. **Staging:** Merge to `release` → Auto-deploys to staging environment
3. **Production:** Merge to `main` → Auto-deploys to production environment

### Manual Deployments

Workflows can be triggered manually:
1. Go to Actions tab
2. Select desired CD workflow
3. Click "Run workflow"
4. Choose branch and run

## 📊 Evaluation Criteria

| Category | Marks | Status |
|----------|-------|--------|
| Repository setup and collaboration | 10 | ✅ |
| HTML/CSS development and page quality | 25 | ✅ |
| Dockerization and CI pipelines | 20 | ✅ |
| Multi-environment CD pipelines | 25 | ✅ |
| Git Flow, branch protection, and documentation | 20 | ✅ |
| **Total** | **100** | |

## 🛠️ Technologies Used

- **Frontend:** HTML5, CSS3
- **Containerization:** Docker, Nginx Alpine
- **CI/CD:** GitHub Actions
- **Deployment:** Render.com
- **Version Control:** Git, GitHub
- **Linting:** HTMLHint, Stylelint
- **Workflow:** Git Flow

## 📝 Contributing

### For Team Members

1. Clone the repository
2. Create your feature branch from `develop`
3. Develop your assigned web page
4. Ensure code passes linting
5. Create Pull Request to `develop`
6. Wait for review and approval

### Code Standards

- Use semantic HTML5 elements
- Follow consistent CSS naming conventions
- Ensure responsive design
- Add comments for complex sections
- Test locally before pushing

## 🔍 Testing

### Local Testing

```bash
# Test with Docker
docker build -t test-website .
docker run -d -p 8080:80 test-website
curl http://localhost:8080
```

### Automated Testing

- CI pipeline runs on every push
- HTML/CSS linting validates code quality
- Docker build ensures containerization works
- Container test verifies deployment readiness

## 📚 Documentation

- **Project Requirements:** See term project document
- **Git Flow Guide:** [Atlassian Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
- **Docker Documentation:** [Docker Docs](https://docs.docker.com/)
- **GitHub Actions:** [GitHub Actions Docs](https://docs.github.com/en/actions)

## 🐛 Troubleshooting

### Common Issues

**Issue:** Linting fails
- **Solution:** Run linters locally and fix reported issues

**Issue:** Docker build fails
- **Solution:** Check Dockerfile syntax and file paths

**Issue:** Deployment fails
- **Solution:** Verify secrets are set correctly in GitHub Environments

**Issue:** CSS not loading
- **Solution:** Check file paths in HTML files (should be `../styles/style.css`)

## 📞 Support

For issues or questions:
1. Check existing GitHub Issues
2. Create new issue with detailed description
3. Contact team lead
4. Refer to project documentation

## 📄 License

This project is developed as part of a university term project for educational purposes.

---

**Repository:** [https://github.com/Kh-faheem/term-project.git](https://github.com/Kh-faheem/term-project.git)

**Developed by:** Computer Science Department DevOps Team

**Last Updated:** January 2026