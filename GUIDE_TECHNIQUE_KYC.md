# 🔧 GUIDE TECHNIQUE - ARCHITECTURE KYC MICROSERVICES

## 📋 Architecture Overview

### 🏗️ Stack Technique
```yaml
Architecture: Microservices Event-Driven
Container: Docker + Kubernetes
API Gateway: Kong/Zuul avec authentification JWT
Cache: Redis Cluster
Database: PostgreSQL + MongoDB
Message Queue: RabbitMQ/Apache Kafka
Monitoring: Prometheus + Grafana + ELK
Security: OAuth 2.0 + OpenID Connect
```

### 🌐 Services Map
```
┌─────────────────┐
│   API Gateway   │ ← Point d'entrée unique
└─────────────────┘
         │
┌─────────────────┐
│  Orchestrateur  │ ← Coordination workflows
└─────────────────┘
         │
┌─────────────────┬─────────────────┬─────────────────┐
│ Service Client  │ Service Compte  │ Service Document│ ← Services Métier
└─────────────────┴─────────────────┴─────────────────┘
         │
┌─────────────────┬─────────────────┬─────────────────┐
│ Service Auth    │ Service Audit   │ Service Cache   │ ← Services Techniques
└─────────────────┴─────────────────┴─────────────────┘
         │
┌─────────────────┬─────────────────┬─────────────────┐
│   Base KYC      │   Redis Cache   │  Message Queue  │ ← Infrastructure
└─────────────────┴─────────────────┴─────────────────┘
```

## 🔄 Patterns Architecturaux

### 🎯 Event Sourcing
```javascript
// Exemple d'événement KYC
{
  "eventId": "kyc-001-20250614-001",
  "eventType": "ClientValidated",
  "aggregateId": "client-12345",
  "timestamp": "2025-06-14T12:00:00Z",
  "data": {
    "clientId": "12345",
    "validationType": "AUTO",
    "riskScore": 0.15,
    "status": "APPROVED"
  },
  "metadata": {
    "userId": "agent-001",
    "correlationId": "req-789",
    "version": "1.0"
  }
}
```

### 🛡️ Circuit Breaker Pattern
```yaml
circuit_breaker:
  failure_threshold: 5
  timeout: 30s
  retry_attempts: 3
  fallback_response: "Service temporarily unavailable"
```

### 📊 CQRS Implementation
```
Command Side:          Query Side:
┌─────────────┐       ┌─────────────┐
│   Commands  │──────→│    Events   │
└─────────────┘       └─────────────┘
       │                      │
┌─────────────┐       ┌─────────────┐
│ Write Model │       │ Read Models │
└─────────────┘       └─────────────┘
```

## 🔒 Sécurité et Authentification

### 🎫 JWT Token Structure
```json
{
  "header": {
    "alg": "RS256",
    "typ": "JWT"
  },
  "payload": {
    "sub": "user-12345",
    "iss": "kyc-auth-service",
    "aud": "kyc-services",
    "exp": 1625097600,
    "iat": 1625094000,
    "roles": ["kyc-agent", "document-validator"],
    "permissions": ["read:client", "write:validation"]
  }
}
```

### 🔐 API Security Headers
```http
Authorization: Bearer <JWT_TOKEN>
X-API-Key: <API_KEY>
X-Correlation-ID: <UNIQUE_REQUEST_ID>
X-Client-Version: 1.0.0
Content-Type: application/json
```

## 📊 Modèle de Données

### 👤 Client Entity
```sql
CREATE TABLE clients (
    client_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    birth_date DATE,
    nationality VARCHAR(3),
    risk_score DECIMAL(3,2),
    status client_status_enum,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    version INTEGER DEFAULT 1
);
```

### 📄 Document Schema
```sql
CREATE TABLE documents (
    document_id UUID PRIMARY KEY,
    client_id UUID REFERENCES clients(client_id),
    document_type document_type_enum,
    file_path VARCHAR(500),
    mime_type VARCHAR(100),
    file_size BIGINT,
    checksum VARCHAR(64),
    status document_status_enum,
    validation_result JSONB,
    expires_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);
```

## 🚀 APIs et Endpoints

### 🎯 Service Client API
```yaml
/api/v1/clients:
  GET:    # Lister clients avec pagination
  POST:   # Créer nouveau client
  
/api/v1/clients/{clientId}:
  GET:    # Détails client
  PUT:    # Mise à jour complète
  PATCH:  # Mise à jour partielle
  DELETE: # Suppression logique

/api/v1/clients/{clientId}/risk-assessment:
  POST:   # Déclencher évaluation risque
  GET:    # Consulter scoring actuel
```

### 📄 Service Document API
```yaml
/api/v1/documents:
  POST:   # Upload document
  GET:    # Lister documents avec filtres

/api/v1/documents/{documentId}:
  GET:    # Télécharger document
  PUT:    # Mettre à jour métadonnées
  DELETE: # Supprimer document

/api/v1/documents/{documentId}/validate:
  POST:   # Valider document
  GET:    # Statut validation
```

## 🔄 Message Queues et Events

### 📨 Event Types
```typescript
enum KYCEventType {
  CLIENT_CREATED = 'client.created',
  CLIENT_UPDATED = 'client.updated',
  DOCUMENT_UPLOADED = 'document.uploaded',
  DOCUMENT_VALIDATED = 'document.validated',
  RISK_ASSESSED = 'risk.assessed',
  ACCOUNT_CREATED = 'account.created',
  COMPLIANCE_CHECKED = 'compliance.checked'
}
```

### 🎯 Queue Configuration
```yaml
queues:
  kyc_events:
    durable: true
    auto_delete: false
    routing_key: 'kyc.*'
    
  document_processing:
    durable: true
    max_length: 10000
    routing_key: 'document.*'
    
  notifications:
    durable: false
    ttl: 300000  # 5 minutes
    routing_key: 'notification.*'
```

## 📈 Monitoring et Observabilité

### 🎯 Métriques Clés
```yaml
business_metrics:
  - onboarding_completion_rate
  - average_processing_time
  - compliance_check_success_rate
  - document_validation_accuracy

technical_metrics:
  - api_response_time_p95
  - error_rate_percentage
  - throughput_requests_per_second
  - service_availability_percentage
```

### 📊 Health Checks
```javascript
// Exemple health check endpoint
GET /health
{
  "status": "UP",
  "timestamp": "2025-06-14T12:00:00Z",
  "services": {
    "database": "UP",
    "redis": "UP",
    "message_queue": "UP",
    "external_apis": "UP"
  },
  "metrics": {
    "uptime": "72h 15m",
    "memory_usage": "68%",
    "cpu_usage": "23%"
  }
}
```

## 🧪 Tests et Validation

### 🔬 Strategy de Tests
```yaml
unit_tests:
  coverage_target: 85%
  framework: Jest/JUnit
  
integration_tests:
  framework: TestContainers
  database: H2/TestcontainersPostgreSQL
  
e2e_tests:
  framework: Cypress/Selenium
  environment: staging
  
performance_tests:
  framework: JMeter/K6
  target_rps: 1000
  max_response_time: 200ms
```

### 📊 Test Data Management
```sql
-- Test data pour environnements
INSERT INTO test_clients (
  client_id, 
  first_name, 
  last_name, 
  email, 
  status
) VALUES 
  ('test-001', 'John', 'Doe', 'john.doe@test.com', 'PENDING'),
  ('test-002', 'Jane', 'Smith', 'jane.smith@test.com', 'APPROVED'),
  ('test-003', 'Bob', 'Wilson', 'bob.wilson@test.com', 'REJECTED');
```

## 🐳 Containerisation et Déploiement

### 📦 Dockerfile Template
```dockerfile
FROM openjdk:17-jre-slim

WORKDIR /app
COPY target/kyc-service.jar app.jar

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=60s \
  CMD curl -f http://localhost:8080/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
```

### ☸️ Kubernetes Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kyc-client-service
spec:
  replicas: 3
  selector:
    matchLabels:
      app: kyc-client-service
  template:
    metadata:
      labels:
        app: kyc-client-service
    spec:
      containers:
      - name: kyc-client-service
        image: kyc/client-service:latest
        ports:
        - containerPort: 8080
        env:
        - name: DB_HOST
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: host
        resources:
          requests:
            memory: "512Mi"
            cpu: "250m"
          limits:
            memory: "1Gi"
            cpu: "500m"
```

## 🔧 Configuration et Environnements

### ⚙️ Application Configuration
```yaml
# application.yml
spring:
  profiles:
    active: ${SPRING_PROFILE:dev}
  datasource:
    url: ${DB_URL:jdbc:postgresql://localhost:5432/kyc}
    username: ${DB_USER:kyc_user}
    password: ${DB_PASSWORD:secret}
  redis:
    host: ${REDIS_HOST:localhost}
    port: ${REDIS_PORT:6379}
    
kyc:
  security:
    jwt:
      secret: ${JWT_SECRET}
      expiration: ${JWT_EXPIRATION:3600}
  compliance:
    auto_validation_threshold: ${AUTO_VALIDATION_THRESHOLD:0.8}
    manual_review_required: ${MANUAL_REVIEW:false}
```

### 🌍 Environnements
```yaml
environments:
  development:
    replicas: 1
    resources: minimal
    debug: enabled
    
  staging:
    replicas: 2
    resources: medium
    debug: disabled
    monitoring: basic
    
  production:
    replicas: 5
    resources: high
    debug: disabled
    monitoring: full
    backup: enabled
    encryption: enforced
```

---

**🔧 Guide technique maintenu par l'équipe Architecture KYC**  
**📅 Dernière mise à jour : 14 juin 2025**  
**📧 Contact : architecture-kyc@bank.com**
