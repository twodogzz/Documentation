# Project Wizard PSM1 App - Implementation Project Plan  
***
## 1. Define the scope and architecture  
This phase locks in what the Wizard is and is not, ensuring the design stays aligned with your Ecosystem Roadmap.  
Goals  
   - Provide a deterministic, auditable way to create new project folders.  
   - Produce a consistent structure for all software projects.  
   - Integrate cleanly with Repo Manager and future automation.  
   - Use a PowerShell module with multiple exported commands.  
   - Maintain a machine‑readable master metadata file.  

Deliverables
   - Module command list (locked in).  
   - Folder structure for the module.  
   - Decision: JSON as the master metadata format.  
   - Template file list.  

## 2. Design the module structure  
This phase defines how the module is organised on disk and how functions interact.  
Tasks  
   - [ ] 2-1. Create the module folder under _ecosystem.  
   - [ ] 2-2. Create NewProjectWizard.psm1 and NewProjectWizard.psd1.  
   - [ ] 2-3. Create a functions folder for individual .ps1 files.  
   - [ ] 2-4. Create a templates folder for boilerplate files.  
   - [ ] 2-5. Define the internal API (function signatures, parameters, return objects).  
   - [ ] 2-6. Define logging strategy (project log + global log).  

Deliverables  
   - Module folder structure.  
   - Function signatures.
   - Logging conventions.
   - Template file placeholders.

## 3. Build the core functions
Each function is implemented independently, with isolated responsibilities and testability.  

Functions to implement  
   - Write-Log
   - Get-ProjectMetadata
   - New-ProjectFolder
   - New-ProjectSubfolders
   - New-ProjectFiles
   - Initialize-GitRepository
   - Invoke-RepoManager
   - Update-MasterProjectList
   - New-Project (orchestrator)

Tasks
   - [ ] 3-1. Implement each function in its own .ps1 file.
   - [ ] 3-2. Ensure each function logs actions.
   - [ ] 3-3. Ensure no destructive actions occur without confirmation.
   - [ ] 3-4. Ensure all functions return structured objects where appropriate.

Deliverables
   - Fully implemented module functions.
   - Internal documentation comments for each function.

## 4. Implement the template system
Templates ensure deterministic, consistent project scaffolding.  

Tasks  

   - [ ] 4-1. Create .gitignore template.  
   - [ ] 4-2. Create LICENSE template.  
   - [ ] 4-3. Create README.md template with placeholders.  
   - [ ] 4-4. Create project.json template (optional, if richer schema desired).  
   - [ ] 4-5. Store templates in the module’s templates folder.  
   - [ ] 4-6. Implement placeholder replacement logic in New-ProjectFiles.  

Deliverables  
    - All template files.  
    - Template replacement engine.  

## 5. Implement the MasterProjectList system  
This is the backbone of your ecosystem’s metadata.  

Tasks  
   - [ ] 5-1. Create MasterProjectList.json if missing.
   - [ ] 5-2. Implement JSON load/append/save logic.
   - [ ] 5-3. Ensure IDs auto-increment.
   - [ ] 5-4. Ensure entries include all required metadata.
   - [ ] 5-5. Add logging for each update.

Deliverables
- Working JSON master list.
- Reliable update function.

## 6. Integrate with Repo Manager  
The Wizard must hand off cleanly to your existing Repo Manager.  

Tasks  
   - [ ] 6-1. Confirm Repo Manager accepts a -ProjectPath parameter.
   - [ ] 6-2. Implement Invoke-RepoManager to call it safely.
   - [ ] 6-3. Add user confirmation prompt.
   - [ ] 6-4. Add logging.

Deliverables
- Seamless integration with Repo Manager.
- Logged invocation.

## 7. Testing and validation
This phase ensures the Wizard behaves deterministically and safely.  

Tasks  
   - [ ] 7-1. Test each function independently.
   - [ ] 7-2. Test the orchestrator (New-Project) end‑to‑end.
   - [ ] 7-3. Test behaviour when folders already exist.
   - [ ] 7-4. Test Git initialisation.
   - [ ] 7-5. Test Repo Manager invocation.
   - [ ] 7-6. Test MasterProjectList updates.
   - [ ] 7-7. Test template generation.
   - [ ] 7-8. Test logging output.

Deliverables
- Verified module behaviour.
- Clean logs.
- Updated MasterProjectList.json.

## 8. Documentation and onboarding
Documenting the Wizard ensures future maintainability and smooth evolution.  

Tasks  
- [ ] 8-1. Write module README.
- [ ] 8-2. Document each function’s purpose and parameters.
- [ ] 8-3. Document template structure.
- [ ] 8-4. Document the MasterProjectList schema.
- [ ] 8-5. Document how Repo Manager integrates.
- [ ] 8-6. Document how to import and use the module.  

Deliverables  
- Complete module documentation.  
- Developer onboarding guide.  

## 9. Deployment and integration into the ecosystem  
Once validated, the Wizard becomes part of your daily workflow.  

Tasks  
- [ ] 9-1. Install the module into your PowerShell profile path.
- [ ] 9-2. Add import statements to your automation scripts.
- [ ] 9-3. Update Repo Manager documentation to reference the Wizard.
- [ ] 9-4. Update Push‑All‑Projects to rely on the master metadata file.
- [ ] 9-5. Add versioning to the module manifest.  

Deliverables
- Fully deployed New Project Wizard.
- Updated ecosystem tools.
- Versioned module.

## 10. Future evolution (post‑deployment)  
This phase aligns with your long‑term roadmap.  

Opportunities  
- Add Python orchestration layer.
- Add GitHub API integration.
- Add GitHub Projects board automation.
- Add documentation generation (Markdown → RTF/PDF).
- Add project dashboards.
- Add version bump automation.
- Add project health checks.  

Deliverables  
- Roadmap for Wizard v2 and v3.
- Integration points for Python CLI.
