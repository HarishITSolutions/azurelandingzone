module "PolicyandInitiativeCreation"{
    source     =  "./modules/policy/"
    sourceYAML =  var.sourcePolicyYAML
}

locals  {
    mgSource = yamldecode(file("${path.root}/${var.sourceMG-YAML}"))
    mg       = local.mgSource.managementGroups
        
 }

module "MG-RA-POL-INL-Assignment" {
    source    =  "./moudles/mg/"
    scope     =  local.mg
    sourceYAML = var.sourceMG-YAML
    ROOTmg     = VAR.TENATROOTmg
    #depends_on = [module.PolicyandInitiativeCreation]
}