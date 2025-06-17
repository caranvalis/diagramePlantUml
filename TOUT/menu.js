// Menu dynamique pour la navigation entre pages HTML
const menuItems = [
  { label: "Documentation Maître", file: "DOCUMENTATION_MASTER.html" },
  { label: "Statut Global", file: "STATUS_GLOBAL_FINAL.html" },
  { label: "Spécifications Système", file: "KYC-System-Specifications.html" },
  { label: "Template Classe", file: "KYC DIAGRAMME DE CLASSE/TEMPLATE_DIAGRAMME_CLASSE.html" },
  { label: "Activité - README", file: "KYC DIAGRAMME D'ACTIVITÉ/README.html" },
  { label: "Système Ouverture Compte", file: "SYSTEME-OUVERTURE-COMPTE/README.html" },
  { label: "Résumé Cahier des Charges", file: "SYSTEME-OUVERTURE-COMPTE/RESUME_CAHIER_DES_CHARGES.html" },
  { label: "Grandes Étapes", file: "SYSTEME-OUVERTURE-COMPTE/GRANDES_ETAPES_CAHIER_DES_CHARGES.html" },
  { label: "Standardisation Couleurs", file: "SYSTEME-OUVERTURE-COMPTE/STANDARDISATION_COULEURS.html" },
  { label: "Synthèse Comparative", file: "SYSTEME-OUVERTURE-COMPTE/SYNTHESE_COMPARATIVE_FINALE.html" }
];

function renderMenu() {
  const nav = document.createElement('nav');
  nav.className = 'nav-md';
  menuItems.forEach(item => {
    const btn = document.createElement('a');
    btn.href = item.file;
    btn.textContent = item.label;
    btn.className = 'menu-btn';
    nav.appendChild(btn);
  });
  document.body.insertBefore(nav, document.body.firstChild);
}

document.addEventListener('DOMContentLoaded', renderMenu);
