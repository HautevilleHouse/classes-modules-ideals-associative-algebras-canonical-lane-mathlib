import canonicalLaneMathlib.AdmissibleClass

/-!
# Projective Module Closure

This module defines projective modules and provides evidence of
the projective lifting property.
-/

namespace HautevilleHouse
namespace ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

open HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean

structure ProjectiveModule {A : AssocAlgebra} (P : ModuleOverAssocAlgebra A) where
  liftingProperty : ∀ (M N : ModuleOverAssocAlgebra A) (f : ModuleMorphism P N) (g : ModuleMorphism M N)
    (gsurj : ∀ z : N.moduleCarrier, ∃ x : M.moduleCarrier, g.map x = z),
    ∃ (h : ModuleMorphism P M), ∀ x : P.moduleCarrier, g.map (h.map x) = f.map x

def ProjectiveModuleClosed {A : AssocAlgebra} (P : ModuleOverAssocAlgebra A) : Prop :=
  Nonempty (ProjectiveModule P)

theorem projective_module_closed_from_evidence {A : AssocAlgebra} (P : ModuleOverAssocAlgebra A) (proj : ProjectiveModule P) :
  ProjectiveModuleClosed P :=
  Nonempty.intro proj

end HautevilleHouse.ClassesModulesIdealsAssociativeAlgebrasCanonicalLaneLean
end HautevilleHouse